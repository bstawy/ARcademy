import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/manager/app_provider.dart';
import '../../../core/web_services/firebase_utils.dart';

class SignUpViewModel extends ChangeNotifier {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  String? _signUpStatus = "";

  GlobalKey<FormState>? get signUpFormKey => _signUpFormKey;

  TextEditingController? get fullNameController => _fullNameController;

  TextEditingController? get emailController => _emailController;

  TextEditingController? get passwordController => _passwordController;

  TextEditingController? get confirmPasswordController =>
      _confirmPasswordController;

  bool get isPasswordVisible => _isPasswordVisible;

  String? get signUpStatus => _signUpStatus;

  showPassword() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  signUpWithEmailAndPassword() async {
    final response = await FirebaseUtils.signUpWithEmailAndPassword(
      name: _fullNameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );

    response.fold(
      (l) {
        _signUpStatus = l;
      },
      (r) {
        storeUserIdInSharedPrefs(r.user!.uid);
        _signUpStatus = "success";
      },
    );

    notifyListeners();
  }

  signUpWithGoogle() async {
    final response = await FirebaseUtils.signUpWithGoogle();

    response.fold(
      (l) {
        _signUpStatus = l;
      },
      (r) {
        storeUserIdInSharedPrefs(r.user!.uid);
        _signUpStatus = "success";
      },
    );

    notifyListeners();
  }

  storeUserIdInSharedPrefs(String uid) async {
    AppProvider.userId = uid;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("UID", uid);
  }
}
