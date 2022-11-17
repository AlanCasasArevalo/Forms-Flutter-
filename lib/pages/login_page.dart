import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '', _password = '';
  bool _isValidEmail = false, _isValidPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextField(
              onChanged: (emailChanged) {
                _email = emailChanged;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(label: Text('Email')),
            ),
            SizedBox(
              height: 24,
            ),
            TextField(
              onChanged: (passwordChanged) {
                _password = passwordChanged;
              },
              obscureText: true,
              decoration: InputDecoration(label: Text('Contraseña')),
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: _isValidEmail && _isValidPassword ? () {} : null,
              child: Text('Registrate'),
            ),
          ],
        ),
      ),
    );
  }
}
