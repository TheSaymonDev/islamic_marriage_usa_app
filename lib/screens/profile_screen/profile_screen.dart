import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/config/routes/app_routes.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_elevated_btn.dart';
import 'package:islamic_marriage_usa_app/screens/profile_screen/widgets/profile_management_section.dart';
import 'package:islamic_marriage_usa_app/screens/profile_screen/widgets/profile_action_btn.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity.h,
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Gap(12.h),
            ProfileManagementSection(
              onTap: () {},
              iconData: Icons.edit,
              foregroundImage: AssetImage(AppUrls.placeHolderPng),
            ),
            Gap(12.h),
            CustomElevatedBtn(
              onPressed: () {},
              name: 'My Bio Data',
              width: 180.w,
              height: 45.h,
            ),
            Gap(16.h),
            ProfileActionBtn(
              onTap: () => Get.toNamed(AppRoutes.bioDataManagementScreen),
              iconData: Icons.edit,
              title: 'Edit Bio Data',
            ),
            Gap(8.h),
            ProfileActionBtn(
              onTap: () {},
              iconData: Icons.favorite,
              title: 'Favourite Bio Data',
            ),
            Gap(8.h),
            ProfileActionBtn(
              onTap: () {},
              iconData: Icons.shopping_cart,
              title: 'My Purchases',
            ),
            Gap(8.h),
            ProfileActionBtn(
              onTap: () {},
              iconData: Icons.help_center,
              title: 'Help Center',
            ),
            Gap(8.h),
            ProfileActionBtn(
                onTap: () {},
                iconData: Icons.privacy_tip,
                title: 'Privacy Policy'),
            Gap(8.h),
            ProfileActionBtn(
              onTap: () {},
              iconData: Icons.info,
              title: 'About Us',
            ),
            Gap(8.h),
            ProfileActionBtn(
              onTap: () {},
              iconData: Icons.delete,
              title: 'Delete Bio Data',
              tileColor: AppColors.redClr.withValues(alpha: 0.2),
            ),
            Gap(8.h),
            ProfileActionBtn(
              onTap: () {},
              iconData: Icons.logout,
              title: 'Logout',
              tileColor: AppColors.greenClr.withValues(alpha: 0.2),
            ),
            Gap(16.h)
          ],
        ),
      ),
    );
  }
}
