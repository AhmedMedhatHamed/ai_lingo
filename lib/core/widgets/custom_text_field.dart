import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: TextEditingController(),
        textAlign: .center,
        cursorColor: AppColors.primaryColor,
        style: AppStyles.almarai400Size24.copyWith(fontSize: 20.0),
        obscureText: false,
        textInputAction: .next,
        keyboardType: .name,
        validator: (value) {
          return '';
        },
        decoration: InputDecoration(
          labelText: 'Email Address',
          labelStyle: AppStyles.cairo400Size24.copyWith(
            color: Colors.black,
            fontSize: 20.0,
          ),
          prefixIcon: Icon(Icons.email_rounded),
          suffixIcon: Icon(CupertinoIcons.eye),
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
