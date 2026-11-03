import 'package:ai_lingo/core/services/validator.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordForm extends StatelessWidget {
  const NewPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          //key: context.read<AuthCubit>().formKey,
          //autovalidateMode: context.read<AuthCubit>().autoValidateMode,
          child: Column(
            children: [
              // CustomTextField(
              //   controller: TextEditingController(),
              //   text: 'New Password',
              //   prefixIcon: CupertinoIcons.lock_fill,
              //   suffixIcon: context.read<AuthCubit>().isObscure
              //       ? CupertinoIcons.eye_slash_fill
              //       : CupertinoIcons.eye,
              //   onSuffixPressed: context.read<AuthCubit>().togglePasswordVisibility,
              //   isObscureText: context.read<AuthCubit>().isObscure,
              //   textInputType: TextInputType.visiblePassword,
              //   textInputAction: TextInputAction.done,
              //   validator: Validators.password,
              // ),
              SizedBox(height: 20,),
              // CustomTextField(
              //   controller: TextEditingController(),
              //   text: 'Confirm New Password',
              //   prefixIcon: CupertinoIcons.lock_fill,
              //   suffixIcon: context.read<AuthCubit>().isObscure
              //       ? CupertinoIcons.eye_slash_fill
              //       : CupertinoIcons.eye,
              //   onSuffixPressed: context.read<AuthCubit>().togglePasswordVisibility,
              //   isObscureText: context.read<AuthCubit>().isObscure,
              //   textInputType: TextInputType.visiblePassword,
              //   textInputAction: TextInputAction.done,
              //   validator: Validators.password,
              //   //onFieldSubmitted: (_) => context.read<AuthCubit>().createNewPassword(),
              // ),
              SizedBox(height: 40.0,),
              CustomButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  //context.read<AuthCubit>().createNewPassword();
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
