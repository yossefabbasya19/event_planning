import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfigProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLanguage = "en";

  void configTheme(ThemeMode themeMode) {
    if (themeMode == currentTheme) return;
    currentTheme = themeMode;
    print(currentTheme);
    notifyListeners();
  }
  void configLanguage(String language){
    if(currentLanguage == language)return;
    currentLanguage = language;
    notifyListeners();
  }
}
