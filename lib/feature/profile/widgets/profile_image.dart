import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.backgroundColor,
        border: BoxBorder.all(
          color: AppColors.primaryColor,
          width: 3,
        ),
      ),
      child: Icon(Icons.person, size: 60.0, color: Colors.black),
    );
  }
}
