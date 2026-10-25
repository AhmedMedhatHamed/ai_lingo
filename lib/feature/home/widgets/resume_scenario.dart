import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

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
