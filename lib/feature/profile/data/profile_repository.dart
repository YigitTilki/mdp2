import 'package:logger/logger.dart';
import 'package:mdp2/feature/profile/domain/album_model.dart';
import 'package:mdp2/feature/profile/domain/photo_model.dart';
import 'package:mdp2/feature/profile/domain/post_model.dart';
import 'package:mdp2/product/service/api_service.dart';

class ProfileRepository {
  final _dio = ApiService().dio;
  final _logger = Logger();

  Future<List<AlbumModel>> getUserAlbums(String userId) async {
    try {
      final response = await _dio.get<dynamic>('/users/$userId/albums');
      if (response.statusCode == 200) {
        final albums = (response.data! as List)
            .map((album) => AlbumModel.fromJson(album as Map<String, dynamic>))
            .toList();
        return albums;
      } else {
        _logger.d('message: ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      _logger.d('error get albums: $e');
      return [];
    }
  }

  Future<List<PhotoModel>> getAlbumPhotos(String albumId) async {
    try {
      final response = await _dio.get<dynamic>('/albums/$albumId/photos');
      if (response.statusCode == 200) {
        final photos = (response.data! as List)
            .map((photo) => PhotoModel.fromJson(photo as Map<String, dynamic>))
            .toList();
        return photos;
      } else {
        _logger.d('message: ${response.statusMessage}');
        return [];
      }
    } catch (exception) {
      print(exception);
      return [];
    }
  }

  Future<List<AlbumModel>> getUserAlbumsWithPhotos(String userId) async {
    try {
      final albums = await getUserAlbums(userId);
      if (albums.isEmpty) return [];

      for (final album in albums) {
        final photos = await getAlbumPhotos(album.id.toString());
        album.photos = photos;
      }

      return albums;
    } catch (e) {
      _logger.d('error get albums with photos: $e');
      return [];
    }
  }

  Future<List<PostModel>> getUserPosts(String userId) async {
    try {
      final response = await _dio.get<dynamic>('/users/$userId/posts');
      if (response.statusCode == 200) {
        final posts = (response.data! as List)
            .map((post) => PostModel.fromJson(post as Map<String, dynamic>))
            .toList();
        return posts;
      } else {
        _logger.d('message: ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      _logger.d('error get posts: $e');
      return [];
    }
  }
}
