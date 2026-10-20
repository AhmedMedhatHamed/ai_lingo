import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
  });
  final String text;
  final void Function() onPressed;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style:
            textStyle ??
            AppStyles.cairo700Size36.copyWith(
              fontSize: 32.0,
              color: AppColors.secondaryColor,
            ),
      ),
    );
  }
}
