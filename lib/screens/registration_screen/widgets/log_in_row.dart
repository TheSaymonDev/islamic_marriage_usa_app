import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';

class LogInRow extends StatelessWidget {
  const LogInRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account?',
            style: Theme.of(context).textTheme.bodyMedium),
        Gap(8.w),
        GestureDetector(
            onTap: () => Get.back(),
            child: Text('Log in',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.secondaryClr)))
      ],
    );
  }
}
