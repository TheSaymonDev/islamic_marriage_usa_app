import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';

class CustomExpansionTile extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final bool leading;
  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.children,
    this.leading = true,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: AppColors.primaryClr,
      iconColor: AppColors.primaryClr,
      shape: const RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      leading: leading == true
          ? Container(
              height: 25.h,
              width: 25.w,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.primaryClr),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20.sp,
              ),
            )
          : null,
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
      children: children,
    );
  }
}
