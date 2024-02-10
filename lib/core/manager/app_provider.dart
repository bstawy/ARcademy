import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../layout/layout.dart';
import '../../screens/onboarding_screens/onboarding_screens.dart';
import '../web_services/firebase_utils.dart';

class AppProvider extends ChangeNotifier {
  SharedPreferences prefs;
  static String? userId;
  ThemeMode? currentTheme;

  bool isDark() => prefs.getBool("isDark") ?? false;

  AppProvider(this.prefs) {
    userId = prefs.getString("userId") ?? "null";
    currentTheme = isDark() ? ThemeMode.dark : ThemeMode.light;
  }

  login(UserCredential user) {
    userId = user.user!.uid;
    prefs.setString("userId", userId!);
    notifyListeners();
  }

  logout() async {
    userId = 'null';
    prefs.setString("userId", "null");
    await FirebaseUtils.logOut();
    notifyListeners();
  }

  isLoggedIn() {
    if (userId == "null") {
      return OnboardingScreens.routeName;
    } else {
      return Layout.routeName;
    }
  }

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

  int _selectedScreenIndex = 0;

  int get selectedScreenIndex => _selectedScreenIndex;

  void changeCurrentScreen(int index) {
    if (_selectedScreenIndex != index) {
      _selectedScreenIndex = index;
      notifyListeners();
    }
  }
}
