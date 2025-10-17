import 'package:finily/res/colors/colors.dart';
import 'package:finily/res/style/style.dart';
import 'package:flutter/material.dart';

invoiceItems() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '#INV-001',
            style: TextStyle(
              fontSize: AppStyle.h4,
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "John Doe",
            style: TextStyle(
              fontSize: AppStyle.medium,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            "\$120.00",
            style: TextStyle(
              fontSize: AppStyle.h4,
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "May 25",
            style: TextStyle(
              fontSize: AppStyle.medium,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    ],
  );
}
