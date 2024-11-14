import 'package:mdp2/feature/posts/domain/interface/i_posts_repository.dart';
import 'package:mdp2/feature/profile/domain/interface/i_profile_repository.dart';
import 'package:mdp2/feature/profile/model/album_model.dart';
import 'package:mdp2/feature/profile/model/post_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class ProfileViewModel implements IProfileRepository {
  @override
  Future<AsyncValue<List<AlbumModel>>> getUserAlbumsWithPhotos(String userId) {
    // TODO: implement getUserAlbumsWithPhotos
    throw UnimplementedError();
  }

  @override
  Future<AsyncValue<List<PostModel>>> getUserPosts(String userId) {
    // TODO: implement getUserPosts
    throw UnimplementedError();
  }
}
