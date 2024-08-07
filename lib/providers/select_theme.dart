import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectTheme extends ChangeNotifier {
  ThemeMode appTheme  = ThemeMode.light;

  void selectTheme(ThemeMode newMode) {
    if (appTheme == newMode) {
      return;
    }
    appTheme = newMode;
    notifyListeners();
  }

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }

  Future<void> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool('isdark');
    if (isDark != null) {
      if (isDark == true) {
        appTheme = ThemeMode.dark;
      } else {
        appTheme = ThemeMode.light;
      }
      notifyListeners();
    }
  }

  Future<void> changeTheme(ThemeMode newMode) async {
    if (appTheme == newMode) {
      return;
    }
    appTheme = newMode;
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isdark', appTheme == ThemeMode.dark);
    notifyListeners();
    }

}
