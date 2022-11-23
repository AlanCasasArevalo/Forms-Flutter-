import 'package:flutter/material.dart';
import 'package:forms/pages/login_page.dart';

mixin LoginMixin on State<LoginPage> {
  String? emailValidator(String? email) {
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

  String? passwordValidator(password) {
    password ??= '';
    if (password.length > 7) {
      return null;
    } else {
      return 'Contraseña invalida';
    }
  }
}