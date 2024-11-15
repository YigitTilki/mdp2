import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/product/helper/app_spacer.dart';

class EditShareRow extends ConsumerWidget {
  const EditShareRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            child: Text(
              FlutterI18n.translate(
                context,
                'profile_page.edit_profile',
              ),
            ),
          ),
        ),
        const AppSpacer.horizontal10(),
        Expanded(
          flex: 4,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            child: Text(
              FlutterI18n.translate(
                context,
                'profile_page.share_profile',
              ),
            ),
          ),
        ),
        const AppSpacer.horizontal10(),
        Expanded(
          child: IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            icon: const Icon(Icons.person_add),
          ),
        ),
      ],
    );
  }
}
