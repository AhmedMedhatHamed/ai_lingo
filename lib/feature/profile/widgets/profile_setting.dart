import 'package:ai_lingo/core/routing/app_routes.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/feature/profile/widgets/show_dialog.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import 'custom_list_tile.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

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
            value: true,
            onChanged: (value) {},
            activeThumbColor: AppColors.primaryColor,
          ),
        ),
        CustomListTile(
          icon: Icons.lock,
          text: AppStrings.changePassword,
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.changePasswordScreen);
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
                Navigator.pushReplacementNamed(context, AppRoutes.signInScreen);
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
                Navigator.pushReplacementNamed(context, AppRoutes.signupScreen);
              },
            );
          },
        ),
      ],
    );
  }
}
