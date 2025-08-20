import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';

class CustomDropdownBtn extends StatelessWidget {
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String? hintText;
  final FormFieldValidator<String>? validator;

  const CustomDropdownBtn({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item, style: Theme.of(context).textTheme.bodyMedium),
        );
      }).toList(),
      onChanged: onChanged,
      validator: validator,
      value: value,
      hint: Text(
        hintText ?? 'Select a one',
        style: TextStyle(
            fontSize: 20.sp,
            color: AppColors.darkGreyClr,
            fontFamily: 'Onest',
            fontWeight: FontWeight.w400),
      ),
      // style: Theme.of(context).textTheme.bodySmall,
      iconStyleData: IconStyleData(
        icon: value == null
            ? Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.primaryClr,
                size: 25.sp,
              )
            : const SizedBox.shrink(), // Empty widget when value is selected
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
        suffixIcon: value != null
            ? IconButton(
                icon: Icon(
                  Icons.clear,
                  color: AppColors.primaryClr,
                  size: 25.sp,
                ),
                onPressed: () => onChanged(null), // Clear selection
              )
            : null,
      ),
    );
  }
}
