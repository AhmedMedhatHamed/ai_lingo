import 'package:ai_lingo/feature/onboarding/widget/onboarding_image_widget.dart';
import 'package:ai_lingo/feature/onboarding/widget/page_view_widget.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 90.0),
            OnboardingImageWidget(),
            SizedBox(height: 7.0,),
            Expanded(child: PageViewWidget()),
          ],
        ),
      ),
    );
  }
}
