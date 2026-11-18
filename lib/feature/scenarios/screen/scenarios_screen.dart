import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_images.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/feature/scenarios/cubit/scenarios_cubit.dart';
import 'package:ai_lingo/feature/scenarios/cubit/scenarios_state.dart';
import 'package:ai_lingo/feature/scenarios/model/scenario.dart';
import 'package:ai_lingo/feature/scenarios/screen/widgets/scenario_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScenariosScreen extends StatefulWidget {
  const ScenariosScreen({super.key});

  @override
  State<ScenariosScreen> createState() => _ScenariosScreenState();
}

class _ScenariosScreenState extends State<ScenariosScreen> {
  late TextEditingController searchController;

  List<Scenario> scenarios = [];
  List<Scenario> filteredScenarios = [];

  @override
  void initState() {
    super.initState();

    searchController = TextEditingController();
    Future.microtask(() => context.read<ScenariosCubit>().getScenarios());
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void scenariosSearch(String searchInput) {
    setState(() {
      filteredScenarios = scenarios
          .where(
            (scenario) =>
                scenario.title.toLowerCase().contains(
                  searchInput.toLowerCase(),
                ) ||
                scenario.description.toLowerCase().contains(
                  searchInput.toLowerCase(),
                ) ||
                scenario.level.toLowerCase().contains(
                  searchInput.toLowerCase(),
                ),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.02),
                Image.asset(AppImages.robot),
                Text(
                  AppStrings.exploreScenarios,
                  style: AppStyles.almarai400Size24.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                  ),
                ),
                Container(
                  width: size.width * 0.92,
                  height: size.height * 0.05,
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  child: TextField(
                    controller: searchController,
                    cursorColor: AppColors.primaryColor,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(size.height * 0.04),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: size.height * 0.003,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(size.height * 0.04),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: size.height * 0.003,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(size.height * 0.04),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: size.height * 0.003,
                        ),
                      ),
                    ),
                    onChanged: scenariosSearch,
                  ),
                ),

                BlocConsumer<ScenariosCubit, ScenariosState>(
                  builder: (context, state) {
                    if (state is ScenariosLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      );
                    }

                    return SizedBox(
                      width: size.width * 0.92,
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final scenario = filteredScenarios[index];
                          return ScenarioWidget(scenario: scenario);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: size.height * 0.02);
                        },
                        itemCount: filteredScenarios.length,
                      ),
                    );
                  },
                  listener: (context, state) {
                    if (state is ScenariosSuccessState) {
                      setState(() {
                        scenarios = state.scenarios;
                        filteredScenarios = state.scenarios;
                      });
                    }
                  },
                ),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
