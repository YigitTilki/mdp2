import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/home/model/user.dart';
import 'package:mdp2/product/helper/app_spacer.dart';
import 'package:mdp2/product/helper/extensions/theme_extension.dart';

class UserInfoColumn extends ConsumerWidget {
  const UserInfoColumn({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user.name,
          style:
              ref.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
        ),
        const AppSpacer.vertical5(),
        Row(
          children: [
            const Icon(Icons.business),
            const AppSpacer.horizontal5(),
            Text(user.company.name),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.home),
            const AppSpacer.horizontal5(),
            Text(user.address.city ?? ''),
          ],
        ),
      ],
    );
  }
}
