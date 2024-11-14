import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

@immutable
final class ApplicationInitialize {
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();
    await runZonedGuarded<Future<void>>(initialize, (error, stack) {
      Logger().e(error);
    });
  }

  static Future<void> initialize() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await dotenv.load();

    FlutterError.onError = (details) {
      Logger().e(
        details.exceptionAsString(),
      );
    };
  }
}
