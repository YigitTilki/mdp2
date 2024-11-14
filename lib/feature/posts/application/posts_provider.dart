import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/posts/application/posts_notifier.dart';
import 'package:mdp2/feature/posts/data/posts_repository.dart';
import 'package:mdp2/feature/posts/domain/posts_state.dart';
import 'package:mdp2/product/providers/dio_provider.dart';
import 'package:mdp2/product/providers/logger_provider.dart';

final postsNotifier = StateNotifierProvider<PostsNotifier, PostsState>((ref) {
  final dio = ref.watch(dioProvider);
  final logger = ref.watch(loggerProvider);
  return PostsNotifier(
    postRepository: PostsRepository(dio: dio, logger: logger),
  );
});
