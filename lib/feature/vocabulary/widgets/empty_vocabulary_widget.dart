import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/widgets/custom_button.dart';

class EmptyVocabularyWidget extends StatelessWidget {
  const EmptyVocabularyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(AppImages.animatedBook, width: 200.0),
        Text(
          AppStrings.noSavedWordsYet,
          style: AppStyles.cairo400Size24.copyWith(
            fontSize: 20.0,
            color: AppColors.splashColor,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.2,),
        CustomButton(onPressed: (){}, text: AppStrings.exploreScenarios),
      ],
    );
  }
}
