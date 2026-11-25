import 'package:ai_lingo/core/routing/app_routes.dart';
import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/feature/chat/ai_tutor/screens/ordering_coffee_screen.dart';
import 'package:ai_lingo/feature/home/cubit/home_cubit.dart';
import 'package:ai_lingo/feature/home/model/history_model.dart';
import 'package:ai_lingo/feature/scenarios/model/scenario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResumeScenario extends StatelessWidget {
  const ResumeScenario({super.key, required this.scenario});

  final Scenario scenario;

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
        side: BorderSide(width: size.height * 0.002, color: Colors.grey),
        borderRadius: BorderRadius.circular(size.height * 0.01),
      ),
      title: Row(
        children: [
          Icon(
            getScenarioIcon(scenario.icon),
            color: AppColors.secondaryColor,
            size: size.height * 0.05,
          ),
          SizedBox(width: size.width * 0.04),
          Text(
            scenario.title,
            style: AppStyles.cairo700Size36.copyWith(fontSize: 28),
          ),
        ],
      ),
      subtitle: Center(
        child: GestureDetector(
          onTap: () {
            context.read<HomeCubit>().addToHistory(
              HistoryModel(
                title: scenario.title,
                icon: scenario.icon,
                createdAt: Timestamp.now(),
                isCompleted: false,
              ),
            );
            Navigator.pushNamed(
              context,
              AppRoutes.chatScreen,
              arguments: scenario,
            );
          },
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
