import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_chat/services/firebase_auth_service.dart';
import 'package:flutter_chat/services/firebase_store.dart';
import 'package:flutter_chat/widgets/auth_form.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'chat_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  void _submitAuthForm(BuildContext context,
      {required String email,
      required String username,
      required String password,
      required bool isLogin,
      required File userImageFile}) {
    if (!isLogin) {
      FireBaseAuthService.createUserWithEmailAndPassWord(context,
              email: email, password: password)
          .then((value) async {
        if (value != null) {
          final ref = FirebaseStorage.instance
              .ref()
              .child("user_image")
              .child(value.user!.uid + '.jpg');
          await ref.putFile(
            userImageFile,
          );
          final urlImage = await ref.getDownloadURL();
          await FireBaseStore.setDataUser(
            userCredential: value,
            email: email,
            password: password,
            urlImage: urlImage,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Tạo tài khoản thành công"),
              backgroundColor: Theme.of(context).errorColor,
            ),
          );
        }
      });
    } else {
      FireBaseAuthService.signInWithEmailAndPassWord(context,
              email: email, password: password)
          .then((value) async {
        if (value != null) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ChatScreen()),
          );
        } else {
          print("ngu vai đái");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(submitAuthForm: _submitAuthForm),
    );
  }
}
