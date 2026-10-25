import 'package:ai_lingo/core/routing/app_routes.dart';
import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_images.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_button.dart';
import 'package:ai_lingo/core/services/google_sign_in_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 20.0)),
              SliverToBoxAdapter(
                child: Image.asset(
                  AppImages.appLogo,
                  width: 190.0,
                  height: 190.0,
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    AppStrings.appName,
                    style: AppStyles.cairo700Size36.copyWith(fontSize: 32.0),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 100.0)),

              ///google signIn///
              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () async {
                    try {
                      final userCredential = await GoogleSignInService()
                          .signInWithGoogle();

                      if (!context.mounted || userCredential == null) {
                        return;
                      }

                      Navigator.pushNamed(
                        context,
                        AppRoutes.profileSetupScreen,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (!context.mounted) return;

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.message ?? 'Firebase sign-in failed'),
                        ),
                      );
                    } on GoogleSignInException catch (e) {
                      if (!context.mounted) return;

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Google sign-in failed: ${e.code}'),
                        ),
                      );
                    } catch (e) {
                      if (!context.mounted) return;

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Sign-in failed: $e')),
                      );
                    }
                  },
                  child: Container(
                    width: 330.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(AppImages.googleImage),
                        Text(
                          'Continue with Google',
                          style: AppStyles.almarai400Size24.copyWith(
                            color: AppColors.splashColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 20.0)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0),
                  child: Column(
                    children: [
                      Divider(color: Colors.black),
                      Text(
                        'or',
                        style: AppStyles.almarai400Size24.copyWith(
                          fontSize: 20.0,
                          color: Colors.grey,
                        ),
                      ),
                      Divider(color: Colors.black),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 20.0)),
              SliverToBoxAdapter(
                child: CustomButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.signInScreen,
                    );
                  },
                  text: AppStrings.signIn,
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 20.0)),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Text(
                      AppStrings.doNotHaveAnAccount,
                      style: AppStyles.cairo400Size24.copyWith(
                        color: AppColors.splashColor,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    CustomTextButton(
                      text: AppStrings.createAccount,
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.signupScreen);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
