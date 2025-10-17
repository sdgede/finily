import 'package:finily/res/constant/routes.dart';
import 'package:finily/ui/global/eror_screen.dart';
import 'package:finily/ui/screens/customer_screen.dart';
import 'package:flutter/material.dart';

class CustomerRoute {
  static const String customer = AppRoutes.customer;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case customer:
        return MaterialPageRoute(builder: (_) => const CustomerScreen());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorScreen());
    }
  }
}
