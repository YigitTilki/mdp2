import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/posts/domain/model/comment_model.dart';

abstract class IPostsRepository {
  Future<AsyncValue<List<CommentModel>>> getComments(int postId);
}
