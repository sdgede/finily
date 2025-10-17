import 'package:finily/res/colors/colors.dart';
import 'package:finily/res/style/style.dart';
import 'package:flutter/material.dart';

class Tagline extends StatelessWidget {
  const Tagline({super.key, required this.text, this.color});
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: AppStyle.h4,
        color: color ?? AppColors.textDark,
        fontFamily: AppStyle.fontFamily,
      ),
      textAlign: TextAlign.center,
    );
  }
}
