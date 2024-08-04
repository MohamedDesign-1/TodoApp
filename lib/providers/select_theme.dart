import 'package:flutter/material.dart';

class SelectTheme extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;

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
}
