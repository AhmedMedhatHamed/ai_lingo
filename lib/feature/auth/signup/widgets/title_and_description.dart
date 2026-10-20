import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TitleAndDescriptionWidget extends StatelessWidget {
  const TitleAndDescriptionWidget({super.key, required this.title, required this.description});

  final String title,description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            title,
            style: AppStyles.cairo700Size36.copyWith(fontSize: 32.0),
          ),
        ),
        SizedBox(height: 15.0,),
        Center(
          child: Text(
            description,
            textAlign: .center,
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
