import 'package:flutter/material.dart';
import 'package:mdp2/product/base/base_theme.dart';

final class LightTheme implements BaseTheme {
  @override
  ColorScheme get colorScheme => ColorScheme.light(
        primary: Colors.purple.shade900,
        secondary: Colors.black,
        tertiary: Colors.grey,
      );

  @override
  AppBarTheme get appBarTheme => AppBarTheme(
        color: colorScheme.surface,
        titleTextStyle: textTheme.headlineSmall,
        centerTitle: true,
        actionsIconTheme: IconThemeData(color: colorScheme.secondary, size: 30),
        iconTheme: IconThemeData(color: colorScheme.secondary, size: 30),
      );

  @override
  String get appFont => 'GeistMono';

  @override
  ElevatedButtonThemeData get elevatedButtonThemeData =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: colorScheme.onSurface,
          backgroundColor: colorScheme.tertiary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: textTheme.titleSmall,
        ),
      );

  @override
  ListTileThemeData get listTileThemeData => ListTileThemeData(
        subtitleTextStyle: textTheme.bodyMedium,
        titleTextStyle: textTheme.titleMedium,
      );

  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: colorScheme.surface,
        appBarTheme: appBarTheme,
        colorScheme: colorScheme,
        fontFamily: appFont,
        textTheme: textTheme,
        elevatedButtonTheme: elevatedButtonThemeData,
        listTileTheme: listTileThemeData,
      );

  @override
  TextTheme get textTheme => TextTheme(
        bodySmall: TextStyle(
          fontSize: 12,
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: TextStyle(
          fontSize: 36,
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          fontSize: 45,
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w700,
        ),
        displayLarge: TextStyle(
          fontSize: 57,
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w700,
        ),
      );
}
