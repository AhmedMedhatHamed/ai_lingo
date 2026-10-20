import 'package:ai_lingo/core/routing/app_routes.dart';
import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/core/widgets/custom_text_button.dart';
import 'package:ai_lingo/feature/auth/signup/widgets/signup_form.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(automaticallyImplyLeading: true),
            const SliverToBoxAdapter(child: SizedBox(height: 30.0)),
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  AppStrings.createAccount,
                  style: AppStyles.cairo700Size36.copyWith(fontSize: 32.0),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
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
            const SliverToBoxAdapter(child: SizedBox(height: 40.0)),
            SliverToBoxAdapter(child: SignupForm()),
            const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  AppStrings.alreadyHaveAnAccount,
                  style: AppStyles.almarai400Size24.copyWith(
                    color: AppColors.splashColor,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: CustomTextButton(
                text: AppStrings.logIn,
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.signInScreen,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
