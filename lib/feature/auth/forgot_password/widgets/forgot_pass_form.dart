import 'package:ai_lingo/core/services/validator.dart';
import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_field.dart';
import 'package:ai_lingo/feature/auth/cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          key: context.read<AuthCubit>().formKey,
          autovalidateMode: context.read<AuthCubit>().autoValidateMode,
          child: Column(
            children: [
              CustomTextField(
                controller: context.read<AuthCubit>().emailController,
                text: AppStrings.emailAddress,
                prefixIcon: Icons.email_rounded,
                textInputAction: .done,
                validator: Validators.email,
                textInputType: .emailAddress,
              ),

              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: state is AuthLoading
                    ? CupertinoActivityIndicator(color: AppColors.primaryColor)
                    : CustomButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    context.read<AuthCubit>().forgotPassword();
                  },
                  text: AppStrings.sendLinkReset,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
