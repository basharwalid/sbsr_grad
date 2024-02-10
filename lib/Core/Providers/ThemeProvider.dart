import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode _theme  = ThemeMode.dark;
  late SharedPreferences preferences;

  Future<void> changeTheme(ThemeMode themeMode)async{
    if(themeMode == _theme) return;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _theme = themeMode;
    preferences.setString("theme" , _theme == ThemeMode.dark?"Dark" : "Light");
    notifyListeners();
  }

  bool isPurple(){
    return _theme ==ThemeMode.dark;
  }

  ThemeMode getTheme(){
    return _theme;
  }
}