import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/product/helper/extensions/theme_extension.dart';

class FollowerDetailColumn extends ConsumerWidget {
  const FollowerDetailColumn({
    required this.count,
    required this.label,
    super.key,
  });

  final String count;
  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(
          count,
          style: ref.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          label,
          style: ref.textTheme.bodySmall,
        ),
      ],
    );
  }
}
