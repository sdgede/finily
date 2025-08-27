import 'package:flutter/material.dart';
import 'package:finily/res/colors/colors.dart';

class InputText extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const InputText({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.validator,
    this.onChanged,
  });

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        prefixIcon:
            widget.prefixIcon != null
                ? Icon(widget.prefixIcon, color: AppColors.primaryColor)
                : null,
        suffixIcon:
            widget.obscureText
                ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () => setState(() => _obscureText = !_obscureText),
                )
                : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.primaryColor.withOpacity(0.5),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red.shade700, width: 2),
        ),
        labelText: widget.label,
        hintText: widget.hint,
        labelStyle: TextStyle(color: AppColors.primaryColor),
      ),
    );
  }
}
