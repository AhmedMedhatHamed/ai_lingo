import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProfileLevel extends StatelessWidget {
  const ProfileLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 145.0,
          height: 30,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(30.0),
            border: BoxBorder.all(color: Colors.black, width: 3.0),
          ),
          child: Center(
            child: Text(
              'Beginner Level',
              style: AppStyles.almaraiBoldSize32.copyWith(
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
