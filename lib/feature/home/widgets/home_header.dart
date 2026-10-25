import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_images.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: size.width * 0.15,
          height: size.width * 0.15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: AppColors.splashColor),
          ),
          child: Icon(Icons.person_3, size: 30, color: AppColors.splashColor),
        ),

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
                        color: Color(0xff304A73),
                      ),
                    ),
                    Text(
                      'Reem',
                      style: AppStyles.almarai400Size24.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
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
