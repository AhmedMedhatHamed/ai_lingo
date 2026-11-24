
import 'package:ai_lingo/core/notifications/notification_service.dart';
import 'package:ai_lingo/core/routing/app_routes.dart';
import 'package:ai_lingo/core/services/firestore_service.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/feature/profile/widgets/show_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import 'custom_list_tile.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  bool notificationsEnabled = true;
  bool isUpdatingNotifications = true;

  final FirestoreService _firestoreService = FirestoreService();
  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _loadNotificationSettings();
  }

  Future<void> _loadNotificationSettings() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      if (mounted) {
        setState(() => isUpdatingNotifications = false);
      }
      return;
    }

    try {
      final doc = await _firestoreService.getUser(user.uid);

      if (!mounted) return;

      setState(() {
        notificationsEnabled =
            doc.data()?['notificationsEnabled'] as bool? ?? true;
      });
    } catch (e) {
      debugPrint('Failed to load notification settings: $e');
    } finally {
      if (mounted) {
        setState(() => isUpdatingNotifications = false);
      }
    }
  }

  Future<void> _toggleNotifications(bool value) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null || isUpdatingNotifications) return;

    final previousValue = notificationsEnabled;

    setState(() {
      isUpdatingNotifications = true;
    });

    try {
      // Save preference first, so registration callbacks
      // can read the latest value.
      await _firestoreService.updateNotificationsEnabled(
        user.uid,
        value,
      );

      if (value) {
        await _notificationService.enableNotifications();
      } else {
        await _notificationService.disableNotifications();
      }

      if (!mounted) return;

      setState(() {
        notificationsEnabled = value;
      });

      debugPrint(
        'Notifications ${value ? "enabled" : "disabled"}',
      );
    } catch (e) {
      debugPrint('Failed to update notifications: $e');

      // Restore the previous preference if the operation failed.
      try {
        await _firestoreService.updateNotificationsEnabled(
          user.uid,
          previousValue,
        );
      } catch (rollbackError) {
        debugPrint(
          'Failed to restore notification preference: $rollbackError',
        );
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Could not update notification settings',
            ),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          isUpdatingNotifications = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          children: [
            Icon(Icons.settings),
            SizedBox(width: 5.0),
            Text(
              AppStrings.settings,
              style: AppStyles.almarai400Size24.copyWith(
                color: AppColors.splashColor,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        SizedBox(height: 5.0),
        CustomListTile(
          icon: Icons.notifications,
          text: AppStrings.notifications,
          trailing: Switch(
            value: notificationsEnabled,
            onChanged:
                isUpdatingNotifications ? null : _toggleNotifications,
            activeThumbColor: AppColors.primaryColor,
          ),
        ),
        CustomListTile(
          icon: Icons.lock,
          text: AppStrings.changePassword,
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.changePasswordScreen,
            );
          },
        ),
        CustomListTile(
          icon: Icons.help,
          text: 'Help & Support',
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        CustomListTile(
          icon: Icons.logout,
          text: 'Logout',
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            showWarningDialog(
              context,
              text: 'Are you sure you want to Log Out',
              action: AppStrings.logOut,
              buttonColor: AppColors.primaryColor,
              onPressed: () {
                ///logout logic
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.signInScreen,
                );
              },
            );
          },
        ),
        CustomListTile(
          icon: Icons.cancel,
          text: 'Delete Account',
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            showWarningDialog(
              context,
              text: 'Are uou sure you want to Delete this Account',
              action: 'Delete Account',
              buttonColor: AppColors.secondaryColor,
              onPressed: () {
                ///Delete Logic
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.signupScreen,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
