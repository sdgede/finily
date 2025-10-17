import 'package:finily/res/colors/colors.dart';
import 'package:finily/res/constant/routes.dart';
import 'package:flutter/material.dart';

SizedBox invoiceCreate(BuildContext context) {
  return SizedBox(
    width: 55, // diameter lingkaran
    height: 55,
    child: FloatingActionButton(
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.invoice,
          (route) => false,
        );
      },
      backgroundColor: AppColors.textLight,
      elevation: 6, // biar ada efek mengambang
      shape: const CircleBorder(), // pastikan lingkaran penuh
      child: Icon(
        Icons.add,
        color: AppColors.primaryColor,
        size: 35, // agak besar biar proporsional
      ),
    ),
  );
}
