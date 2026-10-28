import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_images.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/feature/scenarios/model/scenario.dart';
import 'package:ai_lingo/feature/scenarios/screen/widgets/scenario_widget.dart';
import 'package:flutter/material.dart';

class ScenariosScreen extends StatefulWidget {
  const ScenariosScreen({super.key});

  @override
  State<ScenariosScreen> createState() => _ScenariosScreenState();
}

class _ScenariosScreenState extends State<ScenariosScreen> {
  late TextEditingController searchController;

  final scenarios = [
    Scenario(
      title: 'Ordering Coffee',
      description: 'Practice ordering your favorite drink at a cafe.',
      icon: Icons.coffee,
      level: 'Beginner',
    ),
    Scenario(
      title: 'Airport Check-in',
      description: 'Learn how to ask questions and check your luggage.',
      icon: Icons.airplanemode_active,
      level: 'Intermediate',
    ),
    Scenario(
      title: 'Job Interview',
      description: 'Answer common interview questions with confidence.',
      icon: Icons.shopping_bag_outlined,
      level: 'Advanced',
    ),
    Scenario(
      title: 'Grocery Shopping',
      description: 'Practice asking for items and prices at the store.',
      icon: Icons.store_outlined,
      level: 'Beginner',
    ),
    Scenario(
      title: 'Doctor Consultation',
      description: 'Explain complex symptoms and discuss medical advice.',
      icon: Icons.health_and_safety,
      level: 'Intermediate',
    ),
  ];

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
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
                  ),
                ),

                SizedBox(
                  width: size.width * 0.92,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final scenario = scenarios[index];
                      return ScenarioWidget(scenario: scenario);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: size.height * 0.02);
                    },
                    itemCount: scenarios.length,
                  ),
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
