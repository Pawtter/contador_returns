import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.hintText,
    this.inputFormatters,
    this.validator,
  }) : super(key: key);
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      validator: validator,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}

extension CheckNum on String {
  bool get isValidEmail {
    final emailRegExp = RegExp("\d{2,3}\.\d{,2}");
    return emailRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }
}
