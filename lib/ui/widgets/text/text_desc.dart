import 'package:finily/res/colors/colors.dart';
import 'package:finily/res/string/string.dart';
import 'package:finily/res/style/style.dart';
import 'package:flutter/material.dart';

class TextDesc extends StatelessWidget {
  const TextDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.acceptTerms,
      style: TextStyle(color: AppColors.textDark, fontSize: AppStyle.h4),
    );
  }
}
