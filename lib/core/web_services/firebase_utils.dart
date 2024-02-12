import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../manager/app_provider.dart';

class FirebaseUtils {
  static Future<Either<String, UserCredential>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    late UserCredential user;

    try {
      user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await _verifyEmail();
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

  static logOut() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
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

  static DocumentReference getUserDocument() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(AppProvider.userId);
  }

  static addToFavorites({required int itemId}) async {
    final userRef = getUserDocument();
    final docSnapshot = await userRef.get();

    if (!docSnapshot.exists) {
      final data = docSnapshot.data()! as Map<String, dynamic>;

      if (!data.containsKey('favoriteItemIds')) {
        await userRef.set({
          'favoriteItemIds': [] // Create the field with an empty array
        });
      }
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

  static Future<List<int>> getFavoriteItemIds() async {
    List<int> favorites = [];
    final userRef = getUserDocument();
    final docSnapshot = await userRef.get();
    if (docSnapshot.exists) {
      final data = docSnapshot.data()! as Map<String, dynamic>;
      if (data.containsKey('favoriteItemIds')) {
        favorites =
            (data['favoriteItemIds'] as List).map((e) => e as int).toList();
        debugPrint("$favorites");
      }
    }
    return favorites;
  }

  static getData() {
    final userRef = getUserDocument();
    final favoritesStream = userRef.snapshots();
    return favoritesStream;
  }
}
