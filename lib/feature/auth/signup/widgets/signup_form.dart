import 'package:ai_lingo/core/routing/app_routes.dart';
import 'package:ai_lingo/core/services/validator.dart';
import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_field.dart';
import 'package:ai_lingo/feature/auth/signup/cubit/signup_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signUp() {
    if (formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();

      context.read<SignupCubit>().signUp(
        name: nameController.text.trim(),
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
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMsg),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is SignupSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account created successfully'),
              backgroundColor: AppColors.primaryColor,
            ),
          );

          Navigator.pushReplacementNamed(context, AppRoutes.verificationScreen);
        }
      },
      builder: (context, state) {
        final cubit = context.read<SignupCubit>();

        return Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              CustomTextField(
                controller: nameController,
                text: 'Full Name',
                prefixIcon: Icons.person,
                textInputType: TextInputType.name,
                textInputAction: TextInputAction.next,
                validator: Validators.name,
              ),
              const SizedBox(height: 20.0),
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
                suffixIcon: cubit.isObscure
                    ? CupertinoIcons.eye_slash_fill
                    : CupertinoIcons.eye,
                onSuffixPressed: cubit.togglePasswordVisibility,
                isObscureText: cubit.isObscure,
                textInputType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                validator: Validators.password,
                onFieldSubmitted: (_) => signUp(),
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: state is SignupLoadingState
                    ? const CupertinoActivityIndicator(
                        color: AppColors.primaryColor,
                      )
                    : CustomButton(onPressed: signUp, text: AppStrings.signUp),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        );
      },
    );
  }
}
