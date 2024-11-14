import 'package:mdp2/feature/posts/domain/interface/i_posts_repository.dart';
import 'package:mdp2/feature/posts/domain/posts_state.dart';
import 'package:mdp2/product/base/base_notifier.dart';

class PostsNotifier extends BaseNotifier<PostsState> {
  PostsNotifier({required IPostsRepository postRepository})
      : _postsRepository = postRepository,
        super(const PostsState());

  late final IPostsRepository _postsRepository;

  Future<void> getComments(int postId) async {
    final comments = await _postsRepository.getComments(postId);
    emit(state.copyWith(comments: comments));
  }
}
