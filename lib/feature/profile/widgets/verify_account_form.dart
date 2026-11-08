import 'package:ai_lingo/core/routing/app_routes.dart';
import 'package:ai_lingo/core/services/validator.dart';
import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_field.dart';
import 'package:ai_lingo/feature/auth/verification/cubit/phone_verification_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyAccountForm extends StatefulWidget {
  const VerifyAccountForm({super.key});

  @override
  State<VerifyAccountForm> createState() => _VerifyAccountFormState();
}

class _VerifyAccountFormState extends State<VerifyAccountForm> {
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  // Firebase يطلب الرقم بصيغة دولية E.164 مثل +201012345678
  String _formatPhone(String input) {
    var phone = input.trim().replaceAll(' ', '');
    if (phone.startsWith('+')) return phone;
    if (phone.startsWith('0')) phone = phone.substring(1);
    return '+20$phone'; // غيّر كود الدولة حسب الحاجة
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhoneVerificationCubit, PhoneVerificationState>(
      listener: (context, state) {
        if (state is PhoneCodeSentState) {
          Navigator.pushReplacementNamed(context, AppRoutes.verificationScreen);
        } else if (state is PhoneVerificationSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Account Verified Successfully',
                style: AppStyles.cairo400Size24,
              ),
            ),
          );
          Navigator.pushReplacementNamed(context, AppRoutes.profileSetupScreen);
        } else if (state is PhoneVerificationFailureState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMsg)));
        }
      },
      builder: (context, state) {
        final isLoading = state is PhoneVerificationLoadingState;

        return Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: phoneController,
                text: 'Phone',
                prefixIcon: Icons.phone,
                textInputType: .phone,
                validator: Validators.phone,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              isLoading
                  ? CupertinoActivityIndicator(color: AppColors.primaryColor)
                  : CustomButton(
                      text: 'Verify',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<PhoneVerificationCubit>().sendCode(
                            _formatPhone(phoneController.text),
                          );
                        }
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
