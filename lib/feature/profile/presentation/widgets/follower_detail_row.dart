import 'package:flutter/widgets.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:mdp2/feature/profile/presentation/widgets/follower_detail_column.dart';
import 'package:mdp2/feature/profile/presentation/widgets/profile_avatar.dart';

class FollowerDetailRow extends StatelessWidget {
  const FollowerDetailRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: ProfileAvatar()),
        Expanded(
          child: FollowerDetailColumn(
            count: '3',
            label: FlutterI18n.translate(
              context,
              'profile_page.posts',
            ),
          ),
        ),
        Expanded(
          child: FollowerDetailColumn(
            count: '416',
            label: FlutterI18n.translate(
              context,
              'profile_page.followers',
            ),
          ),
        ),
        Expanded(
          child: FollowerDetailColumn(
            count: '379',
            label: FlutterI18n.translate(
              context,
              'profile_page.following',
            ),
          ),
        ),
      ],
    );
  }
}
