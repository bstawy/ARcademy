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
      debugPrint(
          "================== Firebase Auth Exceptions ==================");
      debugPrint("${e.code} ====== ${e.message}");

      switch (e.code) {
        case "network-request-failed":
          return left(
              "There seems to be a network issue. Please check your internet connection and try again");

        case "timeout":
          return left("The request took too long. Please try again later");

        case "email-already-in-use":
          return left(
              "This email address is already in use. Please try with a different email address or reset your password if you forgot it");

        case "weak-password":
          return left(
              "The password you entered is too weak. Please use a stronger password");

        default:
          return left(e.code);
      }
    } catch (e) {
      debugPrint("================== Catch e exception ==================");
      debugPrint(e.toString());
      return left(e.toString());
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
      debugPrint(
          "================== Firebase Auth Exceptions ==================");
      debugPrint("${e.code} ====== ${e.message}");

      switch (e.code) {
        case "network-request-failed":
          return left(
              "There seems to be a network issue. Please check your internet connection and try again");

        case "timeout":
          return left("The request took too long. Please try again later");

        case "invalid-credential":
          return left(
              "The provided credential is invalid. Please check and try again");

        default:
          return left(e.code);
      }
    } catch (e) {
      debugPrint("================== Catch e exception ==================");
      debugPrint(e.toString());
      return left(e.toString());
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
    } on FirebaseAuthException catch (e) {
      debugPrint(
          "================== Firebase Auth Exceptions ==================");
      debugPrint("${e.code} ====== ${e.message}");

      switch (e.code) {
        case "network-request-failed":
          return left(
              "There seems to be a network issue. Please check your internet connection and try again");

        case "timeout":
          return left("The request took too long. Please try again later");

        case "user-not-found":
          return left(
              "There is no account associated with this email address. Please sign up instead");

        case "wrong-password":
          return left("Incorrect password. Please try again.");

        default:
          return left(e.code);
      }
    } catch (e) {
      debugPrint("================== Catch e exception ==================");
      debugPrint(e.toString());
      return left(e.toString());
    }

    if (_isVerified(user)) {
      return Right(user);
    } else {
      return const Left(
          "Your email address hasn't been verified yet. Please check your inbox for a verification email");
    }
  }

  static Future<String> resetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      debugPrint(
          "================== Firebase Auth Exceptions ==================");
      debugPrint("${e.code} ====== ${e.message}");

      switch (e.code) {
        case "network-request-failed":
          return "There seems to be a network issue. Please check your internet connection and try again";

        case "timeout":
          return "The request took too long. Please try again later";

        case "user-not-found":
          return "This email address doesn't exist in our records. Please check the email you entered or consider signing up.";

        default:
          return (e.code);
      }
    } catch (e) {
      debugPrint("================== Catch e exception ==================");
      debugPrint(e.toString());
      return (e.toString());
    }
    return "success";
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
          debugPrint(
              "================== Firebase Auth Exceptions ==================");
          debugPrint("${e.code} ====== ${e.message}");

          switch (e.code) {
            case "network-request-failed":
              return "There seems to be a network issue. Please check your internet connection and try again";

            case "timeout":
              return "The request took too long. Please try again later";

            case "weak-password":
              return "The password you entered is too weak. Please use a stronger password";

            case "requires-recent-login":
              return "This operation requires recent login. Please sign in again before trying again";

            default:
              return e.code;
          }
        } catch (e) {
          debugPrint("================== Catch e exception ==================");
          debugPrint(e.toString());
          return (e.toString());
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
      debugPrint(
          "================== Firebase Auth Exceptions ==================");
      debugPrint("${e.code} ====== ${e.message}");

      switch (e.code) {
        case "network-request-failed":
          return "There seems to be a network issue. Please check your internet connection and try again";

        case "timeout":
          return "The request took too long. Please try again later";

        case "user-not-found":
          return "There is no account associated with this email address";

        case "wrong-password":
          return "Incorrect password. Please try again";

        case "invalid-credential":
          return "The provided credential is invalid. Please check and try again";

        case "credential-already-in-use":
          return "This credential is already associated with another Firebase user";

        case "requires-recent-login":
          return "This operation requires recent login. Please sign in again before trying again";

        default:
          return e.code;
      }
    } catch (e) {
      debugPrint("================== Catch e exception ==================");
      debugPrint(e.toString());
      return (e.toString());
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
      debugPrint(
          "================== Firebase Auth Exceptions ==================");
      debugPrint("${e.code} ====== ${e.message}");

      switch (e.code) {
        case "network-request-failed":
          return "There seems to be a network issue. Please check your internet connection and try again";

        case "timeout":
          return "The request took too long. Please try again later";

        default:
          return e.code;
      }
    } catch (e) {
      debugPrint("================== Catch e exception ==================");
      debugPrint(e.toString());
      return (e.toString());
    }
  }

  static Future<String> deleteAccount() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await deleteUserDataFromFirestore();

        if (user.providerData
            .any((provider) => provider.providerId == 'google.com')) {
          unlinkProvider('google.com');
          GoogleSignIn googleSignIn = GoogleSignIn();
          await googleSignIn.signOut();
        }

        user.delete();
        return "success";
      } on FirebaseAuthException catch (e) {
        debugPrint(
            "================== Firebase Auth Exceptions ==================");
        debugPrint("${e.code} ====== ${e.message}");

        switch (e.code) {
          case "network-request-failed":
            return "There seems to be a network issue. Please check your internet connection and try again";

          case "timeout":
            return "The request took too long. Please try again later";

          case "requires-recent-login":
            return "This operation requires recent login. Please sign in again before trying again";

          default:
            return (e.code);
        }
      } catch (e) {
        debugPrint("================== Catch e exception ==================");
        debugPrint(e.toString());
        return (e.toString());
      }
    }
    return ("No user signed in");
  }

  static unlinkProvider(String providerId) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        await user.unlink(providerId);
      } on FirebaseAuthException catch (e) {
        debugPrint(
            "================== Firebase Auth Exceptions ==================");
        debugPrint("${e.code} ====== ${e.message}");

        switch (e.code) {
          case "network-request-failed":
            return "There seems to be a network issue. Please check your internet connection and try again";

          case "timeout":
            return "The request took too long. Please try again later";

          case "user-not-found":
            return "There is no account associated with this email address";

          case "requires-recent-login":
            return "This operation requires recent login. Please sign in again before trying again";

          default:
            return (e.code);
        }
      } catch (e) {
        debugPrint("================== Catch e exception ==================");
        debugPrint(e.toString());
        return (e.toString());
      }
    }
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

  static Future<String> updateAccountInfo(
      {String? fullName, String? email}) async {
    final user = FirebaseAuth.instance.currentUser!;

    if (fullName != null) {
      try {
        await user.updateDisplayName(fullName);
      } on FirebaseAuthException catch (e) {
        debugPrint(
            'Firebase Auth Exceptions:\n*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
        debugPrint(e.code);
        return e.code;
      } catch (e) {
        debugPrint(
            'Catch e exception:\n*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
        debugPrint(e.toString());
        return e.toString();
      }
    }
    if (email != null) {
      try {
        await user.verifyBeforeUpdateEmail(email);
      } on FirebaseAuthException catch (e) {
        debugPrint(
            'Firebase Auth Exceptions:\n*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
        debugPrint(e.code);
        return e.code;
      } catch (e) {
        debugPrint(
            'Catch e exception:\n*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
        debugPrint(e.toString());
        return e.toString();
      }
    }
    return "success";
  }

  static DocumentReference getUserDocument() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(AppProvider.userId);
  }

  static addToFavorites({required int itemId}) async {
    final userRef = getUserDocument();
    final docSnapshot = await userRef.get();

    if (!docSnapshot.exists) {
      await userRef.set({
        'favoriteItemIds': [] // Create the field with an empty array
      });
    }
    await userRef.update({
      'favoriteItemIds': FieldValue.arrayUnion([itemId])
    });
  }

  static addToRecentlyViewed({required int itemId}) async {
    final userRef = getUserDocument();
    final docSnapshot = await userRef.get();

    if (!docSnapshot.exists) {
      final data = docSnapshot.data()! as Map<String, dynamic>;

      if (!data.containsKey('recentlyViewedItemIds')) {
        await userRef.set({
          'recentlyViewedItemIds': [] // Create the field with an empty array
        });
      }
    }
    await userRef.update({
      'recentlyViewedItemIds': FieldValue.arrayUnion([itemId])
    });
  }

  static deleteFromFavorites({required int itemId}) async {
    final userRef = getUserDocument();
    final docSnapshot = await userRef.get();

    if (docSnapshot.exists) {
      final data = docSnapshot.data()! as Map<String, dynamic>;

      if (data.containsKey('favoriteItemIds')) {
        await userRef.update({
          'favoriteItemIds': FieldValue.arrayRemove([itemId]),
        });
      }
    }
  }

  static deleteFromRecentlyViewed({required int itemId}) async {
    final userRef = getUserDocument();
    final docSnapshot = await userRef.get();

    if (docSnapshot.exists) {
      final data = docSnapshot.data()! as Map<String, dynamic>;

      if (data.containsKey('recentlyViewedItemIds')) {
        await userRef.update({
          'recentlyViewedItemIds': FieldValue.arrayRemove([itemId]),
        });
      }
    }
  }

  static Future<Stream<DocumentSnapshot<Object?>>> getUserData(
      String type) async {
    final userRef = getUserDocument();
    final docSnapshot = await userRef.get();
    if (!docSnapshot.exists) {
      if (type == "favorites") {
        userRef.set({'favoriteItemIds': []});
      } else {
        userRef.set({'recentlyViewedItemIds': []});
      }
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
}

/*
i am developing mobile application using flutter framework and i am using firebase authentication for login and sign up
when calling firebase apis there are some exception which happened and i want to pop up a snack bar for user to know what is the issue
so i want you to tell me all exception for FirebaseAuth.instance.currentUser!.delete
          and the appropriate message to display for users for each exception
 */
