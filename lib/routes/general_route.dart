import 'package:finily/res/constant/routes.dart';
import 'package:finily/ui/global/eror_screen.dart';
import 'package:finily/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class GeneralRoute {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      default:
        return MaterialPageRoute(builder: (context) => const ErrorScreen());
    }
  }
}
