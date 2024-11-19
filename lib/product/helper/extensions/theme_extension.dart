import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension ThemeRef on WidgetRef {
  TextTheme get textTheme => Theme.of(context).textTheme;

  ColorScheme get colorScheme => Theme.of(context).colorScheme;
}
