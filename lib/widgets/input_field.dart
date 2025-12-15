import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final controller, keyboardType, hint, label, errorText, icon, validator;
  const InputField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.hint,
    required this.label,
    required this.errorText,
    required this.icon,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: keyboardType == TextInputType.visiblePassword ? true : false,
      validator: validator,
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
    );
  }
}
