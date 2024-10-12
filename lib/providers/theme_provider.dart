import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode appThemeMode = ThemeMode.light;
  bool get isDark => appThemeMode == ThemeMode.dark;
  changeThemeMode(ThemeMode themeMode) {
    appThemeMode = themeMode;
    notifyListeners();
  }
}
