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
    currentTheme = isDark() ? ThemeMode.dark : ThemeMode.light;
    user = (userId == "null") ? null : getCurrentUser();
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

  storeUserIdInSharedPrefs(User currentUser) async {
    userId = currentUser.uid;
    user = currentUser;
    prefs.setString("userId", currentUser.uid);
  }

  static isLoggedIn() {
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

  logout() async {
    userId = 'null';
    prefs.setString("userId", "null");
    await FirebaseUtils.logOut();
    notifyListeners();
  }
}
