import 'package:ai_lingo/core/services/validator.dart';
import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_field.dart';
import 'package:ai_lingo/feature/auth/signup/widgets/title_and_description.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(automaticallyImplyLeading: true),
          SliverToBoxAdapter(
            child: TitleAndDescriptionWidget(
              title: AppStrings.signInTitle,
              description: AppStrings.signInDesc,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 30.0)),
          SliverToBoxAdapter(
            child: CustomTextField(
              controller: TextEditingController(),
              text: 'Email Address',
              prefixIcon: Icons.email_rounded,
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: Validators.email,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20.0)),
          SliverToBoxAdapter(
            child: CustomTextField(
              controller: TextEditingController(),
              text: 'Password',
              prefixIcon: CupertinoIcons.lock_fill,
              // suffixIcon: cubit.isObscure
              //     ? CupertinoIcons.eye_slash_fill
              //     : CupertinoIcons.eye,
              //onSuffixPressed: cubit.togglePasswordVisibility,
              //isObscureText: cubit.isObscure,
              textInputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              validator: Validators.password,
              //onFieldSubmitted: (_) => cubit.signUp(),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 100.0)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButton(onPressed: () {}, text: AppStrings.signIn),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10.0)),
          SliverToBoxAdapter(
            child: Align(
              alignment: .topRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextButton(
                  text: AppStrings.forgotPassword,
                  textStyle: AppStyles.almarai400Size24.copyWith(
                    color: AppColors.splashColor,
                    fontStyle: .italic,
                    decoration: .underline,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
