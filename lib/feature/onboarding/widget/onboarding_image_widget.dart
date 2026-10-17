import 'package:ai_lingo/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class OnboardingImageWidget extends StatelessWidget {
  const OnboardingImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: .none,
      children: [
        Image.asset(AppImages.onboarding,),
        Positioned(
          right: -35,
          child: Image.asset(
            AppImages.chatBubbleText,
            width: 90.0,
            height: 90.0,
          ),
        ),
      ],
    );
  }
}
