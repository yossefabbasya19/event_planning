import 'package:evently_plan/core/shared_prefs/shared_prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfigProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLanguage = "en";

  void configTheme(ThemeMode themeMode) {
    if (themeMode == currentTheme) return;
    SharedPrefs().setNewTheme(themeMode==ThemeMode.light?"Light":'dark');
    currentTheme = themeMode;
    notifyListeners();
  }
  void configLanguage(String language){
    SharedPrefs().setNewLanguage(language);
    if(currentLanguage == language)return;
    currentLanguage = language;
    notifyListeners();
  }

}
