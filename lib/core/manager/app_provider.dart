import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../layout/layout.dart';
import '../../screens/onboarding_screens/onboarding_screens.dart';
import '../web_services/firebase_utils.dart';

class AppProvider extends ChangeNotifier {
  static User? user;
  static String? userId;
  SharedPreferences prefs;
  ThemeMode? currentTheme;

  AppProvider(this.prefs) {
    userId = prefs.getString("userId") ?? "null";
    currentTheme = selectedThemeIsDark() ? ThemeMode.dark : ThemeMode.light;
    user = (userId == "null") ? null : getCurrentUser();
  }

  // Check if dark mode is selected
  bool selectedThemeIsDark() => prefs.getBool("isDark") ?? false;

  void changeTheme(ThemeMode newTheme) {
    if (currentTheme != newTheme) {
      currentTheme = newTheme;
      addThemeValueToSF(currentTheme);
      notifyListeners();
    }
  }

  void addThemeValueToSF(ThemeMode? theme) async {
    final themeIsDark = theme == ThemeMode.dark;
    if (themeIsDark) {
      prefs.setBool("isDark", true);
    } else {
      prefs.setBool("isDark", false);
    }
  }

  void storeUserIdInSharedPrefs(User currentUser) async {
    user = currentUser;
    userId = currentUser.uid;
    prefs.setString("userId", currentUser.uid);
  }

  static String isLoggedIn() {
    if (userId == "null") {
      return OnboardingScreens.routeName;
    } else {
      return Layout.routeName;
    }
  }

  User? getCurrentUser() {
    User? currentUser;
    final result = FirebaseUtils.getCurrentUserInfo();
    result.fold(
      (l) => {currentUser = null},
      (r) => {currentUser = r},
    );
    return currentUser;
  }

  void logout() async {
    userId = "null";
    user = null;
    prefs.setString("userId", "null");
    await FirebaseUtils.logOut();
    notifyListeners();
  }
}
