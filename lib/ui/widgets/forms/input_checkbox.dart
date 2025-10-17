import 'package:flutter/material.dart';
import 'package:finily/res/colors/colors.dart';
import 'package:finily/res/string/string.dart';
import 'package:finily/res/style/style.dart';

class InputCheckbox extends StatelessWidget {
  const InputCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      initialValue: false,
      validator: (value) {
        if (value != true) {
          return "❌ Anda harus menyetujui syarat & ketentuan";
        }
        return null;
      },
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
                  value: state.value ?? false,
                  onChanged: (value) {
                    state.didChange(value);
                  },
                  checkColor: AppColors.textLight,
                  activeColor: AppColors.primaryColor,
                ),
                Expanded(
                  child: Text(
                    AppStrings.acceptTerms,
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: AppStyle.h4,
                    ),
                  ),
                ),
              ],
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  state.errorText!,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}
