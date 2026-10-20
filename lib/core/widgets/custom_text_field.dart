import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.isObscureText,
    this.textInputAction,
    this.textInputType,
    required this.text,
    this.validator,
    required this.prefixIcon,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final bool? isObscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final String text;
  final String? Function(String?)? validator;
  final IconData prefixIcon;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: controller,
        cursorColor: AppColors.primaryColor,
        style: AppStyles.almarai400Size24.copyWith(fontSize: 20.0),
        obscureText: isObscureText ?? false,
        textInputAction: textInputAction ?? .next,
        keyboardType: textInputType ?? .name,
        validator: validator,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: AppStyles.cairo400Size24.copyWith(
            color: Colors.black,
            fontSize: 20.0,
          ),
          prefixIcon: Icon(prefixIcon),
          suffixIcon: Icon(suffixIcon),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        ),
      ),
    );
  }
}
