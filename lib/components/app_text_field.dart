import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/app_strings.dart';
import 'package:flutter_application_1/styles/app_border.dart';
import 'package:flutter_application_1/styles/app_color.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final String? Function(dynamic) validator;
  // final void Function(dynamic) onChanged;
  final Widget? suffixIcon;
  final bool? obscureText;

  AppTextField(
      {super.key,
      required this.hint,
      required this.controller,
      required this.validator,
      // required this.onChanged,
      this.suffixIcon,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    bool isTextfieldAPassowrd = hint == AppStrings.password ? true : false;

    return TextFormField(
      keyboardType: isTextfieldAPassowrd
          ? null
          : hint == AppStrings.email
              ? TextInputType.emailAddress
              : TextInputType.text,
      obscureText: obscureText ?? false,
      autocorrect: false,
      validator: (value) => validator(value),
      controller: controller,
      // onChanged: (value) => onChanged(value),
      decoration: InputDecoration(
        hintText: hint,
        labelText: hint,
        filled: true,
        fillColor: AppColor.fill,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        focusedBorder: AppBorder.focusedBorder,
        enabledBorder: AppBorder.enabledBorder,
        suffixIcon: suffixIcon,
      ),
      style: const TextStyle(fontSize: 16),
    );
  }
}
