import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DarkTheameProvider with ChangeNotifier{

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}