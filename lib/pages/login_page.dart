import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '', _password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              TextFormField(
                key: Key('login-page-email'),
                onChanged: (emailChanged) {
                  _email = emailChanged.trim();
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(label: Text('Email')),
                validator: (text) {
                  text ??= '';
                  final isEmailValid = RegExp(
                      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                      .hasMatch(text);
                  if(isEmailValid) {
                    return null;
                  } else {
                    return 'Email invalido';
                  }
                },
              ),
              SizedBox(
                height: 24,
              ),
              TextFormField(
                key: Key('login-page-password'),
                onChanged: (passwordChanged) {
                  _password = passwordChanged.replaceAll(' ', '');
                },
                obscureText: true,
                decoration: InputDecoration(label: Text('Contraseña')),
                validator: (text) {
                  text ??= '';
                  if(text.length > 7) {
                    return null;
                  } else {
                    return 'Contraseña invalida';
                  }
                },
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                key: Key('login-page-Registrate-Button'),
                onPressed: () {
                  print('Registrate');
                },
                child: Text('Registrate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
