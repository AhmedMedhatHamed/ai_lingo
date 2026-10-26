import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HistoryCardItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String time;
  final VoidCallback? onTap;

  const HistoryCardItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.time,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.black),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Icon(icon, color: iconColor, size: 28.0),
        title: Text(
          title,
          style:  AppStyles.cairo400Size24,
        ),
        subtitle: Text(
          time,
          style: AppStyles.cairo400Size24.copyWith(color: AppColors.splashColor,fontSize: 20.0),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16.0,
          color: Colors.black,
        ),
        onTap: onTap,
      ),
    );
  }
}
