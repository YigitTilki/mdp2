import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/home/domain/user_model/user_model.dart';
import 'package:mdp2/feature/profile/application/profile_provider.dart';
import 'package:mdp2/product/helper/app_padding.dart';

@RoutePage()
class PostsView extends ConsumerWidget {
  const PostsView({
    required this.userModel,
    required this.initialIndex,
    super.key,
  });

  final UserModel userModel;
  final int initialIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gönderiler'),
        forceMaterialTransparency: true,
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: state.albums.value?.length ?? 0,
        controller: PageController(initialPage: initialIndex),
        itemBuilder: (context, index) {
          final imageUrl = state.imageUrls.value?[index] ?? '';

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const AppPadding.symHSmall(),
                leading: const CircleAvatar(
                  radius: 20,
                ),
                title: Text(userModel.username ?? ''),
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
                    Text(userModel.username ?? ''),
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
