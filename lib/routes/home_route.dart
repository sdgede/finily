import 'package:finily/res/constant/routes.dart';
import 'package:finily/ui/global/eror_screen.dart';
import 'package:finily/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class HomeRoute {
  static const String home = AppRoutes.home;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorScreen());
    }
  }
}
