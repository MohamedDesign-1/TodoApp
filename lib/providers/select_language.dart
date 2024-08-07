import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectLanguage extends ChangeNotifier {

  String appLanguage = 'en';

  changeLanguage(String newLang) {
    appLanguage = newLang;
    notifyListeners();
  }

  void changLang(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("code", appLanguage);
    notifyListeners();
    }
  Future<void> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String code = prefs.getString("code") ?? 'en';
    if (appLanguage == code) {
      return;
    }
    appLanguage=code;
    }
}