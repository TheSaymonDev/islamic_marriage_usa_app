import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';

class CustomElevatedBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;
  final double? width;
  final double? height;
  final IconData? icon;
  final TextStyle? style;

  const CustomElevatedBtn({
    super.key,
    required this.onPressed,
    required this.name,
    this.width,
    this.height,
    this.icon,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity.w,
      height: height ?? 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        gradient: const LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [
            AppColors.secondaryClr,
            AppColors.primaryClr,
          ],
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.zero),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 20.sp,
              ),
              Gap(4.w),
            ],
            Text(name,
                style: style ??
                    Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white))
          ],
        ),
      ),
    );
  }
}
