import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/feature/onboarding/model/onboarding_model.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'build_show_dialog.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({super.key});

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  final PageController controller = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: onboardingList.length,
            controller: controller,
            physics: BouncingScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(
                    onboardingList[index].title,
                    style: AppStyles.cairo700Size36,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    onboardingList[index].description,
                    style: AppStyles.almarai400Size24,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 30.0),
                  DotsIndicator(
                    dotsCount: onboardingList.length,
                    position: currentIndex.toDouble(),
                    decorator: DotsDecorator(
                      activeColor: AppColors.secondaryColor,
                      activeSize: Size(10, 10),
                      spacing: EdgeInsets.symmetric(horizontal: 5),
                    ),
                  ),
                  Spacer(),
                  CustomButton(
                    text: currentIndex == onboardingList.length - 1
                        ? AppStrings.getStarted
                        : AppStrings.next,
                    onPressed: () {
                      if (currentIndex < onboardingList.length - 1) {
                        controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        buildShowDialog(context);
                      }
                    },
                  ),
                  SizedBox(height: 30.0),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

}

