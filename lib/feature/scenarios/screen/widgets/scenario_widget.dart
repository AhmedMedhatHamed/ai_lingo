import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/feature/home/cubit/home_cubit.dart';
import 'package:ai_lingo/feature/home/model/history_model.dart';
import 'package:ai_lingo/feature/scenarios/model/scenario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../chat/ai_tutor/screens/ordering_coffee_screen.dart';

enum Level { beginner, intermediate, advanced }

class ScenarioWidget extends StatelessWidget {
  const ScenarioWidget({super.key, required this.scenario});

  final Scenario scenario;

  Color getLevelColor(Level level) {
    switch (level) {
      case Level.beginner:
        return AppColors.beginnerColor;
      case Level.intermediate:
        return AppColors.intermediateColor;
      case Level.advanced:
        return AppColors.secondaryColor;
    }
  }

  IconData? getScenarioIcon(String icon) {
    switch (icon) {
      case 'coffee':
        return Icons.coffee;
      case 'airplanemode_active':
        return Icons.airplanemode_active;
      case 'work_outline':
        return Icons.work_outline;
      case 'store_outlined':
        return Icons.store_outlined;
      case 'health_and_safety':
        return Icons.health_and_safety;
      default:
        return null;
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
          if (getScenarioIcon(scenario.icon) != null)
            Icon(
              getScenarioIcon(scenario.icon),
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
            onPressed: () async {
              await context.read<HomeCubit>().addToHistory(
                HistoryModel(
                  title: scenario.title,
                  icon: scenario.icon,
                  createdAt: Timestamp.now(),
                  isCompleted: false,
                ),
              );
              if (scenario.title == 'Ordering Coffee') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderingCoffeeScreen(),
                  ),
                );
              }
            },
            icon: Icon(Icons.arrow_forward_ios, size: size.height * 0.05),
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
