import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/home/model/user.dart';
import 'package:mdp2/feature/posts/view/widgets/comments_sheet.dart';
import 'package:mdp2/feature/posts/view/widgets/post_body_text.dart';
import 'package:mdp2/feature/profile/model/profile_state.dart';
import 'package:mdp2/product/helper/app_padding.dart';

@RoutePage()
class PostsView extends ConsumerWidget {
  const PostsView({
    required this.userModel,
    required this.initialIndex,
    required this.profileModel,
    super.key,
  });

  final User userModel;
  final int initialIndex;
  final ProfileState profileModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gönderiler'),
        forceMaterialTransparency: true,
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: profileModel.albums?.length ?? 0,
        controller: PageController(initialPage: initialIndex),
        itemBuilder: (context, index1) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const AppPadding.symHSmall(),
                leading: const CircleAvatar(
                  radius: 20,
                ),
                title: Text(userModel.username),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.pages),
                ),
              ),
              SizedBox(
                height: 400,
                child: PageView.builder(
                  itemCount: profileModel.albums?[index1].photos?.length ?? 0,
                  itemBuilder: (context, index2) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: profileModel
                                  .albums?[index1].photos?[index2].url ??
                              '',
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Padding(
                            padding: const AppPadding.allXLarge(),
                            child: Container(
                              padding: const AppPadding.allSmall(),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black54,
                              ),
                              child: Text(
                                '${index2 + 1}/${profileModel.albums?[index1].photos?.length ?? 0}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
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
                        onPressed: () {
                          CommentsSheet.show(
                            context,
                            profileModel.posts?[index1].id.toString() ?? '',
                          );
                        },
                        icon: const Icon(Icons.comment),
                      ),
                      const Text('5'),
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
                        userName: userModel.username,
                        text: profileModel.posts?[index1].title ?? '',
                      ),
                      TextButton(
                        onPressed: () {
                          CommentsSheet.show(
                            context,
                            profileModel.posts?[index1].id.toString() ?? '',
                          );
                        },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: const Text('Tüm yorumları gör'),
                      ),
                      const Text('11 Ekim'),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
