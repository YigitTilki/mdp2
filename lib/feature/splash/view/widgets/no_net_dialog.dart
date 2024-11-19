import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/feature/splash/view_model/splash_view_model.dart';
import 'package:mdp2/product/helper/extensions/translate_extension.dart';

class NoNetDialog extends ConsumerWidget {
  const NoNetDialog({super.key});

  static Future<void> show(BuildContext context) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const NoNetDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splashViewModel = ref.read(splashViewModelProvider.notifier);
    return AlertDialog(
      title: Text(ref.translate('general.no_internet')),
      content: ElevatedButton(
        onPressed: () async {
          Navigator.of(context).pop();
          await splashViewModel.reload();
        },
        child: Text(ref.translate('general.try_again')),
      ),
    );
  }
}
