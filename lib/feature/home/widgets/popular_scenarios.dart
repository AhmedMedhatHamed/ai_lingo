import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/feature/auth/models/user_model.dart';
import 'package:ai_lingo/feature/home/cubit/home_cubit.dart';
import 'package:ai_lingo/feature/home/cubit/home_state.dart';
import 'package:ai_lingo/feature/home/widgets/resume_scenario.dart';
import 'package:ai_lingo/feature/scenarios/model/scenario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularScenarios extends StatefulWidget {
  const PopularScenarios({super.key});

  @override
  State<PopularScenarios> createState() => _PopularScenariosState();
}

class _PopularScenariosState extends State<PopularScenarios> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getpopularScenarios();
  }

  List<Scenario> popularScenarios = [];

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
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomePopScenariosSuccessState) {
                popularScenarios = state.popularScenarios;
              }
              return SizedBox(
                height: size.height * 0.5,
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final scenario = popularScenarios[index];
                    return ResumeScenario(
                      icon: getScenarioIcon(scenario.icon) ?? Icons.abc,
                      scenarioTitle: scenario.title,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: size.height * 0.02);
                  },
                  itemCount: popularScenarios.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
