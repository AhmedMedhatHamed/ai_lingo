import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/feature/profile/widgets/change_pass_form.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(automaticallyImplyLeading: true),
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                AppStrings.changePassword,
                style: AppStyles.almarai400Size24.copyWith(
                  fontSize: 32.0,
                  fontWeight: .bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 60.0)),
          SliverToBoxAdapter(child: ChangePasswordForm()),
        ],
      ),
    );
  }
}
