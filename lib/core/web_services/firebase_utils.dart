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
      await verifyEmail();
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

  static verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
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
    debugPrint("Email signed in using google : ${user.user!.email}");
    return right(user);
  }
}
