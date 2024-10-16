import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode appThemeMode = ThemeMode.light;
  bool get isDark => appThemeMode == ThemeMode.dark;
  String appLocal = 'en';
  SharedPreferences? prefs;

  ThemeProvider() {
    loadTheme();
  }

  void loadTheme() async {
    prefs = await SharedPreferences.getInstance();
    bool? isDarkMode = prefs?.getBool('isDark');
    String? local = prefs?.getString('local');
    appThemeMode = isDarkMode == true ? ThemeMode.dark : ThemeMode.light;
    appLocal = local!;
    notifyListeners();
  }

  void changeThemeMode(ThemeMode themeMode) async {
    prefs = await SharedPreferences.getInstance();
    appThemeMode = themeMode;
    prefs?.setBool('isDark', themeMode == ThemeMode.dark);
    notifyListeners();
  }

  void changeAppLocal(String local) async {
    prefs = await SharedPreferences.getInstance();
    appLocal = local;
    prefs?.setString('local', appLocal);
    notifyListeners();
  }
}
