
import 'package:ai_lingo/feature/profile/cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/validator.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Password changed successfully'),
              backgroundColor: Colors.green,
            ),
          );

          oldPasswordController.clear();
          newPasswordController.clear();
          confirmPasswordController.clear();
        }

        if (state is ChangePasswordFailure) {
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
                controller: oldPasswordController,
                text: 'Enter old password',
                prefixIcon: Icons.lock_outline,
                validator: Validators.password,
              ),

              const SizedBox(height: 30),

              CustomTextField(
                controller: newPasswordController,
                text: 'Enter New Password',
                prefixIcon: Icons.lock_open,
                validator: Validators.password,
              ),

              const SizedBox(height: 30),

              CustomTextField(
                controller: confirmPasswordController,
                text: 'Confirm Password',
                prefixIcon: Icons.lock_open,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }

                  if (value != newPasswordController.text) {
                    return 'Passwords do not match';
                  }

                  return null;
                },
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),

              CustomButton(
                onPressed: () {
                  if (state is ChangePasswordLoading) return;

                  FocusScope.of(context).unfocus();

                  if (formKey.currentState!.validate()) {
                    context.read<AuthCubit>().changePassword(
                      oldPassword: oldPasswordController.text,
                      newPassword: newPasswordController.text,
                    );
                  }
                },
                text: AppStrings.confirm,
              ),

              if (state is ChangePasswordLoading)
                const Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: CupertinoActivityIndicator(),
                ),
            ],
          ),
        );
      },
    );
  }
}
