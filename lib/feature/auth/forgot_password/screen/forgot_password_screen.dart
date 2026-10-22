import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/feature/auth/forgot_password/widgets/forgot_pass_form.dart';
import 'package:ai_lingo/feature/auth/signup/widgets/title_and_description.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(automaticallyImplyLeading: true),
            SliverToBoxAdapter(
              child: SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            ),
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
            SliverToBoxAdapter(child: ForgotPasswordForm(),),
          ],
        ),
      ),
    );
  }
}

