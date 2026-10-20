import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/feature/auth/signup/widgets/already_have_account_widget.dart';
import 'package:ai_lingo/feature/auth/signup/widgets/signup_form.dart';
import 'package:ai_lingo/feature/auth/signup/widgets/title_and_description.dart';
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
              child: TitleAndDescriptionWidget(
                title: AppStrings.createAccount,
                description: AppStrings.signUpDescription,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 40.0)),
            SliverToBoxAdapter(child: SignupForm()),
            const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
            SliverToBoxAdapter(child: AlreadyHaveAccountWidget()),
          ],
        ),
      ),
    );
  }
}
