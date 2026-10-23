import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(automaticallyImplyLeading: true),
          SliverToBoxAdapter(
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.backgroundColor,
                border: BoxBorder.all(color: AppColors.primaryColor, width: 4),
              ),
              child: Icon(Icons.person, size: 60.0, color: Colors.black),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 60.0),),
          SliverToBoxAdapter(
            child: CustomTextField(
              controller: TextEditingController(),
              text: 'Name',
              prefixIcon: Icons.person,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 30.0),),
          SliverToBoxAdapter(
            child: CustomTextField(
              controller: TextEditingController(),
              text: 'Email Address',
              prefixIcon: Icons.email_rounded,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 100.0),),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButton(onPressed: (){}, text: 'Confirm',),
            ),
          )
        ],
      ),
    );
  }
}
