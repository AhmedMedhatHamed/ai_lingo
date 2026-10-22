import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/feature/auth/signup/widgets/title_and_description.dart';
import 'package:flutter/material.dart';
import '../widgets/new_password_form.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(automaticallyImplyLeading: true),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TitleAndDescriptionWidget(
                  title: AppStrings.createNewPassword,
                  description: AppStrings.createNewPasswordDesc,
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 40.0)),
            SliverToBoxAdapter(child: NewPasswordForm(),)
          ],
        ),
      ),
    );
  }
}

