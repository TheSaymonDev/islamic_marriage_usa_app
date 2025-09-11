import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';

class CustomMultiSelectDropdownBtn extends StatelessWidget {
  final List<String> items;
  final List<String> selectedValues;
  final ValueChanged<List<String>> onChanged;
  final String? hintText;
  final FormFieldValidator<List<String>>? validator;

  const CustomMultiSelectDropdownBtn({
    super.key,
    required this.items,
    required this.selectedValues,
    required this.onChanged,
    this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      value: items.isNotEmpty ? items.first : null,
      validator: (_) {
        if (validator != null) return validator!(selectedValues);
        return null;
      },
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          enabled: false,
          child: StatefulBuilder(
            builder: (context, menuSetState) {
              final isSelected = selectedValues.contains(item);
              return ListTile(
                onTap: () {
                  if (isSelected) {
                    selectedValues.remove(item);
                  } else {
                    selectedValues.add(item);
                  }
                  menuSetState(() {});
                  onChanged(List<String>.from(selectedValues));
                },
                leading:  Icon(
                  isSelected
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                  color: isSelected
                      ? AppColors.primaryClr
                      : AppColors.darkGreyClr,
                  size: 20.sp,
                ),
                title: Text(
                  item,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            },
          ),
        );
      }).toList(),
      onChanged: (_) {},
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
        suffixIcon: selectedValues.isNotEmpty
            ? IconButton(
                icon: Icon(
                  Icons.clear,
                  color: AppColors.primaryClr,
                  size: 25.sp,
                ),
                onPressed: () => onChanged([]),
              )
            : null,
      ),
      hint: Text(
        hintText ?? 'Select a one',
        style: TextStyle(
            fontSize: 20.sp,
            color: AppColors.darkGreyClr,
            fontFamily: 'Onest',
            fontWeight: FontWeight.w400),
      ),
      iconStyleData: IconStyleData(
        icon: items.isNotEmpty
            ? Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.primaryClr,
                size: 25.sp,
              )
            : const SizedBox.shrink(), // Empty widget when value is selected
      ),
      // ✅ এখানে সিলেক্ট করা ভ্যালুগুলো কমা দিয়ে দেখাবে
      selectedItemBuilder: (context) {
        return items.map((item) {
          if (selectedValues.isEmpty) {
            return Text(
              hintText ?? 'Select one or more',
              style: TextStyle(
                fontSize: 20.sp,
                color: AppColors.darkGreyClr,
                fontFamily: 'Onest',
                fontWeight: FontWeight.w400,
              ),
            );
          }
          return Text(
            selectedValues.join(", "),
            style: TextStyle(
              fontSize: 18.sp,
              color: AppColors.primaryClr,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          );
        }).toList();
      },
    );
  }
}
