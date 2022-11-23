import 'package:flutter/material.dart';

class LoginTextField extends FormField<String> {
  LoginTextField({
    Key? key,
    String? Function(String?)? validator,
    TextInputAction? textInputAction,
    void Function(String)? onChanged,
    bool obscureText = false,
    TextInputType? keyboardType,
    InputDecoration? decoration,
    required String label,
  }) : super(
          key: key,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          builder: (state) {
            bool isOk = !state.hasError &&
                state.value != null &&
                state.value!.isNotEmpty;

            return TextField(
              textInputAction: textInputAction,
              obscureText: obscureText,
              keyboardType: keyboardType,
              onChanged: (text) {
                state.didChange(text);
                if (onChanged != null) {
                  onChanged(text);
                }
              },
              decoration: InputDecoration(
                label: Text(label),
                suffixIcon: Icon(
                  Icons.check_circle,
                  color: isOk ? Colors.green : Colors.black12,
                ),
              ),
            );
          },
        );
}
