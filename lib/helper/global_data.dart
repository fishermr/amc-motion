import 'dart:ui';

import 'package:flutter/scheduler.dart';

class GlobalData {
  static var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  static bool bDarkMode = brightness == Brightness.dark;
}