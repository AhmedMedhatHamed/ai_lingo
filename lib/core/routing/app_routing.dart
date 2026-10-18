import 'package:ai_lingo/feature/auth/login/presentation/ui/screen/login_screen.dart';
import 'package:ai_lingo/feature/auth/signup/presentation/ui/screen/signup_screen.dart';
import 'package:ai_lingo/feature/onboarding/screen/onboarding_screen.dart';
import 'package:ai_lingo/feature/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'app_routes.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case AppRoutes.signupScreen:
        return MaterialPageRoute(builder: (_) => SignupScreen());

      case 'onboardingScreen':
        return PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (_, _, _) => const OnboardingScreen(),
          transitionsBuilder: (_, animation, _, child) =>
              FadeTransition(opacity: animation, child: child),
        );
    }
    return null;
  }
}
