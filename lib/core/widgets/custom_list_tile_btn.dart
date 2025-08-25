import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';

class CustomListTileBtn extends StatelessWidget {
  final void Function()? onTap;
  final IconData iconData;
  final String title;
  final Color? tileColor;
  final Color? iconColor;
  const CustomListTileBtn({
    super.key,
    required this.onTap,
    required this.iconData,
    required this.title,
    this.tileColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: tileColor ?? AppColors.lightCardClr,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: BorderSide(color: AppColors.secondaryClr)),
      contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 20.w),
      leading: Padding(
        padding: EdgeInsets.only(right: 16.w),
        child: Icon(
          iconData,
          size: 25.sp,
          color: iconColor,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 20.sp,
      ),
    );
  }
}
