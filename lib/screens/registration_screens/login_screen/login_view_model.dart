import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/manager/app_provider.dart';
import '../../../core/web_services/firebase_utils.dart';

class LoginViewModel extends ChangeNotifier {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailControllerForResetPassword =
      TextEditingController();
  bool _isPasswordVisible = false;
  String? _loginStatus = "";

  GlobalKey<FormState>? get loginFormKey => _loginFormKey;

  TextEditingController? get emailController => _emailController;

  TextEditingController? get passwordController => _passwordController;

  TextEditingController? get emailForResetPassword =>
      _emailControllerForResetPassword;

  bool get isPasswordVisible => _isPasswordVisible;

  String? get loginStatus => _loginStatus;

  showPassword() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  loginWithEmailAndPassword(BuildContext context) async {
    final response = await FirebaseUtils.loginWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );

    response.fold(
      (l) {
        _loginStatus = l;
      },
      (r) {
        var appProvider = Provider.of<AppProvider>(context, listen: false);
        appProvider.storeUserIdInSharedPrefs(r.user!);
        _loginStatus = "success";
      },
    );

    notifyListeners();
  }

  loginWithGoogle(BuildContext context) async {
    final response = await FirebaseUtils.signUpWithGoogle();

    response.fold(
      (l) {
        _loginStatus = l;
      },
      (r) {
        var appProvider = Provider.of<AppProvider>(context, listen: false);
        appProvider.storeUserIdInSharedPrefs(r.user!);
        _loginStatus = "success";
      },
    );

    notifyListeners();
  }
}
