import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_images.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final userName = FirebaseAuth.instance.currentUser?.displayName ?? 'Guest';
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SizedBox(height: size.height * 0.02),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello',
                      style: AppStyles.cairo400Size24.copyWith(
                        fontSize: 32,
                        color: AppColors.splashColor,
                      ),
                    ),
                    Text(
                      userName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.almarai400Size24.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        Column(
          children: [
            SizedBox(height: size.height * 0.06),
            Container(
              height: size.height * 0.05,
              width: size.width * 0.35,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(size.height * 0.03),
              ),
              child: Row(
                children: [
                  Image.asset(
                    AppImages.daysGif,
                    width: size.width * 0.1,
                    height: size.width * 0.1,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    '5 Days',
                    style: AppStyles.almarai400Size24.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
