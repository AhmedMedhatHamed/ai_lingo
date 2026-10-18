import 'package:ai_lingo/core/routing/app_routes.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:ai_lingo/core/utils/app_styles.dart';
import 'package:ai_lingo/core/widgets/custom_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> buildShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: .min,
        mainAxisAlignment: .end,
        children: [
          Container(
            width: 360.0,
            height: 380.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    Icon(
                      CupertinoIcons.bell_fill,
                      color: Colors.black,
                      size: 40.0,
                    ),
                    Text(
                      AppStrings.alertTitle,
                      style: AppStyles.cairo700Size36
                          .copyWith(fontSize: 24.0),
                    ),
                  ],
                ),
                SizedBox(height: 40.0),
                Text(
                  AppStrings.alertDescription,
                  style: AppStyles.cairo400Size24
                      .copyWith(
                    fontSize: 20.0,
                    color: Color(0xff304A73),
                  ),
                ),
                SizedBox(height: 24.0),
                CustomTextButton(
                  text: AppStrings.allow,
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.loginScreen,
                    );
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    AppStrings.doNotAllow,
                    style: AppStyles.cairo700Size36
                        .copyWith(
                      fontSize: 32.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
