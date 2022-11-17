import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(label: Text('Email')),
            ),
            SizedBox(
              height: 24,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(label: Text('Contraseña')),
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Registrate'),
            ),
          ],
        ),
      ),
    );
  }
}
