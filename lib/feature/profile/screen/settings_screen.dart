import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

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
        title: Text(
          'Settings',
          style: AppStyles.cairo700Size36.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: size.height * 0.02,
          ),
          child: Column(
            children: [
              // قسم الإشعارات
              _buildSwitchItem(
                icon: Icons.notifications_none_rounded,
                title: 'Notifications',
                value: _notificationsEnabled,
                onChanged: (val) {
                  setState(() {
                    _notificationsEnabled = val;
                  });
                },
                size: size,
              ),
              SizedBox(height: size.height * 0.015),

              // قسم الوضع الليلي
              _buildSwitchItem(
                icon: Icons.dark_mode_outlined,
                title: 'Dark Mode',
                value: _darkModeEnabled,
                onChanged: (val) {
                  setState(() {
                    _darkModeEnabled = val;
                  });
                },
                size: size,
              ),
              SizedBox(height: size.height * 0.015),

              // قسم اللغة
              _buildNavigationItem(
                icon: Icons.language_rounded,
                title: 'App Language',
                trailingText: 'English',
                onTap: () {},
                size: size,
              ),
              SizedBox(height: size.height * 0.015),

              // سياسة الخصوصية
              _buildNavigationItem(
                icon: Icons.privacy_tip_outlined,
                title: 'Privacy Policy',
                onTap: () {},
                size: size,
              ),
              SizedBox(height: size.height * 0.04),

              // زرار تسجيل الخروج
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(size.height * 0.015),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.018,
                    horizontal: size.width * 0.04,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(size.height * 0.015),
                    border: Border.all(color: Colors.red.shade100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout_rounded, color: Colors.red.shade700, size: size.height * 0.025),
                      SizedBox(width: size.width * 0.02),
                      Text(
                        'Log Out',
                        style: AppStyles.inter400Size11.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.red.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchItem({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
    required Size size,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.008,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(size.height * 0.015),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryColor, size: size.height * 0.028),
          SizedBox(width: size.width * 0.03),
          Expanded(
            child: Text(
              title,
              style: AppStyles.inter400Size11.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationItem({
    required IconData icon,
    required String title,
    String? trailingText,
    required VoidCallback onTap,
    required Size size,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(size.height * 0.015),
      child: Container(
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
          children: [
            Icon(icon, color: AppColors.primaryColor, size: size.height * 0.028),
            SizedBox(width: size.width * 0.03),
            Expanded(
              child: Text(
                title,
                style: AppStyles.inter400Size11.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            if (trailingText != null) ...[
              Text(
                trailingText,
                style: AppStyles.inter400Size11.copyWith(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(width: size.width * 0.02),
            ],
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: size.height * 0.018,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
