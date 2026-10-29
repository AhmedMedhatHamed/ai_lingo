import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/feature/home/widgets/progress_stat_card.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.01),
                Text(
                  AppStrings.yourProgress,
                  style: AppStyles.cairo400Size24.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height * 0.04),

                // شريط التقدم
                Row(
                  children: [
                    Text(
                      '60%',
                      style: AppStyles.inter400Size11.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(width: size.width * 0.03),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(size.height * 0.01),
                        child: LinearProgressIndicator(
                          value: 0.6,
                          minHeight: size.height * 0.014,
                          backgroundColor: const Color(0xFFE2E8F0),
                          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),

                // المستوى
                Text(
                  'Level 1 - Beginner',
                  style: AppStyles.inter400Size11.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondaryColor,
                  ),
                ),
                SizedBox(height: size.height * 0.04),

                // الكروت المستقلة
                 ProgressStatCard(
                  icon: Icons.bookmark_border,
                  iconColor: AppColors.primaryColor,
                  title: AppStrings.savedWords,
                  value: '12',
                ),
                SizedBox(height: size.height * 0.02),

                 ProgressStatCard(
                  icon: Icons.smart_toy_outlined,
                  iconColor: AppColors.secondaryColor,
                  title: AppStrings.completedConversations,
                  value: '4',
                ),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
