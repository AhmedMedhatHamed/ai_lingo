import 'package:ai_lingo/core/routing/app_routes.dart';
import 'package:ai_lingo/core/services/validator.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

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
              CustomTextField(
                controller: TextEditingController(),
                text: AppStrings.emailAddress,
                prefixIcon: Icons.email_rounded,
                textInputAction: .done,
                validator: Validators.email,
                textInputType: .emailAddress,
              ),

              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();

                          Navigator.pushNamed(
                            context,
                            AppRoutes.verificationScreen,
                          );
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
