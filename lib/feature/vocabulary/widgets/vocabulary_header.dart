import 'package:flutter/material.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/app_styles.dart';

class VocabularyHeader extends StatelessWidget {
  const VocabularyHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Image.asset(AppImages.robot),
        SizedBox(width: 20.0),
        Text(
          AppStrings.myVocabulary,
          style: AppStyles.almarai400Size24.copyWith(
            fontSize: 32.0,
            fontWeight: .bold,
          ),
        ),
      ],
    );
  }
}
