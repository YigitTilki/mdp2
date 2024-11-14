import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import 'package:mdp2/feature/posts/domain/interface/i_posts_repository.dart';
import 'package:mdp2/feature/posts/domain/model/comment_model.dart';

class PostsRepository implements IPostsRepository {
  PostsRepository({required this.dio, required this.logger});

  final Dio dio;
  final Logger logger;

  @override
  Future<AsyncValue<List<CommentModel>>> getComments(int postId) async {
    try {
      final response = await dio.get<dynamic>('/posts/$postId/comments');
      if (response.statusCode == 200) {
        final comments = (response.data! as List)
            .map(
              (comments) =>
                  CommentModel.fromJson(comments as Map<String, dynamic>),
            )
            .toList();
        return AsyncValue.data(comments);
      } else {
        logger.d('message: ${response.statusMessage}');
        return AsyncValue.error('error', StackTrace.current);
      }
    } catch (e) {
      logger.d('error get comments: $e');
      return AsyncValue.error(e, StackTrace.current);
    }
  }
}
