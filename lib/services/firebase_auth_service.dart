import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireBaseAuthService {
  /// init firebaseAuth
  ///

  static final _initFirebaseAuth = FirebaseAuth.instance;

  /// future for signin with email and password
  ///
  static Future<UserCredential?> signInWithEmailAndPassWord(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    // User? userCredential1;
    // String errorMessage = "";
    try {
      UserCredential userCredential = await _initFirebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      // userCredential1 = userCredential.user;
      return userCredential;
    } on FirebaseAuthException catch (err) {
      String message = "Đăng nhập thất bại!";
      if (err.message != null && err.message!.isNotEmpty) {
        message = err.message!;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Đăng nhập thất bại"),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    }
  }

  /// future for signin with email and password
  ///
  static Future<UserCredential?> createUserWithEmailAndPassWord(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _initFirebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (err) {
      String message = "Đăng nhập thất bại!";
      if (err.message != null && err.message!.isNotEmpty) {
        message = err.message!;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Đăng nhập thất bại"),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    }
  }

  /// logout
  ///
  static Future<void> signOut() {
    return _initFirebaseAuth.signOut();
  }

  /// get current User
  ///
  static User? get currentUser => _initFirebaseAuth.currentUser;
}
