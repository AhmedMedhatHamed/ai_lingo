import 'package:ai_lingo/core/utils/app_strings.dart';

class OnboardingModel {
  final String title, description;

  OnboardingModel({required this.title, required this.description});
}

List<OnboardingModel> onboardingList = [
  OnboardingModel(
    title: AppStrings.onboardingTitle1,
    description: AppStrings.onboardingDescription1,
  ),
  OnboardingModel(
    title: AppStrings.onboardingTitle2,
    description: AppStrings.onboardingDescription2,
  ),
];
