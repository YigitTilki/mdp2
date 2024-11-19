import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/posts/view_model/posts_view_model.dart';
import 'package:mdp2/product/helper/app_padding.dart';
import 'package:mdp2/product/helper/app_spacer.dart';
import 'package:mdp2/product/helper/extensions/theme_extension.dart';
import 'package:mdp2/product/helper/extensions/translate_extension.dart';

class CommentsSheet extends ConsumerWidget {
  const CommentsSheet({required this.postId, super.key});

  final String postId;

  static Future<void> show(BuildContext context, String postId) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return CommentsSheet(postId: postId);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comments = ref.watch(postsViewModelProvider(postId));

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Padding(
        padding: const AppPadding.allLarge(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                ref.translate('posts_page.comments'),
                style: ref.textTheme.titleLarge,
              ),
              const AppSpacer.vertical10(),
              comments.maybeWhen(
                loading: () => const Center(child: CircularProgressIndicator()),
                data: (data) => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(),
                          const AppSpacer.horizontal10(),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index].email!,
                                  style: ref.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const AppSpacer.vertical5(),
                                Text(
                                  data[index].body!,
                                  style: ref.textTheme.bodySmall?.copyWith(
                                    color: Colors.black54,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child:
                                      Text(ref.translate('posts_page.reply')),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                orElse: SizedBox.shrink,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
