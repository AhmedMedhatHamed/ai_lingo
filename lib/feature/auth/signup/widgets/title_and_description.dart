import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TitleAndDescriptionWidget extends StatelessWidget {
  const TitleAndDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            AppStrings.createAccount,
            style: AppStyles.cairo700Size36.copyWith(fontSize: 32.0),
          ),
        ),
        SizedBox(height: 15.0,),
        Center(
          child: Text(
            AppStrings.signUpDescription,
            style: AppStyles.almarai400Size24.copyWith(
              color: AppColors.splashColor,
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}
