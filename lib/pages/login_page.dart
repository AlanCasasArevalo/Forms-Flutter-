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
                // Con este metodo lo que hacemos es que cada vez que el usuario no pase las validaciones puestas en el validator,
                // y las corrija se muestre u oculte el mensaje de error del textfield, pero solo cuando el usuario interacture con el textfield
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // Un valor por defecto para dar mas feedback al usuario final
                initialValue: 'test@test.com',
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
              // Hay que pasar el contexto del FormState para que funcione
              Builder(
                builder: (context) {
                  return ElevatedButton(
                    key: Key('login-page-Registrate-Button'),
                    onPressed: () {
                      _submit(context);
                    },
                    child: Text('Registrate'),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit(BuildContext context) {
    // Otra forma de hacer que funcione y accedamos a las funciones de formstate es usando el contexto, pero debemos tener cuidado de usar el contexto adecuado
    // Debemos usar un Builder para recibir el contexto adecuado
    final formState = Form.of(context);
    if (formState?.validate() ?? false) {
      print('Llamar al back con los datos ya validados');
    }
  }
}
