import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/feature/auth/signup/widgets/title_and_description.dart';
import 'package:flutter/material.dart';
import '../widgets/forgot_password_widget.dart';
import '../widgets/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(automaticallyImplyLeading: false),
          SliverToBoxAdapter(child: SizedBox(height: 60.0)),
          SliverToBoxAdapter(
            child: TitleAndDescriptionWidget(
              title: AppStrings.signInTitle,
              description: AppStrings.signInDesc,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 30.0)),
          SliverToBoxAdapter(child:SignInForm(),),
          SliverToBoxAdapter(child: SizedBox(height: 10.0)),
          ForgotPasswordWidget(),
        ],
      ),
    );
  }
}



