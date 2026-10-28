import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/feature/scenarios/model/scenario.dart';
import 'package:flutter/material.dart';

import '../../../ai_tutor/screens/ordering_coffee_screen.dart';

enum Level { beginner, intermediate, advanced }

class ScenarioWidget extends StatelessWidget {
  const ScenarioWidget({super.key, required this.scenario});

  final Scenario scenario;

  Color getLevelColor(Level level) {
    switch (level) {
      case Level.beginner:
        return AppColors.beginnerColor;
      case Level.intermediate:
        return AppColors.inermediateColor;
      case Level.advanced:
        return AppColors.secondaryColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: size.height * 0.003, color: Colors.grey),
        borderRadius: BorderRadius.circular(size.height * 0.01),
      ),
      contentPadding: EdgeInsets.only(right: 0, left: size.height * 0.01),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            scenario.icon,
            color: AppColors.secondaryColor,
            size: size.height * 0.045,
          ),
          Expanded(
            child: Text(
              scenario.title,
              style: AppStyles.cairo700Size36.copyWith(fontSize: 28),
            ),
          ),
          IconButton(
            onPressed: () {
              if (scenario.title == 'Ordering Coffee') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderingCoffeeScreen(),
                  ),
                );
              }
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              size: size.height * 0.05,
            ),
          ),
        ],
      ),
      subtitle: Column(
        children: [
          Text(scenario.description, style: AppStyles.inter400Size11),
          Container(
            width: size.width * 0.25,
            height: size.height * 0.04,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.height * 0.04),
              border: Border.all(
                width: size.height * 0.003,
                color: Colors.grey,
              ),
              color: getLevelColor(
                scenario.level == 'Beginner'
                    ? Level.beginner
                    : scenario.level == 'Intermediate'
                    ? Level.intermediate
                    : Level.advanced,
              ),
            ),
            child: Center(
              child: Text(
                scenario.level,
                style: AppStyles.inter400Size11.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
