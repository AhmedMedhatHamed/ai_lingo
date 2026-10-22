import 'package:ai_lingo/core/routing/app_routes.dart';
import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Align(
        alignment: .topRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomTextButton(
            text: AppStrings.forgotPassword,
            textStyle: AppStyles.almarai400Size24.copyWith(
              color: AppColors.splashColor,
              fontStyle: .italic,
              decoration: .underline,
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.forgotPasswordScreen);
            },
          ),
        ),
      ),
    );
  }
}
