import 'package:flutter/material.dart';

class LoginCheckbox extends FormField<bool> {
  LoginCheckbox({
    Key? key,
    AutovalidateMode? autovalidateMode,
    String? Function(bool?)? validator,
    required void Function(bool value) onChanged,
  }) : super(
          key: key,
          validator: validator,
          autovalidateMode: autovalidateMode,
          builder: (state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CheckboxListTile(
                  title: Text('hola amundio'),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: state.value ?? false,
                  onChanged: (value) {
                    state.didChange(value);
                    if (value != null) {
                      onChanged(value);
                    }
                  },
                ),
                if (state.hasError)
                  Text(
                    state.errorText!,
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            );
          },
        );
}
