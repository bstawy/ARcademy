import 'package:ar_cademy/core/web_services/firebase_exceptions_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../manager/app_provider.dart';

class FirebaseUtils {
  // ================================ Sign Up =================================
  static Future<Either<String, UserCredential>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await _verifyEmail();
      await user.user!.updateDisplayName(name);
      return right(user);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseExceptionsHandler.handleAuthException(e));
    } catch (e) {
      return left(handleException(e));
    }
  }

  static Future<Either<String, UserCredential>> signUpWithGoogle() async {
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
      UserCredential user =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return right(user);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseExceptionsHandler.handleAuthException(e));
    } catch (e) {
      return left(handleException(e));
    }
  }

  // ================================ Login =================================
  static Future<Either<String?, UserCredential>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    late UserCredential user;

    try {
      user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (_isVerified(user)) {
        return Right(user);
      } else {
        return const Left(
            "Your email address hasn't been verified yet. Please check your inbox for a verification email");
      }
    } on FirebaseAuthException catch (e) {
      return left(FirebaseExceptionsHandler.handleAuthException(e));
    } catch (e) {
      return left(handleException(e));
    }
  }

  static Future<String> resetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return "success";
    } on FirebaseAuthException catch (e) {
      return FirebaseExceptionsHandler.handleAuthException(e);
    } catch (e) {
      return handleException(e);
    }
  }

  static Future<String> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String response = await reAuthenticate(user, oldPassword);
      if (response == "success") {
        try {
          await user.updatePassword(newPassword);
          return ("success");
        } on FirebaseAuthException catch (e) {
          return FirebaseExceptionsHandler.handleAuthException(e);
        } catch (e) {
          return handleException(e);
        }
      }
      return response;
    }
    return "No user logged in";
  }

  static Future<String> reAuthenticate(User user, String oldPassword) async {
    try {
      final credential = EmailAuthProvider.credential(
          email: user.email!, password: oldPassword);
      await user.reauthenticateWithCredential(credential);
      return "success";
    } on FirebaseAuthException catch (e) {
      return FirebaseExceptionsHandler.handleAuthException(e);
    } catch (e) {
      return handleException(e);
    }
  }

  static Either<String, User> getCurrentUserInfo() {
    late User? user;
    user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Left("No user logged in");
    }
    return Right(user);
  }

  static Future<String> logOut() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      return "success";
    } on FirebaseAuthException catch (e) {
      return FirebaseExceptionsHandler.handleAuthException(e);
    } catch (e) {
      return handleException(e);
    }
  }

  static Future<String> deleteAccount() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await deleteUserDataFromFirestore();

        if (user.providerData
            .any((provider) => provider.providerId == 'google.com')) {
          if (await unlinkProvider('google.com') == "success") {
            GoogleSignIn googleSignIn = GoogleSignIn();
            await googleSignIn.signOut();
          }
        }
        user.delete();
        return "success";
      } on FirebaseAuthException catch (e) {
        return FirebaseExceptionsHandler.handleAuthException(e);
      } catch (e) {
        return handleException(e);
      }
    }
    return ("No user signed in");
  }

  static Future<String> unlinkProvider(String providerId) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        await user.unlink(providerId);
        return "success";
      } on FirebaseAuthException catch (e) {
        debugPrint(
            "================== Firebase Auth Exceptions ==================");
        debugPrint("${e.code} ====== ${e.message}");

        rethrow;
      } catch (e) {
        return handleException(e);
      }
    }
    return ("No user signed in");
  }

  static Future<void> _verifyEmail() async {
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  static bool _isVerified(UserCredential user) {
    if (user.user!.emailVerified) {
      return true;
    } else {
      return false;
    }
  }

  static Future<String> updateAccountInfo({
    String? fullName,
    String? email,
  }) async {
    final user = FirebaseAuth.instance.currentUser!;

    if (fullName != null) {
      try {
        await user.updateDisplayName(fullName);
      } on FirebaseAuthException catch (e) {
        return FirebaseExceptionsHandler.handleAuthException(e);
      } catch (e) {
        return handleException(e);
      }
    }
    if (email != null) {
      try {
        await user.verifyBeforeUpdateEmail(email);
      } on FirebaseAuthException catch (e) {
        return FirebaseExceptionsHandler.handleAuthException(e);
      } catch (e) {
        return handleException(e);
      }
    }
    return "success";
  }

  static DocumentReference getUserDocument() {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(AppProvider.userId);
  }

  static addToFavorites({required int itemId}) async {
    final userRef = getUserDocument();
    final docSnapshot = await userRef.get();

    if (!docSnapshot.exists) {
      await userRef.set({
        "favoriteItemIds": [] // Create the field with an empty array
      });
    }
    await userRef.update({
      "favoriteItemIds": FieldValue.arrayUnion([itemId])
    });
  }

  static deleteFromFavorites({required int itemId}) async {
    final userRef = getUserDocument();
    final docSnapshot = await userRef.get();

    if (docSnapshot.exists) {
      final data = docSnapshot.data()! as Map<String, dynamic>;

      if (data.containsKey("favoriteItemIds")) {
        await userRef.update({
          "favoriteItemIds": FieldValue.arrayRemove([itemId]),
        });
      }
    }
  }

  static Future<Stream<DocumentSnapshot<Object?>>> getUserData() async {
    final userRef = getUserDocument();
    final docSnapshot = await userRef.get();
    if (!docSnapshot.exists) {
      userRef.set({"favoriteItemIds": []});
    }
    final userData = userRef.snapshots();
    return userData;
  }

  static Future<void> deleteUserDataFromFirestore() async {
    final userRef = getUserDocument();
    try {
      await userRef.delete();
    } catch (e) {
      rethrow;
    }
  }

  static String handleException(Object e) {
    debugPrint("================== Catch e exception ==================");
    debugPrint(e.toString());
    debugPrint("=======================================================");
    return e.toString();
  }
}
