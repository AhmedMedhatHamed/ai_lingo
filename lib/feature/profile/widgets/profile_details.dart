import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 6.0),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Text(
                'View Details',
                style: AppStyles.cairo400Size24.copyWith(
                  fontSize: 16.0,
                  color: AppColors.splashColor,
                ),
              ),
            ),
            SizedBox(width: 2.0),
            Icon(Icons.arrow_forward_ios, size: 16.0),
          ],
        ),
        SizedBox(height: 10.0),
        Container(
          height: 95.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20.0),
            border: BoxBorder.all(color: Colors.black, width: 2.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  '🔥 (Streak) 5',
                  style: AppStyles.cairo400Size24.copyWith(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8.0,),
                VerticalDivider(color: Colors.white,),
                Text(
                  ' (Scenarios) 8',
                  style: AppStyles.cairo400Size24.copyWith(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8.0,),
                VerticalDivider(color: Colors.white,),
                Text(
                  ' (Words) 12',
                  style: AppStyles.cairo400Size24.copyWith(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
