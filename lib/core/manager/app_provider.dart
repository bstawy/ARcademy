import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../layout/layout.dart';
import '../../screens/onboarding_screens/onboarding_screens.dart';
import '../web_services/firebase_utils.dart';

class AppProvider extends ChangeNotifier {
  static String? userId;
  SharedPreferences prefs;
  ThemeMode? currentTheme;

  AppProvider(this.prefs) {
    userId = prefs.getString("userId") ?? "null";
    currentTheme = isDark() ? ThemeMode.dark : ThemeMode.light;
  }

  // Check if dark mode is selected
  bool isDark() => prefs.getBool("isDark") ?? false;

  changeTheme(ThemeMode newTheme) {
    if (currentTheme != newTheme) {
      currentTheme = newTheme;
      addThemeValueToSF(currentTheme == ThemeMode.dark);
      notifyListeners();
    }
  }

  addThemeValueToSF(bool isDark) async {
    isDark ? prefs.setBool('isDark', true) : prefs.setBool('isDark', false);
  }

  isLoggedIn() {
    if (userId == "null") {
      return OnboardingScreens.routeName;
    } else {
      return Layout.routeName;
    }
  }

  logout() async {
    userId = 'null';
    prefs.setString("userId", "null");
    await FirebaseUtils.logOut();
    notifyListeners();
  }
}
