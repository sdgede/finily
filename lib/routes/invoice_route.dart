import 'package:finily/res/constant/routes.dart';
import 'package:finily/ui/global/eror_screen.dart';
import 'package:finily/ui/screens/create_invoice.dart';
import 'package:flutter/material.dart';

class InvoiceRoute {
  static const String invoice = AppRoutes.invoice;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case invoice:
        return MaterialPageRoute(builder: (_) => const CreateInvoice());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorScreen());
    }
  }
}
