import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension TranslateExtension on WidgetRef {
  String translate(String key) => FlutterI18n.translate(context, key);
}
