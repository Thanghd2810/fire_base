import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key, required this.submitAuthForm}) : super(key: key);
  final Function(BuildContext context,
      {required String email,
      required String username,
      required String password,
      required bool isLogin}) submitAuthForm;
  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  String _userEmail = "";
  String _userName = "";
  String _password = "";
  bool isLogin = false;
  void _submit() {
    _formKey.currentState!.save();
    FocusScope.of(context).unfocus();
  }

  void _submitForm() {
    _submit();

    widget.submitAuthForm(context,
        email: _userEmail.trim(),
        password: _password.trim(),
        username: _userName.trim(),
        isLogin: isLogin);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email address',
                    ),
                    onSaved: (value) {
                      _userEmail = value!;
                    },
                  ),
                  if (isLogin)
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                      onSaved: (value) {
                        _userName = value!;
                      },
                    ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text(isLogin ? "Login" : "Signup"),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child: Text(
                        isLogin ? "Create new account" : "I have a account"),
                  ),
                ],
              )),
        ),
      )),
    );
  }
}
