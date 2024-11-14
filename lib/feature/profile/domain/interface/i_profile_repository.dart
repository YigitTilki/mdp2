import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/profile/model/album_model.dart';
import 'package:mdp2/feature/profile/model/post_model.dart';

abstract class IProfileRepository {
  Future<AsyncValue<List<AlbumModel>>> getUserAlbumsWithPhotos(String userId);
  Future<AsyncValue<List<PostModel>>> getUserPosts(String userId);
}
