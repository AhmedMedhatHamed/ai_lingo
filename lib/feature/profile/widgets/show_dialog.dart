import 'package:ai_lingo/core/utils/app_colors.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> showWarningDialog(
    BuildContext context, {
      required String text,
      required String action,
      required Color buttonColor,
      required void Function()? onPressed,
    }) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Align(
          alignment: .bottomCenter,
          child: Container(
            width: 400.0,
            height: 170.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 12.0,
            ),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(color: AppColors.primaryColor, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 6,
                  offset: const Offset(2, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  CupertinoIcons.bell_slash_fill,
                  color: Colors.black,
                  size: 18.0,
                ),
                SizedBox(height: 8.0),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppStyles.cairo400Size24.copyWith(
                    fontSize: 18.0,
                    color: AppColors.splashColor,
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        foregroundColor: buttonColor,
                        minimumSize: const Size(85, 40),
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        elevation: 4.0,
                      ),
                      onPressed: onPressed,
                      child: Text(
                        action,
                        style: AppStyles.cairo400Size24.copyWith(
                          fontSize: 20.0,
                          color: AppColors.backgroundColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: AppStyles.inter400Size11.copyWith(
                          fontSize: 16.0,
                          color: AppColors.splashColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}