import 'package:flutter/material.dart';
import 'package:trivia_app/theme/dark_mode.dart';
import 'package:trivia_app/theme/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  //initally start with dark
  ThemeData _themeData = darkMode;

  ThemeData get themeData => _themeData;

  bool get isLightMode => _themeData == lightMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
  }

  void toggleTheme() {
    if (_themeData == darkMode) {
      _themeData = lightMode;
    } else {
      _themeData = darkMode;
    }
  }
}
