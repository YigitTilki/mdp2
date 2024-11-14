import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:mdp2/feature/profile/domain/interface/i_profile_repository.dart';
import 'package:mdp2/feature/profile/model/album_model.dart';
import 'package:mdp2/feature/profile/model/photo_model.dart';
import 'package:mdp2/feature/profile/model/post_model.dart';

class ProfileRepository implements IProfileRepository {
  ProfileRepository({
    required this.dio,
    required this.logger,
  });

  final Dio dio;
  final Logger logger;

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

  @override
  Future<AsyncValue<List<AlbumModel>>> getUserAlbumsWithPhotos(
    String userId,
  ) async {
    try {
      final albums = await _getUserAlbums(userId);
      if (albums.isEmpty) {
        return AsyncValue.error('Empty albums', StackTrace.current);
      }

      for (final album in albums) {
        final photos = await _getAlbumPhotos(album.id.toString());
        album.photos = photos;
      }

      return AsyncValue.data(albums);
    } catch (e) {
      logger.d('error get albums with photos: $e');
      return AsyncValue.error(e, StackTrace.current);
    }
  }

  @override
  Future<AsyncValue<List<PostModel>>> getUserPosts(String userId) async {
    try {
      final response = await dio.get<dynamic>('/users/$userId/posts');
      if (response.statusCode == 200) {
        final posts = (response.data! as List)
            .map((post) => PostModel.fromJson(post as Map<String, dynamic>))
            .toList();
        return AsyncValue.data(posts);
      } else {
        logger.d('message: ${response.statusMessage}');
        return AsyncValue.error('error', StackTrace.current);
      }
    } catch (e) {
      logger.d('error get posts: $e');
      return AsyncValue.error(e, StackTrace.current);
    }
  }
}
