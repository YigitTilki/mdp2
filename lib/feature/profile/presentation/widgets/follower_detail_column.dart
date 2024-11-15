import 'package:flutter/widgets.dart';

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
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
        ),
      ],
    );
  }
}
