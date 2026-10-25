import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/feature/home/screen/home_screen.dart';
import 'package:ai_lingo/feature/main_navigation/widgets/custom_icon.dart';
import 'package:ai_lingo/feature/scenarios/screen/scenarios_screen.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  final _screens = [HomeScreen(), ScenariosScreen()];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        selectedIconTheme: IconThemeData(color: AppColors.secondaryColor),
        unselectedIconTheme: IconThemeData(color: AppColors.primaryColor),
        selectedLabelStyle: AppStyles.cairo700Size36.copyWith(fontSize: 18),
        unselectedLabelStyle: AppStyles.cairo700Size36.copyWith(fontSize: 18),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: CustomIcon(isSelected: _currentIndex == 0, icon: Icons.home),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: CustomIcon(
              isSelected: _currentIndex == 1,
              icon: Icons.theater_comedy,
            ),
            label: AppStrings.scenarios,
          ),
        ],
      ),
    );
  }
}

