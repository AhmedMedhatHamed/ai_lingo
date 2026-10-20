import 'package:ai_lingo/core/services/validator.dart';
import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_field.dart';
import 'package:ai_lingo/feature/auth/cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state is AuthSuccess) {
          // TODO: navigate to next screen
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          autovalidateMode: cubit.autoValidateMode,
          child: Column(
            children: [
              CustomTextField(
                controller: cubit.nameController,
                text: 'Full Name',
                prefixIcon: Icons.person,
                textInputType: TextInputType.name,
                textInputAction: TextInputAction.next,
                validator: Validators.name,
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                controller: cubit.emailController,
                text: 'Email Address',
                prefixIcon: Icons.email_rounded,
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: Validators.email,
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                controller: cubit.passwordController,
                text: 'Password',
                prefixIcon: Icons.lock,
                suffixIcon: cubit.isObscure
                    ? CupertinoIcons.eye_slash_fill
                    : CupertinoIcons.eye,
                onSuffixPressed: cubit.togglePasswordVisibility,
                isObscureText: cubit.isObscure,
                textInputType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                validator: Validators.password,
                onFieldSubmitted: (_) => cubit.signUp(),
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: state is AuthLoading
                    ? CupertinoActivityIndicator(color: AppColors.primaryColor)
                    : CustomButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          cubit.signUp();
                        },
                        text: 'Sign Up',
                      ),
              ),
              const SizedBox(height: 20.0),
              CustomTextButton(text: AppStrings.logIn, onPressed: () {}),
            ],
          ),
        );
      },
    );
  }
}
