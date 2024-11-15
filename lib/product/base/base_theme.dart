import 'package:flutter/material.dart';

abstract class BaseTheme {
  ThemeData get themeData;
  ColorScheme get colorScheme;
  TextTheme get textTheme;
  String get appFont;
  ElevatedButtonThemeData get elevatedButtonThemeData;
  AppBarTheme get appBarTheme;
  ListTileThemeData get listTileThemeData;
}
