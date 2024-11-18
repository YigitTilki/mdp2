import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/home/model/user.dart';
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
        itemBuilder: (context, index) {
          final imageUrl = profileModel.imageUrls?[index] ?? '';

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
              Padding(
                padding: const AppPadding.symHNormal(),
                child: Column(
                  children: [
                    Text(userModel.username),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
