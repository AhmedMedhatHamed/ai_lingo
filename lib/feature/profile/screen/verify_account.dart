import 'package:ai_lingo/core/utils/app_images.dart';
import 'package:ai_lingo/feature/profile/widgets/verify_account_form.dart';
import 'package:flutter/material.dart';

class VerifyAccount extends StatefulWidget {
  const VerifyAccount({super.key});

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Image.asset(AppImages.verificationImage)),
            SliverToBoxAdapter(child: VerifyAccountForm()),
          ],
        ),
      ),
    );
  }
}
