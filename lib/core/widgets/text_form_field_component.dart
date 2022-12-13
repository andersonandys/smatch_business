import 'package:flutter/material.dart';
import 'package:smatch_managment/features/login/app_colors.dart';
import 'package:smatch_managment/features/login/app_styles.dart';

class ComponentTextFormField extends StatelessWidget {
  final String? hintText;
  final String? label;
  final String? initialValue;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final bool read;
  final Widget? suffixIcon;

  const ComponentTextFormField({
    super.key,
    this.hintText,
    this.initialValue,
    required this.validator,
    required this.onSaved,
    this.obscureText = false,
    this.label,
    this.read = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: read,
      initialValue: initialValue,
      validator: validator,
      onSaved: onSaved,
      obscureText: obscureText,
      style: ralewayStyle.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 14.0,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: ralewayStyle.copyWith(
          fontWeight: FontWeight.w400,
          color: Colors.black.withOpacity(0.5),
          fontSize: 14.0,
        ),
        contentPadding: const EdgeInsets.all(16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: AppColors.mainBlueColor,
          ),
        ),
      ),
    );
  }
}
