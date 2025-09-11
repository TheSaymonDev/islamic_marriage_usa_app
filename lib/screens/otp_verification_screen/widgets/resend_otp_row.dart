import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/screens/otp_verification_screen/controllers/otp_verification_controller.dart';
import 'package:islamic_marriage_usa_app/screens/otp_verification_screen/controllers/resend_otp_controller.dart';
import 'package:islamic_marriage_usa_app/screens/otp_verification_screen/controllers/timer_controller.dart';
import 'package:islamic_marriage_usa_app/screens/registration_screen/models/registration_model.dart';

class ResendOtpRow extends StatelessWidget {
  ResendOtpRow({super.key});

  final _controller = Get.find<OtpVerificationController>();
  final _resendController = Get.find<ResendOtpController>();

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
          child: GetBuilder<TimerController>(
            builder: (timerController) {
              if (timerController.showResendButton) {
                return GestureDetector(
                  onTap: () async {
                    await _resendController.resendOTP(
                      resendOtpData: RegistrationModel(
                        name: _controller.name,
                        email: _controller.email,
                        password: _controller.password,
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