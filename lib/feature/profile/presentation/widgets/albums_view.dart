import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/profile/application/profile_provider.dart';

class AlbumsView extends ConsumerWidget {
  const AlbumsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: state.albums?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        final album = state.albums?[index];

        final imageUrl = album?.photos?.first.url ?? '';

        return CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) {
            print('Error loading image: $error');
            return IconButton(
              onPressed: () async {
                await ref
                    .read(profileProvider.notifier)
                    .refreshAlbum(state.albums![index].id.toString());
              },
              icon: const Icon(Icons.refresh),
            );
          },
        );
      },
    );
  }
}
