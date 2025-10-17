import 'package:finily/res/constant/routes.dart';
import 'package:finily/routes/auth_route.dart';
import 'package:finily/routes/customer_route.dart';
import 'package:finily/routes/home_route.dart';
import 'package:finily/routes/invoice_route.dart';
import 'package:finily/ui/global/eror_screen.dart';
import 'package:flutter/material.dart';

class GeneralRoute {
  Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name?.startsWith(AppRoutes.auth) ?? false) {
      return AuthRoute.generateRoute(settings);
    } else if (settings.name == AppRoutes.home) {
      return HomeRoute.generateRoute(settings);
    } else if (settings.name == AppRoutes.customer) {
      return CustomerRoute.generateRoute(settings);
    } else if (settings.name == AppRoutes.invoice) {
      return InvoiceRoute.generateRoute(settings);
    }
    return MaterialPageRoute(builder: (_) => const ErrorScreen());
  }
}
