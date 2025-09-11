import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/screens/email_verification_screen/models/email_verification_model.dart';
import 'package:islamic_marriage_usa_app/screens/forgot_otp_verification_screen/controllers/forgot_otp_verification_controller.dart';
import 'package:islamic_marriage_usa_app/screens/forgot_otp_verification_screen/controllers/forgot_timer_controller.dart';
import 'package:islamic_marriage_usa_app/screens/forgot_otp_verification_screen/controllers/resend_forgot_otp_controller.dart';

class ResendForgotOtpRow extends StatelessWidget {
  ResendForgotOtpRow({super.key});

  final _controller = Get.find<ForgotOtpVerificationController>();
  final _resendController = Get.find<ResendForgotOtpController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Didn’t receive code? ',
            style: Theme.of(context).textTheme.bodyMedium),
        Gap(8.w),
        SizedBox(
          width: 84.w,
          child: GetBuilder<ForgotTimerController>(
            builder: (timerController) {
              if (timerController.showResendButton) {
                return GestureDetector(
                  onTap: () async {
                    await _resendController.resendForgotOtp(
                      resendForgotOtpData:EmailVerificationModel(
                        email: _controller.email
                      ),
                    );
                  },
                  child: Text(
                    'Resend',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.secondaryClr),
                  ),
                );
              } else {
                return Text(
                  timerController.getFormattedDuration(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.secondaryClr),
                );
              }
            },
          ),
        )
      ],
    );
  }
}