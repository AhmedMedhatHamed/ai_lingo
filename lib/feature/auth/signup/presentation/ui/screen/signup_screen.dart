import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/core/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
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
            SliverToBoxAdapter(child: SizedBox(height: 40.0)),
            SliverToBoxAdapter(
              child: CustomTextField(
                controller: TextEditingController(),
                text: 'Full Name',
                prefixIcon: Icons.person,
                validator: (value) {
                  return '';
                },
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20.0)),
            SliverToBoxAdapter(
              child: CustomTextField(
                controller: TextEditingController(),
                text: 'Email Address',
                prefixIcon: Icons.email_rounded,
                textInputType: .emailAddress,
                validator: (value) {
                  return '';
                },
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20.0)),
            SliverToBoxAdapter(
              child: CustomTextField(
                controller: TextEditingController(),
                text: 'Password',
                prefixIcon: Icons.lock,
                suffixIcon: CupertinoIcons.eye,
                isObscureText: true,
                textInputType: .visiblePassword,
                textInputAction: .go,
                validator: (value) {
                  return '';
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
