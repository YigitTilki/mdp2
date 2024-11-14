import 'package:flutter/material.dart';
import 'package:mdp2/feature/home/model/user_model.dart';
import 'package:mdp2/product/helper/app_spacer.dart';

class UserInfoColumn extends StatelessWidget {
  const UserInfoColumn({required this.user, super.key});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user.name ?? '',
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        const AppSpacer.vertical5(),
        Row(
          children: [
            const Icon(Icons.business),
            const AppSpacer.horizontal5(),
            Text(user.company?.name ?? ''),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.home),
            const AppSpacer.horizontal5(),
            Text(user.address?.city ?? ''),
          ],
        ),
      ],
    );
  }
}
