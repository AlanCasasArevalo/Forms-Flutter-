import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    // Envolvemos nuestro Scaffold dentro de un GestureDetector para ocultar el teclado
    return GestureDetector(
      // Con esta instruccion ocultamos el teclado de manera elegante.
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              TextField(

              )
            ],
          ),
        ),
      ),
    );
  }
}