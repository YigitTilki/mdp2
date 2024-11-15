import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/home/domain/user_model/user_model.dart';
import 'package:mdp2/feature/profile/application/profile_provider.dart';
import 'package:mdp2/main.dart';
import 'package:mdp2/product/navigation/app_router.dart';

class AlbumsView extends ConsumerWidget {
  const AlbumsView({required this.userModel, super.key});

  final UserModel userModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(profileProvider.notifier).reloadFailedImages();
      },
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: state.albums.value?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          final imageUrl = state.imageUrls.value?[index] ?? '';

          return Stack(
            alignment: Alignment.topRight,
            children: [
              InkWell(
                onTap: () => appRouter.push(
                  PostsRoute(
                    userModel: userModel,
                    initialIndex: index,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) {
                      print('Error loading image: $error');
                      ref
                          .read(profileProvider.notifier)
                          .failedImages
                          .add(index);
                      return InkWell(
                        onTap: () => ref
                            .read(profileProvider.notifier)
                            .reloadImage(index),
                        child: const Icon(Icons.refresh),
                      );
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.multiple_stop,
                  color: Colors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
