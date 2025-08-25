import 'package:finily/res/constant/routes.dart';
import 'package:finily/ui/global/eror_screen.dart';
import 'package:finily/ui/screens/auth/main_screen.dart';
import 'package:finily/ui/screens/auth/splash_screen.dart';
import 'package:flutter/material.dart';

class AuthRoute {
  static const String splash = '${AppRoutes.auth}/splash';
  static const String main = '${AppRoutes.auth}/main';
  static const String login = '${AppRoutes.auth}/login';
  static const String register = '${AppRoutes.auth}/register';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorScreen());
    }
  }
}
