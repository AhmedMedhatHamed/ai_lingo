import 'package:ai_lingo/feature/auth/cubit/auth_cubit.dart';
import 'package:ai_lingo/feature/auth/forgot_password/screen/forgot_password_screen.dart';
import 'package:ai_lingo/feature/auth/login/screen/login_screen.dart';
import 'package:ai_lingo/feature/auth/sign_in/screen/sign_in_screen.dart';
import 'package:ai_lingo/feature/auth/signup/screen/signup_screen.dart';
import 'package:ai_lingo/feature/onboarding/screen/onboarding_screen.dart';
import 'package:ai_lingo/feature/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_routes.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case AppRoutes.signupScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(create: (_) => AuthCubit(), child: SignupScreen()),
        );

      case AppRoutes.signInScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(create: (_) => AuthCubit(), child: SignInScreen()),
        );

      case AppRoutes.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(create: (_) => AuthCubit(), child: ForgotPasswordScreen()),
        );

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
