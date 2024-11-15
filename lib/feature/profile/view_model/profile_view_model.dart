import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mdp2/feature/profile/model/album.dart';
import 'package:mdp2/feature/profile/model/photo.dart';
import 'package:mdp2/feature/profile/model/post.dart';
import 'package:mdp2/feature/profile/model/profile_state.dart';
import 'package:mdp2/product/providers/dio_provider.dart';
import 'package:mdp2/product/providers/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_view_model.g.dart';

@riverpod
class ProfileViewModel extends _$ProfileViewModel {
  Dio get dio => ref.read(dioProvider);
  Logger get logger => ref.read(loggerProvider);

  final Map<int, String> _imageUrls = {};
  final Set<int> failedImages = {};

  @override
  Future<ProfileState> build(String userId) async {
    return getAll(userId);
  }

  Future<List<Album>> _getUserAlbums(String userId) async {
    try {
      final response = await dio.get<dynamic>('/users/$userId/albums');
      if (response.statusCode == 200) {
        final albums = (response.data! as List)
            .map((album) => Album.fromJson(album as Map<String, dynamic>))
            .toList();
        return albums;
      } else {
        logger.d('message: ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      logger.d('error get user albums: $e');
      return [];
    }
  }

  Future<List<Photo>> _getAlbumPhotos(String albumId) async {
    try {
      final response = await dio.get<dynamic>('/albums/$albumId/photos');
      if (response.statusCode == 200) {
        final photos = (response.data! as List)
            .map((photo) => Photo.fromJson(photo as Map<String, dynamic>))
            .toList();
        return photos;
      } else {
        logger.d('message: ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      logger.d("error get album's photos: $e");
      return [];
    }
  }

  Future<List<Album>> getUserAlbumsWithPhotos(
    String userId,
  ) async {
    try {
      final albums = await _getUserAlbums(userId);

      for (var i = 0; i < albums.length; i++) {
        final photos = await _getAlbumPhotos(albums[i].id.toString());
        albums[i] = albums[i].copyWith(photos: photos);
      }

      await _initializeImageUrls(albums);

      return albums;
    } catch (e) {
      logger.d('error get albums with photos: $e');
      return [];
    }
  }

  Future<List<Post>> getUserPosts(String userId) async {
    try {
      final response = await dio.get<dynamic>('/users/$userId/posts');
      if (response.statusCode == 200) {
        final posts = (response.data! as List)
            .map((post) => Post.fromJson(post as Map<String, dynamic>))
            .toList();
        return posts;
      } else {
        logger.d('message: ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      logger.d('error get posts: $e');
      return [];
    }
  }

  Future<ProfileState> getAll(String userId) async {
    final albums = await getUserAlbumsWithPhotos(userId);
    final posts = await getUserPosts(userId);

    return ProfileState(
      albums: albums,
      posts: posts,
      imageUrls: _imageUrls,
      failedImages: failedImages,
    );
  }

  Future<void> _initializeImageUrls(List<Album> albums) async {
    _imageUrls.clear();
    for (var i = 0; i < albums.length; i++) {
      _imageUrls[i] = albums[i].photos?.first.url ?? '';
    }
    state = AsyncData(state.value!.copyWith(imageUrls: Map.from(_imageUrls)));
  }

  void reloadImage(int index) {
    if (_imageUrls.containsKey(index)) {
      _imageUrls[index] =
          '${_imageUrls[index]}?timestamp=${DateTime.now().millisecondsSinceEpoch}';
      failedImages.remove(index);
      state = AsyncData(state.value!.copyWith(imageUrls: Map.from(_imageUrls)));
    }
  }

  Future<void> reloadFailedImages() async {
    for (final index in failedImages) {
      if (_imageUrls.containsKey(index)) {
        _imageUrls[index] =
            '${_imageUrls[index]}?timestamp=${DateTime.now().millisecondsSinceEpoch}';
      }
    }
    failedImages.clear();
    state = AsyncData(state.value!.copyWith(imageUrls: Map.from(_imageUrls)));
  }
}
