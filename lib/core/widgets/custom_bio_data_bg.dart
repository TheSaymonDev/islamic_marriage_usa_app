import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';

class CustomBioDataBg extends StatelessWidget {
  final Widget child;
  const CustomBioDataBg({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.primaryClr
      ),
      child: child,
    );
  }
}
