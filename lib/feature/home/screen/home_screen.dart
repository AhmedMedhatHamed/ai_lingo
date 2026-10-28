import 'package:ai_lingo/feature/home/widgets/daily_challenge.dart';
import 'package:ai_lingo/feature/home/widgets/home_header.dart';
import 'package:ai_lingo/feature/home/widgets/popular_scenarios.dart';
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
                PopularScenarios(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
