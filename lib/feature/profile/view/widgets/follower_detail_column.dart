import 'package:flutter/material.dart';

class FollowerDetailColumn extends StatelessWidget {
  const FollowerDetailColumn({
    required this.count,
    required this.label,
    super.key,
  });

  final String count;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
