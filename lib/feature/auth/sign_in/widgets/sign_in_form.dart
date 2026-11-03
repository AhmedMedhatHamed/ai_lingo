
import 'package:ai_lingo/core/routing/app_routes.dart';
import 'package:ai_lingo/core/services/validator.dart';
import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_field.dart';
import 'package:ai_lingo/feature/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signIn() {
    if (formKey.currentState!.validate()) {
      context.read<SignInCubit>().signIn(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } else {
      setState(() {
        autoValidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMsg,
                style: AppStyles.cairo400Size24,
              ),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is SignInSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Login Successfully',
                style: AppStyles.cairo400Size24,
              ),
              backgroundColor: AppColors.primaryColor,
            ),
          );

          Navigator.pushNamed(
            context,
            AppRoutes.mainNavigation,
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              CustomTextField(
                controller: emailController,
                text: 'Email Address',
                prefixIcon: Icons.email_rounded,
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: Validators.email,
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                controller: passwordController,
                text: 'Password',
                prefixIcon: CupertinoIcons.lock_fill,
                suffixIcon: context.read<SignInCubit>().isObscure
                    ? CupertinoIcons.eye_slash_fill
                    : CupertinoIcons.eye,
                onSuffixPressed: context
                    .read<SignInCubit>()
                    .togglePasswordVisibility,
                isObscureText: context.read<SignInCubit>().isObscure,
                textInputType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                validator: Validators.password,
                onFieldSubmitted: (_) {
                  signIn();
                },
              ),
              const SizedBox(height: 100.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: state is SignInLoadingState
                    ? const CupertinoActivityIndicator(
                  color: AppColors.primaryColor,
                )
                    : CustomButton(
                  onPressed: signIn,
                  text: AppStrings.signIn,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
