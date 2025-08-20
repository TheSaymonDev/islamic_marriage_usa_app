import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/config/routes/app_routes.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';

class SignUpRow extends StatelessWidget {
  const SignUpRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18.sp)),
        Gap(8.w),
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.registrationScreen),
          child: Text(
            'Create Account',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.secondaryClr),
          ),
        )
      ],
    );
  }
}
