import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../manager/app_provider.dart';

class FirebaseUtils {
  static Future<Either<String, UserCredential>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    late UserCredential user;

    try {
      user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await _verifyEmail();
      await user.user!.updateDisplayName(name);
    } on FirebaseAuthException catch (e) {
      debugPrint(
          'Firebase Auth Exceptions:\n*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
      if (e.code == 'weak-password') {
        debugPrint(
            'The provided password is weak. Please choose a stronger one');
        return left(
            'The provided password is weak. Please choose a stronger one');
      } else if (e.code == 'email-already-in-use') {
        debugPrint(
            'That email address is already associated with an existing account');
        return left(
            'That email address is already associated with an existing account');
      }
      debugPrint(e.code.toString());
      return left(e.code);
    } catch (e) {
      debugPrint('Catch e exception:\n*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
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
    } on FirebaseAuthException catch (e) {
      debugPrint(
          'Firebase Auth Exceptions:\n*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
      if (e.code == 'invalid-credential') {
        debugPrint(
            'The username or password you entered is incorrect. Please try again');
        return left(
            'The username or password you entered is incorrect. Please try again');
      } else {
        debugPrint(e.code);
        return Left(e.code);
      }
    } catch (e) {
      debugPrint('Catch e exception:\n*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
      debugPrint(e.toString());
      return Left(e.toString());
    }
    return right(user);
  }

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
          'Firebase Auth Exceptions:\n*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
      if (e.code == 'invalid-credential') {
        debugPrint(
            'The username or password you entered is incorrect. Please try again');
        return left(
            'The username or password you entered is incorrect. Please try again');
      } else {
        debugPrint(e.code);
        return Left(e.code);
      }
    } catch (e) {
      debugPrint('Catch e exception:\n*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
      debugPrint(e.toString());
      return Left(e.toString());
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
          'Firebase Auth Exceptions:\n*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
      debugPrint(e.code);
      return e.code;
    } catch (e) {
      debugPrint('Catch e exception:\n*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
      debugPrint(e.toString());
      return e.toString();
    }
    return "success";
  }

  static changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String response = await reAuthenticate(user, oldPassword);
      if (response == "success") {
        try {
          await user.updatePassword(newPassword);
        } on FirebaseAuthException catch (e) {
          debugPrint(
              'Firebase Auth Exceptions:\n*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
          debugPrint(e.code);
          return (e.code);
        } catch (e) {
          debugPrint(
              'Catch e exception:\n*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
          debugPrint(e.toString());
          return (e.toString());
        }
        return ("success");
      }
      return response;
    }
  }

  static Future<String> reAuthenticate(User user, String oldPassword) async {
    try {
      final credential = EmailAuthProvider.credential(
          email: user.email!, password: oldPassword);
      await user.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      debugPrint(
          'Firebase Auth Exceptions:\n*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
      if (e.code == 'invalid-credential') {
        debugPrint('Entered password doesn\'t match your current password');
        return ('Entered password doesn\'t match your current password');
      } else {
        debugPrint(e.code);
        return (e.code);
      }
    } catch (e) {
      debugPrint('Catch e exception:\n*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
      debugPrint(e.toString());
      return (e.toString());
    }
    return "success";
  }

  static Either<String, User> getCurrentUserInfo() {
    late User? user;
    user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Left("No user logged in");
    }
    return Right(user);
  }

  static logOut() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }

  static Future<String> deleteAccount() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await deleteUserDataFromFirestore();

        unlinkProvider();
        GoogleSignIn googleSignIn = GoogleSignIn();
        await googleSignIn.signOut();

        user.delete();
      } on FirebaseAuthException catch (e) {
        debugPrint(
            'Firebase Auth Exceptions:\n*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
        if (e.code == "requires-recent-login") {
          debugPrint(e.toString());
        } else {
          return e.code;
        }
      } catch (e) {
        debugPrint(
            'Catch e exception:\n*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
        debugPrint(e.toString());
        return (e.toString());
      }
      return "success";
    }
    return ("No user signed in");
  }

  static unlinkProvider() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        await user.unlink("google.com");
      } on FirebaseAuthException catch (e) {
        if (e.code == "no-such-provider") {
          debugPrint("Google provider not linked to this user");
        } else {
          debugPrint("Error unlinking Google provider: ${e.message}");
        }
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
    await userRef.delete();
  }
}
