import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_images.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DailyChallenge extends StatelessWidget {
  const DailyChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.04),
      child: ListTile(
        tileColor: AppColors.primaryColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.height * 0.01),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.dailyChallenge,
              style: AppStyles.cairo700Size36.copyWith(fontSize: 32),
            ),
            Image.asset(AppImages.robot),
          ],
        ),
        subtitle: Text(
          AppStrings.practice5mins,
          style: AppStyles.almarai400Size24.copyWith(fontSize: 16),
        ),
        onTap: () {},
      ),
    );
  }
}
