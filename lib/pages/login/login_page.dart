import 'package:flutter/material.dart';
import 'package:forms/pages/widgets/login_checkbox.dart';

import 'login_mixin.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginMixin {
  String _email = '', _password = '';

  @override
  Widget build(BuildContext context) {
    bool allowSubmit =
        emailValidator(_email) == null && passwordValidator(_password) == null;
    bool _checked = false;

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
                validator: emailValidator,
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
                validator: passwordValidator,
              ),
              SizedBox(
                height: 24,
              ),
              LoginCheckbox(
                validator: checkboxValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                setState(() {
                  _checked = value;
                });
              }),
              Builder(
                builder: (context) {
                  return MaterialButton(
                    color: Colors.blue.withOpacity(allowSubmit ? 1 : 0.2),
                    key: Key('login-page-Registrate-Button'),
                    onPressed: () => _submit(context),
                    elevation: 0,
                    child: Text('Registrate'),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submit(BuildContext context) {

  }
}
