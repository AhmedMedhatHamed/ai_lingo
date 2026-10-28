import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/feature/home/widgets/resume_scenario.dart';
import 'package:flutter/material.dart';

class PopularScenarios extends StatelessWidget {
  const PopularScenarios({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.popularScenarios,
            style: AppStyles.cairo700Size36.copyWith(fontSize: 28),
          ),
          SizedBox(height: size.height * 0.005),
          ResumeScenario(
            icon: Icons.coffee,
            scenarioTitle: AppStrings.orderingCoffee,
          ),
          SizedBox(height: size.height * 0.02),
          ResumeScenario(
            icon: Icons.store_outlined,
            scenarioTitle: AppStrings.groceryShopping,
          ),
        ],
      ),
    );
  }
}
