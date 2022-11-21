import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '', _password = '';

  String? _emailValidator(String? email) {
    email ??= '';
    final isEmailValid = RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(email);
    if (isEmailValid) {
      return null;
    } else {
      return 'Email invalido';
    }
  }

  String? _passwordValidator(password) {
    password ??= '';
    if (password.length > 7) {
      return null;
    } else {
      return 'Contraseña invalida';
    }
  }

  @override
  Widget build(BuildContext context) {

    bool allowSubmit = _emailValidator(_email) == null &&  _passwordValidator(_password) == null;

    return Form(
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              TextFormField(
                key: Key('login-page-email'),
                // Con este metodo lo que hacemos es que cada vez que el usuario no pase las validaciones puestas en el validator,
                // y las corrija se muestre u oculte el mensaje de error del textfield, pero solo cuando el usuario interacture con el textfield
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // Un valor por defecto para dar mas feedback al usuario final
                initialValue: 'test@test.com',
                onChanged: (emailChanged) {
                  setState(() {
                    _email = emailChanged.trim();
                  });
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(label: Text('Email')),
                validator: _emailValidator,
              ),
              SizedBox(
                height: 24,
              ),
              TextFormField(
                key: Key('login-page-password'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (passwordChanged) {
                  setState(() {
                    _password = passwordChanged.replaceAll(' ', '');
                  });
                },
                obscureText: true,
                decoration: InputDecoration(label: Text('Contraseña')),
                validator: _passwordValidator,
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                key: Key('login-page-Registrate-Button'),
                onPressed: allowSubmit ? _submit : null,
                child: Text('Registrate'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {}
}
