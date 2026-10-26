import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HistoryProgressCard extends StatelessWidget {
  const HistoryProgressCard({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.height * 0.01),
          border: Border.all(width: size.height * 0.002, color: Colors.grey),
        ),
        padding: EdgeInsets.all(size.height * 0.01),
        child: Column(
          children: [
            Icon(
              icon,
              color: AppColors.secondaryColor,
              size: size.height * 0.05,
            ),
            Text(title, style: AppStyles.cairo700Size36.copyWith(fontSize: 28)),
          ],
        ),
      ),
    );
  }
}
