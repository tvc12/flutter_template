import 'package:flutter/foundation.dart';

class Log {
  static void debug(dynamic data) {
    printConsole(data);
  }

  static void info(dynamic data) {
    printConsole(data);
  }

  static void error(dynamic data) {
    printConsole(data);
  }

  static void printConsole(dynamic data) {
    if (!kReleaseMode) {
      debugPrint(data);
    }
  }
}
