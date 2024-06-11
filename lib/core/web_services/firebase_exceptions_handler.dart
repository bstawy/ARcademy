import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseExceptionsHandler {
  static String handleAuthException(FirebaseAuthException e) {
    debugPrint(
        "================== Firebase Auth Exceptions ==================");
    debugPrint("${e.code} ====== ${e.message}");
    debugPrint(
        "===============================================================");
    switch (e.code) {
      case 'network-request-failed':
        return 'There seems to be a network issue. Please check your internet connection and try again.';
      case "timeout":
        return 'The request took too long. Please try again later.';
      case "invalid-credential":
        return 'The provided credential is invalid. Please check and try again';
      case "credential-already-in-use":
        return "This credential is already associated with another Firebase user";
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided for that user.';
      case "requires-recent-login":
        return "This operation requires recent login. Please sign in again before trying again";

      default:
        return 'An error occurred.';
    }
  }
}
