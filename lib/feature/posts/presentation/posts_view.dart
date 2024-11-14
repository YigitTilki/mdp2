import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/home/domain/user_model/user_model.dart';
import 'package:mdp2/feature/posts/presentation/widgets/post_body_text.dart';
import 'package:mdp2/feature/profile/application/profile_provider.dart';
import 'package:mdp2/product/helper/app_padding.dart';

@RoutePage()
class PostsView extends ConsumerStatefulWidget {
  const PostsView({
    required this.userModel,
    required this.initialIndex,
    super.key,
  });

  final UserModel userModel;
  final int initialIndex;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostsViewState();
}

class _PostsViewState extends ConsumerState<PostsView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final index = widget.initialIndex;
      final itemHeight = MediaQuery.of(context).size.height - 200;
      _scrollController.jumpTo(index * itemHeight);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(FlutterI18n.translate(context, 'posts_page.posts')),
        forceMaterialTransparency: true,
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: state.albums.value?.length ?? 0,
        itemBuilder: (context, index) {
          final imageUrl = state.imageUrls.value?[index] ?? '';

          return SizedBox(
            height: (state.posts.value?[index].body?.length ?? 0) < 200
                ? MediaQuery.of(context).size.height - 200
                : MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: const AppPadding.symHSmall(),
                  leading: const CircleAvatar(
                    radius: 20,
                  ),
                  title: Text(widget.userModel.username ?? ''),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.pages),
                  ),
                ),
                Center(
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) {
                      return const Icon(Icons.error);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite),
                        ),
                        const Text('199'),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.comment),
                        ),
                        const Text('7'),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.send),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_border),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const AppPadding.symHNormal(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PostBodyText(
                          userName: widget.userModel.username ?? '',
                          text: state.posts.value?[index].body ?? '',
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: const Text('Tüm yorumları gör'),
                        ),
                        const Text('11 Ekim'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
