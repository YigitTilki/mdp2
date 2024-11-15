import 'package:flutter/widgets.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/profile/view/widgets/follower_detail_column.dart';
import 'package:mdp2/feature/profile/view/widgets/profile_avatar.dart';
import 'package:mdp2/product/helper/extensions/translate_extension.dart';

class FollowerDetailRow extends ConsumerWidget {
  const FollowerDetailRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const Expanded(child: ProfileAvatar()),
        Expanded(
          child: FollowerDetailColumn(
            count: '3',
            label: ref.translate(
              'profile_page.posts',
            ),
          ),
        ),
        Expanded(
          child: FollowerDetailColumn(
            count: '416',
            label: ref.translate(
              'profile_page.followers',
            ),
          ),
        ),
        Expanded(
          child: FollowerDetailColumn(
            count: '379',
            label: ref.translate(
              'profile_page.following',
            ),
          ),
        ),
      ],
    );
  }
}
