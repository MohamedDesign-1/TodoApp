import 'package:flutter/material.dart';

class SelectLanguage extends ChangeNotifier {

  String appLanguage = 'en';

  changeLanguage(String newLang) {
    appLanguage = newLang;
    notifyListeners();
  }
}