import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';

class ProfileManagementSection extends StatelessWidget {
  final void Function()? onTap;
  final ImageProvider<Object>? foregroundImage;
  final IconData iconData;

  const ProfileManagementSection({
    super.key,
    this.onTap,
    required this.foregroundImage,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50.r,
            foregroundImage: foregroundImage,
          ),
          Positioned(
            top: 2,
            right: 2,
            child: CircleAvatar(
              backgroundColor: AppColors.secondaryClr,
              radius: 13.r,
              child: Icon(iconData, color: Colors.white, size: 15.sp),
            ),
          )
        ],
      ),
    );
  }
}
