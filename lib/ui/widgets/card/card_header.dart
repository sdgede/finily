import 'package:finily/res/colors/colors.dart';
import 'package:flutter/material.dart';

headerCard(Size size, String text, String amount, Color colors) {
  return Container(
    width: size.width / 2.4,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: colors,
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textLight,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            amount,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    ),
  );
}
