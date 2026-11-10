import 'package:ai_lingo/core/routing/app_routes.dart';
import 'package:ai_lingo/core/services/validator.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_field.dart';
import 'package:ai_lingo/feature/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Reset password email sent successfully'),
            ),
          );

          Navigator.pushNamed(context, AppRoutes.loginScreen);
        }

        if (state is ForgotPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMsg),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: emailController,
                text: AppStrings.emailAddress,
                prefixIcon: Icons.email_rounded,
                textInputAction: TextInputAction.done,
                validator: Validators.email,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomButton(
                  onPressed: () {
                    if (state is ForgotPasswordLoading) return;

                    FocusScope.of(context).unfocus();

                    if (formKey.currentState!.validate()) {
                      context.read<ForgotPasswordCubit>().sendResetPasswordEmail(emailController.text.trim());
                    }
                  },
                  text: state is ForgotPasswordLoading
                      ? 'Sending...'
                      : AppStrings.sendLinkReset,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
