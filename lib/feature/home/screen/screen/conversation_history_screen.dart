import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/feature/home/widgets/history_card_item.dart';
import 'package:flutter/material.dart';

class ConversationHistoryScreen extends StatelessWidget {
  const ConversationHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  AppStrings.conversationHistory,
                  style: AppStyles.almaraiBoldSize32,
                ),
              ),
              const SizedBox(height: 30.0),
              HistoryCardItem(
                icon: Icons.coffee,
                iconColor: AppColors.secondaryColor,
                title: 'Ordering Coffee',
                time: 'Today 10:24 AM',
              ),
              const SizedBox(height: 14.0),
              HistoryCardItem(
                icon: Icons.flight,
                iconColor: AppColors.secondaryColor,
                title: 'Airport Check-in',
                time: 'Yesterday 04:12 PM',
              ),
              const SizedBox(height: 14.0),
              HistoryCardItem(
                icon: Icons.work_outline,
                iconColor: AppColors.secondaryColor,
                title: 'Job Interview',
                time: 'Yesterday 11:03 AM',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
