import 'package:flutter/material.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: oldPasswordController,
          text: 'Enter old password',
          prefixIcon: Icons.lock_outline,
        ),
        SizedBox(height: 30,),
        CustomTextField(
          controller: newPasswordController,
          text: 'Enter New Password',
          prefixIcon: Icons.lock_open,
        ),
        SizedBox(height: 30,),
        CustomTextField(
          controller: confirmPasswordController,
          text: 'Confirm Password',
          prefixIcon: Icons.lock_open,
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.25,),
        CustomButton(onPressed: (){}, text: AppStrings.confirm),
      ],
    );
  }
}