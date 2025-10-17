import 'package:finily/res/colors/colors.dart';
import 'package:flutter/material.dart';

AppBar appbarPrimary({required String text, required VoidCallback onTap}) {
  return AppBar(
    leading: Builder(
      builder:
          (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(Icons.menu, color: AppColors.textLight),
          ),
    ),
    title: Text(
      text,
      style: TextStyle(
        color: AppColors.textLight,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: onTap,
        icon: Icon(Icons.notifications, color: AppColors.textLight),
      ),
      const SizedBox(width: 8),
    ],
    backgroundColor: AppColors.primaryColor,
    elevation: 0,
  );
}
