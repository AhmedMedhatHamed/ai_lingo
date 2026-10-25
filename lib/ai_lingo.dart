import 'package:ai_lingo/core/routing/app_routes.dart';
import 'package:ai_lingo/core/routing/app_routing.dart';
import 'package:ai_lingo/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class AiLingoApp extends StatelessWidget {
  const AiLingoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      initialRoute: AppRoutes.vocabularyScreen,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
