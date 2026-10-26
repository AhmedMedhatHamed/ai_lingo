import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  final VoidCallback? onRetry;

  const NoInternetScreen({super.key, this.onRetry});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              // أيقونة انقطاع الإنترنت
              Container(
                width: size.height * 0.16,
                height: size.height * 0.16,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.08),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.wifi_off_rounded,
                  size: size.height * 0.08,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: size.height * 0.04),

              // العنوان
              Text(
                'No Internet Connection',
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
                'Please check your network settings and try again.',
                textAlign: TextAlign.center,
                style: AppStyles.inter400Size11.copyWith(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  height: 1.4,
                ),
              ),
              const Spacer(),

              // زر إعادة المحاولة (Try Again)
              SizedBox(
                width: double.infinity,
                height: size.height * 0.06,
                child: ElevatedButton(
                  onPressed: onRetry ?? () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.height * 0.015),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Try Again',
                    style: AppStyles.inter400Size11.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
