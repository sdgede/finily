import 'package:finily/res/colors/colors.dart';
import 'package:finily/res/style/style.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, this.color, required this.text});

  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: AppStyle.h1 * 2,
        fontWeight: FontWeight.bold,
        color: color ?? AppColors.textDark,
      ),
      textAlign: TextAlign.center,
    );
  }
}
