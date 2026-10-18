import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12.0),
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        child: Text(
          text,
          style: AppStyles.cairo700Size36.copyWith(
            color: Colors.white,
            fontSize: 32.0,
          ),
        ),
      ),
    );
  }
}
