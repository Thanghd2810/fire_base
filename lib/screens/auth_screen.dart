import 'package:flutter/material.dart';
import 'package:flutter_chat/services/firebase_auth_service.dart';
import 'package:flutter_chat/services/firebase_store.dart';
import 'package:flutter_chat/widgets/auth_form.dart';

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
      required bool isLogin}) {
    if (!isLogin) {
      FireBaseAuthService.createUserWithEmailAndPassWord(context,
              email: email, password: password)
          .then((value) async {
        if (value != null) {
          await FireBaseStore.setDataUser(
              userCredential: value, email: email, password: password);
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
