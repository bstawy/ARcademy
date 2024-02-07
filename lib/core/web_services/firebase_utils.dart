import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseUtils {
  static Future<Either<String?, UserCredential>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    late UserCredential user;

    try {
      user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await _verifyEmail();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
        return left('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        return left('Account already existed for that email.');
      }
      return left(e.code);
    } catch (e) {
      debugPrint(e.toString());
      return left(e.toString());
    }
    return right(user);
  }

  static Future<Either<String, UserCredential>> signUpWithGoogle() async {
    late UserCredential user;

    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      user = await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      debugPrint(e.toString());
      return left(e.toString());
    }
    return right(user);
  }

  static Future<Either<String?, UserCredential>> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    late UserCredential user;

    try {
      user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        debugPrint('Invalid login credentials');
        return left('Invalid login credentials');
      } else {
        debugPrint('${e.message}');
        return Left(e.code);
      }
    } catch (e) {
      return Left(e.toString());
    }

    if (_isVerified(user)) {
      return Right(user);
    } else {
      return const Left(
          "Email is not verified, check your inbox for verification email");
    }
  }

  static Future<String> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return e.toString();
    }
    return "success";
  }

  static _verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  static bool _isVerified(UserCredential user) {
    if (user.user!.emailVerified) {
      return true;
    } else {
      return false;
    }
  }
}
