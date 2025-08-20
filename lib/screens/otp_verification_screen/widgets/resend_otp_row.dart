import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/screens/otp_verification_screen/controllers/timer_controller.dart';

class ResendOtpRow extends StatelessWidget {
  const ResendOtpRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Didn’t receive code? ',
            style: Theme.of(context).textTheme.bodyMedium),
        Gap(8.w),
        GetBuilder<TimerController>(
          builder: (controller) {
            return controller.showResendButton
                ? GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Resend',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.secondaryClr),
                    ),
                  )
                : Text(
                    controller.getFormattedDuration(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.secondaryClr),
                  );
          },
        )
      ],
    );
  }
}
