import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_field.dart';
import 'package:ai_lingo/feature/auth/signup/widgets/title_and_description.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(automaticallyImplyLeading: true),
          SliverToBoxAdapter(child: SizedBox(height: MediaQuery.of(context).size.height*0.03)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TitleAndDescriptionWidget(
                title: AppStrings.forgotPassword,
                description: AppStrings.forgotPassDescription,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 60.0)),
          SliverToBoxAdapter(
            child: CustomTextField(
              controller: TextEditingController(),
              text: AppStrings.emailAddress,
              prefixIcon: Icons.email_rounded,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 30.0)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButton(
                onPressed: () {},
                text: AppStrings.sendLinkReset,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
