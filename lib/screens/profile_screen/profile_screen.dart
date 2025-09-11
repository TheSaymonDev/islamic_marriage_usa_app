import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/config/routes/app_routes.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_elevated_btn.dart';
import 'package:islamic_marriage_usa_app/data/services/shared_preference_service.dart';
import 'package:islamic_marriage_usa_app/screens/profile_screen/controllers/current_user_controller.dart';
import 'package:islamic_marriage_usa_app/screens/profile_screen/controllers/delete_biodata_controller.dart';
import 'package:islamic_marriage_usa_app/screens/profile_screen/widgets/biodata_status_chip.dart';
import 'package:islamic_marriage_usa_app/screens/profile_screen/widgets/profile_management_section.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_list_tile_btn.dart';

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
              onTap: () => Get.toNamed(AppRoutes.updateProfileScreen),
              iconData: Icons.edit,
              foregroundImage: AssetImage(AppUrls.placeHolderPng),
            ),
            Text(
              'Biodata Status',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Gap(4.h),
            GetBuilder<CurrentUserController>(
              builder: (controller) {
                final status = controller.userData?.data?.biodataStatus ?? "Draft";
                return BiodataStatusChip(status: status);
              },
            ),
            Gap(8.h),
            CustomElevatedBtn(
              onPressed: () => Get.toNamed(AppRoutes.myBiodataScreen),
              name: 'My Bio Data',
              width: 180.w,
              height: 45.h,
            ),
            Gap(16.h),
            CustomListTileBtn(
              onTap: () => Get.toNamed(AppRoutes.biodataManagementScreen),
              iconData: Icons.edit,
              title: 'Edit Bio Data',
            ),
            Gap(8.h),
            CustomListTileBtn(
              onTap: () => Get.toNamed(AppRoutes.favouriteBiodataScreen),
              iconData: Icons.favorite,
              title: 'Favourite Bio Data',
            ),
            Gap(8.h),
            CustomListTileBtn(
              onTap: () => Get.toNamed(AppRoutes.purchaseScreen),
              iconData: Icons.shopping_cart,
              title: 'My Purchases',
            ),
            Gap(8.h),
            CustomListTileBtn(
              onTap: () => Get.toNamed(AppRoutes.helpCenterScreen),
              iconData: Icons.help_center,
              title: 'Help Center',
            ),
            Gap(8.h),
            CustomListTileBtn(
              onTap: () => Get.toNamed(AppRoutes.privacyPolicyScreen),
              iconData: Icons.privacy_tip,
              title: 'Privacy Policy',
            ),
            Gap(8.h),
            CustomListTileBtn(
              onTap: () => Get.toNamed(AppRoutes.aboutUsScreen),
              iconData: Icons.info,
              title: 'About Us',
            ),
            Gap(8.h),
            CustomListTileBtn(
              onTap: () => _showBiodataDeleteConfirmationDialog(context),
              iconData: Icons.delete,
              title: 'Delete Bio Data',
              tileColor: AppColors.redClr.withValues(alpha: 0.2),
            ),
            Gap(8.h),
            CustomListTileBtn(
              onTap: () => _logout(),
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

  void _showBiodataDeleteConfirmationDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Delete'),
        content: Text('Are you sure you want to delete this Biodata?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel')),
          GetBuilder<DeleteBiodataController>(
              builder: (controller) => controller.isLoading
                  ? AppConstFunctions.customCircularProgressIndicator
                  : ElevatedButton(
                      onPressed: () async {
                        final result = await controller.deleteBiodata();
                        if (result) Get.offAllNamed(AppRoutes.homeScreen);
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child:
                          Text('Delete', style: TextStyle(color: Colors.white)),
                    ))
        ],
      ),
    );
  }

  void _logout() {
    SharedPreferencesService().clearToken();
    Get.offAllNamed(AppRoutes.logInScreen);
  }
}
