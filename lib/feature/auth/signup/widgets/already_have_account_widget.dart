import 'package:ai_lingo/core/routing/app_routes.dart';
import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            AppStrings.alreadyHaveAnAccount,
            style: AppStyles.almarai400Size24.copyWith(
              color: AppColors.splashColor,
            ),
          ),
        ),
        CustomTextButton(
          text: AppStrings.logIn,
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.signInScreen,
            );
          },
        ),
      ],
    );
  }
}
