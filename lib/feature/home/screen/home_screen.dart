import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/feature/home/widgets/daily_challenge.dart';
import 'package:ai_lingo/feature/home/widgets/home_header.dart';
import 'package:ai_lingo/feature/home/widgets/quick_access.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.02),
            child: Column(
              children: [
                HomeHeader(),
                DailyChallenge(),
                QuickAccess(),
                Padding(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResumeScenario extends StatelessWidget {
  const ResumeScenario({
    super.key,
    required this.icon,
    required this.scenarioTitle,
  });

  final IconData icon;
  final String scenarioTitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: size.height * 0.002, color: Colors.grey),
        borderRadius: BorderRadius.circular(size.height * 0.01),
      ),
      title: Row(
        children: [
          Icon(icon, color: AppColors.secondaryColor, size: size.height * 0.05),
          SizedBox(width: size.width * 0.08),
          Text(
            scenarioTitle,
            style: AppStyles.cairo700Size36.copyWith(fontSize: 28),
          ),
        ],
      ),
      subtitle: Center(
        child: GestureDetector(
          onTap: () {},
          child: Text(
            AppStrings.resume,
            style: AppStyles.cairo700Size36.copyWith(
              fontSize: 28,
              color: AppColors.secondaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
