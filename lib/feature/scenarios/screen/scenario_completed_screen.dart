import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ScenarioCompletedScreen extends StatelessWidget {
  final String userName;
  final String scenarioTitle;
  final int newWordsCount;
  final int xpScore;
  final int fluencyPercentage;
  final VoidCallback? onBackToHome;
  final VoidCallback? onReviewConversation;

  const ScenarioCompletedScreen({
    super.key,
    this.userName = 'Reem',
    this.scenarioTitle = 'Ordering Coffee',
    this.newWordsCount = 4,
    this.xpScore = 50,
    this.fluencyPercentage = 92,
    this.onBackToHome,
    this.onReviewConversation,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06,
            vertical: size.height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // أيقونة الإنجاز والاحتفال
              Center(
                child: Container(
                  width: size.height * 0.12,
                  height: size.height * 0.12,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_rounded,
                    size: size.height * 0.07,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),

              // العنوان
              Text(
                'Great Job, $userName',
                textAlign: TextAlign.center,
                style: AppStyles.cairo700Size36.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: size.height * 0.01),

              // الوصف
              Text(
                'You successfully completed\n$scenarioTitle scenario!',
                textAlign: TextAlign.center,
                style: AppStyles.inter400Size11.copyWith(
                  fontSize: 15,
                  color: Colors.grey.shade600,
                  height: 1.4,
                ),
              ),
              SizedBox(height: size.height * 0.04),

              // بطاقة الإحصائيات الثلاثية
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02,
                  horizontal: size.width * 0.03,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(size.height * 0.015),
                  border: Border.all(color: Colors.blue.shade100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.shade50.withOpacity(0.5),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatCol(
                      label: 'New Words\nLearned',
                      value: '$newWordsCount',
                      valueColor: AppColors.primaryColor,
                      size: size,
                    ),
                    Container(
                      height: size.height * 0.05,
                      width: 1,
                      color: Colors.grey.shade300,
                    ),
                    _buildStatCol(
                      label: 'XP / Score',
                      value: '+$xpScore XP',
                      valueColor: AppColors.primaryColor,
                      size: size,
                    ),
                    Container(
                      height: size.height * 0.05,
                      width: 1,
                      color: Colors.grey.shade300,
                    ),
                    _buildStatCol(
                      label: 'Fluency',
                      value: '$fluencyPercentage%',
                      valueColor: AppColors.primaryColor,
                      size: size,
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03),

              // شريط الكلمات المتعلمة
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04,
                  vertical: size.height * 0.016,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(size.height * 0.015),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Learned Words',
                      style: AppStyles.inter400Size11.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.primaryColor,
                      size: size.height * 0.03,
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.06),

              // زر Back to Home
              SizedBox(
                width: double.infinity,
                height: size.height * 0.06,
                child: ElevatedButton(
                  onPressed: onBackToHome ?? () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.height * 0.015),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Back to Home',
                    style: AppStyles.inter400Size11.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.015),

              // زر Review Conversation
              TextButton(
                onPressed: onReviewConversation ?? () {},
                child: Text(
                  'Review Conversation',
                  style: AppStyles.inter400Size11.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCol({
    required String label,
    required String value,
    required Color valueColor,
    required Size size,
  }) {
    return Column(
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: AppStyles.inter400Size11.copyWith(
            fontSize: 11,
            color: Colors.grey.shade600,
          ),
        ),
        SizedBox(height: size.height * 0.006),
        Text(
          value,
          style: AppStyles.inter400Size11.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
