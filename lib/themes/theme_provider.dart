import 'package:flutter/material.dart';
import 'package:minimal_chat/themes/dark_mode.dart';
import 'package:minimal_chat/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightmode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightmode) {
      themeData = darkMode;
    } else {
      themeData = lightmode;
    }
  }
}
