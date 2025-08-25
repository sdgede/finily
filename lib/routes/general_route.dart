import 'package:finily/res/constant/routes.dart';
import 'package:finily/routes/auth_route.dart';
import 'package:finily/ui/global/eror_screen.dart';
import 'package:flutter/material.dart';

class GeneralRoute {
  Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name?.startsWith(AppRoutes.auth) ?? false) {
      return AuthRoute.generateRoute(settings);
    }

    return MaterialPageRoute(builder: (_) => const ErrorScreen());
  }
}
