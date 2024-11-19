import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostBodyText extends ConsumerWidget {
  const PostBodyText({required this.userName, required this.text, super.key});

  final String userName;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text.rich(
      TextSpan(
        style: const TextStyle(fontWeight: FontWeight.w700),
        text: userName,
        children: [
          TextSpan(
            text: ' $text',
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
        ],
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
