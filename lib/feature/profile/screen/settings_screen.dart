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
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: size.height * 0.02,
          ),
          child: Column(
            children: [
              // 1. Notifications
              _buildSettingItem(
                icon: Icons.notifications_none_rounded,
                title: 'Notifications',
                size: size,
                trailing: Switch(
                  value: _notificationsEnabled,
                  onChanged: (val) {
                    setState(() {
                      _notificationsEnabled = val;
                    });
                  },
                  activeColor: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: size.height * 0.015),

              // 2. Change Password
              _buildSettingItem(
                icon: Icons.lock_outline_rounded,
                title: 'Change Password',
                size: size,
                onTap: () {},
              ),
              SizedBox(height: size.height * 0.015),

              // 3. Help & Support
              _buildSettingItem(
                icon: Icons.help_outline_rounded,
                title: 'Help & Support',
                size: size,
                onTap: () {},
              ),
              SizedBox(height: size.height * 0.015),

              // 4. Log Out
              _buildSettingItem(
                icon: Icons.logout_rounded,
                title: 'Log Out',
                size: size,
                onTap: () {},
              ),
              SizedBox(height: size.height * 0.015),

              // 5. Delete Account
              _buildSettingItem(
                icon: Icons.person_remove_outlined,
                title: 'Delete Account',
                size: size,
                isDestructive: true,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required Size size,
    Widget? trailing,
    VoidCallback? onTap,
    bool isDestructive = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(size.height * 0.015),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.015,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(size.height * 0.015),
          border: Border.all(
            color: isDestructive ? Colors.red.shade100 : Colors.grey.shade200,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isDestructive ? Colors.red.shade600 : AppColors.primaryColor,
              size: size.height * 0.026,
            ),
            SizedBox(width: size.width * 0.03),
            Expanded(
              child: Text(
                title,
                style: AppStyles.inter400Size11.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: isDestructive ? Colors.red.shade600 : Colors.black87,
                ),
              ),
            ),
            trailing ??
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
