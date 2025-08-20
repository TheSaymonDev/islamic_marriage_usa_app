import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.validator,
    this.keyboardType,
    this.maxLines,
    this.onTap,
    this.prefixText,
  });

  final void Function()? onTap;
  final String hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool readOnly;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? prefixText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      style: Theme.of(context).textTheme.bodyMedium,
      controller: controller,
      readOnly: readOnly,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        prefixText: prefixText,
        hintText: hintText,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      ),
    );
  }
}