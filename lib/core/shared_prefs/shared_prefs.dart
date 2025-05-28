import 'package:evently_plan/core/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  factory SharedPrefs() {
    return instance;
  }

  late SharedPreferences sharedPrefs;
  static SharedPrefs instance = SharedPrefs._();

  SharedPrefs._();
  Future<void> init ()async{
    sharedPrefs = await SharedPreferences.getInstance();
  }
  String get currentTheme{
    return sharedPrefs.getString(sharedTheme)??"Light";
  }
  String get currentLanguage{
    return sharedPrefs.getString(sharedLanguage)??"en";
  }
  setNewTheme(String newTheme)async{
    await sharedPrefs.setString(sharedTheme, newTheme);
  }
  setNewLanguage(String newLanguage)async{
    await sharedPrefs.setString(sharedLanguage, newLanguage);
  }
}
