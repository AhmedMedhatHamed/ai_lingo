import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(automaticallyImplyLeading: true),
          SliverToBoxAdapter(child: SizedBox(height: 30.0)),
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                AppStrings.createAccount,
                style: AppStyles.cairo700Size36.copyWith(fontSize: 32.0),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20.0)),
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                AppStrings.signUpDescription,
                style: AppStyles.almarai400Size24.copyWith(
                  color: AppColors.splashColor,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          ///TODO
        ],
      ),
    );
  }
}
