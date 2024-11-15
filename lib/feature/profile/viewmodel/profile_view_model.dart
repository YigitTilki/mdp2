import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mdp2/feature/profile/model/album_model.dart';
import 'package:mdp2/feature/profile/model/photo_model.dart';
import 'package:mdp2/feature/profile/model/post_model.dart';
import 'package:mdp2/feature/profile/model/profile_model.dart';
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
  Future<ProfileModel> build(String userId) async {
    return getAll(userId);
  }

  Future<List<AlbumModel>> _getUserAlbums(String userId) async {
    try {
      final response = await dio.get<dynamic>('/users/$userId/albums');
      if (response.statusCode == 200) {
        final albums = (response.data! as List)
            .map((album) => AlbumModel.fromJson(album as Map<String, dynamic>))
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

  Future<List<PhotoModel>> _getAlbumPhotos(String albumId) async {
    try {
      final response = await dio.get<dynamic>('/albums/$albumId/photos');
      if (response.statusCode == 200) {
        final photos = (response.data! as List)
            .map((photo) => PhotoModel.fromJson(photo as Map<String, dynamic>))
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

  Future<List<AlbumModel>> getUserAlbumsWithPhotos(
    String userId,
  ) async {
    try {
      final albums = await _getUserAlbums(userId);

      for (final album in albums) {
        final photos = await _getAlbumPhotos(album.id.toString());
        album.photos = photos;
      }

      await _initializeImageUrls(albums);

      return albums;
    } catch (e) {
      logger.d('error get albums with photos: $e');
      return [];
    }
  }

  Future<List<PostModel>> getUserPosts(String userId) async {
    try {
      final response = await dio.get<dynamic>('/users/$userId/posts');
      if (response.statusCode == 200) {
        final posts = (response.data! as List)
            .map((post) => PostModel.fromJson(post as Map<String, dynamic>))
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

  Future<ProfileModel> getAll(String userId) async {
    final albums = await getUserAlbumsWithPhotos(userId);
    final posts = await getUserPosts(userId);

    return ProfileModel(
      albums: albums,
      posts: posts,
      imageUrls: _imageUrls,
      failedImages: failedImages,
    );
  }

  Future<void> _initializeImageUrls(List<AlbumModel> albums) async {
    try {
      _imageUrls.clear();
      for (var i = 0; i < albums.length; i++) {
        _imageUrls[i] = albums[i].photos?.first.url ?? '';
      }
      state = AsyncData(state.value!.copyWith(imageUrls: Map.from(_imageUrls)));
    } catch (e) {}
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

  void clearData() {
    state = const AsyncValue.data(ProfileModel());
  }
}
