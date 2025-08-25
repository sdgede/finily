import 'package:finily/res/colors/colors.dart';
import 'package:finily/res/string/string.dart';
import 'package:finily/res/style/style.dart';
import 'package:flutter/material.dart';

class InputCheckbox extends StatelessWidget {
  const InputCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (value) {},
          checkColor: AppColors.textLight,
          activeColor: AppColors.primaryColor,
        ),
        Expanded(
          child: Text(
            AppStrings.acceptTerms,
            style: TextStyle(color: AppColors.textDark, fontSize: AppStyle.h4),
          ),
        ),
      ],
    );
  }
}
