import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '', _password = '';
  bool _isValidEmail = false, _isValidPassword = false;

  void _validateEmail() {
    _isValidEmail = RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(_email);
  }

  void _validatePassword() {
    _isValidPassword = _password.length > 9;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextField(
              key: Key('login-page-email'),
              onChanged: (emailChanged) {
                _email = emailChanged;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(label: Text('Email')),
            ),
            if (!_isValidEmail) Text('Email invalido'),
            SizedBox(
              height: 24,
            ),
            TextField(
              key: Key('login-page-password'),
              onChanged: (passwordChanged) {
                _password = passwordChanged;
              },
              obscureText: true,
              decoration: InputDecoration(label: Text('Contraseña')),
            ),
            if (!_isValidPassword) Text('Password invalido'),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              key: Key('login-page-Registrate-Button'),
              onPressed: () {
                setState(() {
                  _validateEmail();
                  _validatePassword();
                });
              },
              child: Text('Registrate'),
            ),
          ],
        ),
      ),
    );
  }
}
