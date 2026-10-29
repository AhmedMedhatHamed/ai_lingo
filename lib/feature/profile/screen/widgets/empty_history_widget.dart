import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class EmptyHistoryWidget extends StatelessWidget {
  final VoidCallback? onStartPracticing;

  const EmptyHistoryWidget({super.key, this.onStartPracticing});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // أيقونة شات هادية
            Container(
              width: size.height * 0.14,
              height: size.height * 0.14,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.chat_bubble_outline_rounded,
                size: size.height * 0.07,
                color: AppColors.secondaryColor,
              ),
            ),
            SizedBox(height: size.height * 0.03),

            // العنوان
            Text(
              'No Conversation History',
              textAlign: TextAlign.center,
              style: AppStyles.cairo700Size36.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: size.height * 0.015),

            // الوصف
            Text(
              'Practice and speak in scenarios to start saving your conversation history.',
              textAlign: TextAlign.center,
              style: AppStyles.inter400Size11.copyWith(
                fontSize: 14,
                color: Colors.grey.shade600,
                height: 1.4,
              ),
            ),
            SizedBox(height: size.height * 0.04),

            // زرار ابدأ الممارسة
            SizedBox(
              width: double.infinity,
              height: size.height * 0.06,
              child: ElevatedButton(
                onPressed: onStartPracticing ?? () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size.height * 0.015),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Start Practicing',
                  style: AppStyles.inter400Size11.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
