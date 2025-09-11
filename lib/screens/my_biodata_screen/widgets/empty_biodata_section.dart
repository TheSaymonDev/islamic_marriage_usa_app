import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/config/routes/app_routes.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_elevated_btn.dart';

class EmptyBiodataSection extends StatelessWidget {
  const EmptyBiodataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Illustrative Icon
            Icon(
              Icons.assignment_ind_outlined,
              size: 80.r,
              color: AppColors.primaryClr.withValues(alpha: 0.8),
            ),
            Gap(32.h),

            // Title Text
            Text(
              "No Biodata Found",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryClr,
              ),
              textAlign: TextAlign.center,
            ),
            Gap(16.h),

            // Subtitle / Description
            Text(
              "You haven’t created your biodata yet.\nStart building your profile now to get started!",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
            Gap(32.h),

            CustomElevatedBtn(
              onPressed: () => Get.toNamed(AppRoutes.biodataManagementScreen),
              name: 'Create Biodata',
            )
          ],
        ),
      ),
    );

  }
}
