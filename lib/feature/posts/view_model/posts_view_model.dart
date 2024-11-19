import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mdp2/feature/posts/model/comment.dart';
import 'package:mdp2/product/providers/dio_provider.dart';
import 'package:mdp2/product/providers/logger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'posts_view_model.g.dart';

@riverpod
class PostsViewModel extends _$PostsViewModel {
  Dio get dio => ref.read(dioProvider);
  Logger get logger => ref.read(loggerProvider);

  @override
  Future<List<Comment>> build(String postId) async {
    return getComments(postId);
  }

  Future<List<Comment>> getComments(String postId) async {
    try {
      final response = await dio.get<dynamic>('/posts/$postId/comments');
      if (response.statusCode == 200) {
        final comments = (response.data! as List)
            .map((comment) => Comment.fromJson(comment as Map<String, dynamic>))
            .toList();
        return comments;
      } else {
        logger.d('message: ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      logger.d('error get comments: $e');
      return [];
    }
  }
}
