import 'package:flutter/material.dart';

class AppManager {
  static ThemeMode currentTheme = ThemeMode.light;

  static changeTheme(ThemeMode newTheme) {
    currentTheme = newTheme;
  }
}
