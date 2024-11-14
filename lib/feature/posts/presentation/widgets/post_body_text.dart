import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostBodyText extends ConsumerWidget {
  PostBodyText({required this.userName, required this.text, super.key});

  final String userName;
  final String text;

  final isTextExpandedProvider = StateProvider<bool>((ref) => false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = ref.watch(isTextExpandedProvider);
    return GestureDetector(
      onTap: () {
        ref.read(isTextExpandedProvider.notifier).state = !isExpanded;
      },
      child: Text.rich(
        TextSpan(
          style: const TextStyle(fontWeight: FontWeight.w700),
          text: userName,
          children: [
            TextSpan(
              text: ' $text',
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
            if (!isExpanded) const TextSpan(text: '...'),
          ],
        ),
        maxLines: isExpanded ? null : 2,
        overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
      ),
    );
  }
}
