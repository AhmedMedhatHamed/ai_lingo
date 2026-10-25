import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/feature/home/widgets/history_progress_card.dart';
import 'package:flutter/material.dart';

class QuickAccess extends StatelessWidget {
  const QuickAccess({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.quickAccess,
          style: AppStyles.cairo700Size36.copyWith(
            fontSize: 28,
            color: AppColors.splashColor,
          ),
        ),
        SizedBox(height: size.height * 0.02),
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            HistoryProgressCard(icon: Icons.history, title: AppStrings.history),
            HistoryProgressCard(
              icon: Icons.trending_up,
              title: AppStrings.progress,
            ),
          ],
        ),
      ],
    );
  }
}
