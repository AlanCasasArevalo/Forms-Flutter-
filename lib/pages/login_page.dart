import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '', _password = '';

  // Al usar este globalKey de tipo FormState podemos acceder a los datos de dicho state, por ejemplo validar los campos dentro de los TextFormField
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      // Si no asignasemos el key no se realizarian las validaciones
      key: _formKey,
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
                  if (isEmailValid) {
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
                  if (text.length > 7) {
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
                onPressed: _submit,
                child: Text('Registrate'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Accedemos a los metodos de FormState para validar todas las reglas definidas para validar si es o no un email valido o bien password en cada uno de los
  // textfields creados
  void _submit() {
    if (_formKey.currentState != null) {
      // Esto sirve para resetear los estados de los textfields
      _formKey.currentState!.reset();
      /*
      if (_formKey.currentState!.validate()) {
        // Enviar datos al back de los campos validados previamente
      }
       */
    }
  }
}
