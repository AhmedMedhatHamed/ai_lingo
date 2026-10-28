import 'package:ai_lingo/feature/profile/widgets/profile_details.dart';
import 'package:ai_lingo/feature/profile/widgets/profile_image.dart';
import 'package:ai_lingo/feature/profile/widgets/profile_level.dart';
import 'package:ai_lingo/feature/profile/widgets/profile_name.dart';
import 'package:ai_lingo/feature/profile/widgets/profile_setting.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 32.0)),
              SliverToBoxAdapter(child: ProfileImage()),
              SliverToBoxAdapter(child: SizedBox(height: 15.0)),
              SliverToBoxAdapter(child: ProfileName()),
              SliverToBoxAdapter(child: SizedBox(height: 15.0)),
              SliverToBoxAdapter(child: ProfileLevel()),
              SliverToBoxAdapter(child: ProfileDetails()),
              SliverToBoxAdapter(child: SizedBox(height: 10.0)),
              SliverToBoxAdapter(child: ProfileSetting()),
            ],
          ),
        ),
      ),
    );
  }
}


