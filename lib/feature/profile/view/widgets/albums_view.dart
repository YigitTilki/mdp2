import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/home/model/user.dart';
import 'package:mdp2/feature/profile/model/profile_state.dart';
import 'package:mdp2/feature/profile/view_model/profile_view_model.dart';
import 'package:mdp2/main.dart';
import 'package:mdp2/product/navigation/app_router.dart';

class AlbumsView extends ConsumerWidget {
  const AlbumsView({
    required this.profileModel,
    required this.userModel,
    super.key,
  });

  final User userModel;
  final ProfileState profileModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        await ref
            .read(profileViewModelProvider(userModel.id.toString()).notifier)
            .reloadFailedImages();
      },
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: profileModel.albums?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          final imageUrl = profileModel.imageUrls?[index] ?? '';

          return Stack(
            alignment: Alignment.topRight,
            children: [
              InkWell(
                onTap: () => appRouter.push(
                  PostsRoute(
                    profileModel: profileModel,
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
                      ref
                          .read(
                            profileViewModelProvider(userModel.id.toString())
                                .notifier,
                          )
                          .failedImages
                          .add(index);
                      return InkWell(
                        onTap: () => ref
                            .read(
                              profileViewModelProvider(
                                userModel.id.toString(),
                              ).notifier,
                            )
                            .reloadImage(index),
                        child: const Center(child: Icon(Icons.refresh)),
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
