import 'package:ai_lingo/core/routing/app_routes.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileName extends StatelessWidget {
  const ProfileName({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = FirebaseAuth.instance.currentUser?.displayName ?? 'Guest';
    return Row(
      mainAxisAlignment: .center,
      children: [
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 35.0),
          child: Text(userName, style: AppStyles.almaraiBoldSize32,),
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.editProfileScreen);
          },
          icon: Icon(Icons.edit, color: Colors.black,size: 32,),
        ),
      ],
    );
  }
}
