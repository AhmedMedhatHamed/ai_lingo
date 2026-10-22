import 'package:ai_lingo/core/services/validator.dart';
import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_field.dart';
import 'package:ai_lingo/feature/auth/cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordForm extends StatelessWidget {
  const NewPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
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
          key: context.read<AuthCubit>().formKey,
          autovalidateMode: context.read<AuthCubit>().autoValidateMode,
          child: Column(
            children: [
              CustomTextField(
                controller: context.read<AuthCubit>().passwordController,
                text: 'New Password',
                prefixIcon: CupertinoIcons.lock_fill,
                suffixIcon: context.read<AuthCubit>().isObscure
                    ? CupertinoIcons.eye_slash_fill
                    : CupertinoIcons.eye,
                onSuffixPressed: context.read<AuthCubit>().togglePasswordVisibility,
                isObscureText: context.read<AuthCubit>().isObscure,
                textInputType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                validator: Validators.password,
              ),
              SizedBox(height: 20,),
              CustomTextField(
                controller: context.read<AuthCubit>().confirmNewPassword,
                text: 'Confirm New Password',
                prefixIcon: CupertinoIcons.lock_fill,
                suffixIcon: context.read<AuthCubit>().isObscure
                    ? CupertinoIcons.eye_slash_fill
                    : CupertinoIcons.eye,
                onSuffixPressed: context.read<AuthCubit>().togglePasswordVisibility,
                isObscureText: context.read<AuthCubit>().isObscure,
                textInputType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                validator: Validators.password,
                onFieldSubmitted: (_) => context.read<AuthCubit>().createNewPassword(),
              ),
              SizedBox(height: 40.0,),
              state is AuthLoading
                  ? CupertinoActivityIndicator(color: AppColors.primaryColor)
                  : CustomButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  context.read<AuthCubit>().createNewPassword();
                },
                text: AppStrings.resetPassword,
              ),
            ],
          ),
        );
      },
    );
  }
}
