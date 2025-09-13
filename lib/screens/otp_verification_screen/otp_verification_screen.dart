import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/config/routes/app_routes.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_validators.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_app_bar_with_title.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_elevated_btn.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_logo.dart';
import 'package:islamic_marriage_usa_app/screens/otp_verification_screen/controllers/otp_verification_controller.dart';
import 'package:islamic_marriage_usa_app/screens/otp_verification_screen/models/otp_verification_model.dart';
import 'package:islamic_marriage_usa_app/screens/otp_verification_screen/widgets/resend_otp_row.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen({super.key});

  final _controller = Get.find<OtpVerificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithTitle(
          onPressed: () => Get.back(), title: 'Code Verification'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: SingleChildScrollView(
          child: Form(
            key: _controller.formKey,
            child: Column(
              children: [
                Gap(32.h),
                const CustomTextLogo(),
                Gap(60.h),
                Container(
                    width: 300.w,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: AppColors.lightBgClr,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Pinput(
                        validator: AppValidators.requiredValidator,
                        length: 6,
                        controller: _controller.otpController,
                        focusNode: _controller.focusNode,
                        separatorBuilder: (index) => Container(
                            height: 64.h,
                            width: 1.w,
                            color: AppColors.lightBgClr),
                        defaultPinTheme: defaultPinTheme,
                        showCursor: true,
                        focusedPinTheme: defaultPinTheme.copyWith(
                            textStyle: Get.textTheme.titleMedium!
                                .copyWith(color: Colors.white),
                            decoration: const BoxDecoration(
                                color: AppColors.primaryClr)))),
                Gap(16.h),
                ResendOtpRow(),
                Gap(20.h),
                GetBuilder<OtpVerificationController>(
                    builder: (controller) => controller.isLoading
                        ? AppConstFunctions.customCircularProgressIndicator
                        : CustomElevatedBtn(
                            onPressed: () => _formOnSubmit(controller),
                            name: 'Verify OTP'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  final defaultPinTheme = PinTheme(
      height: 64.h,
      textStyle: Get.textTheme.titleMedium,
      decoration:
          BoxDecoration(color: AppColors.primaryClr.withValues(alpha: 0.2)));

  void _formOnSubmit(OtpVerificationController controller) async {
    if (controller.formKey.currentState!.validate()) {
      final result = await controller.verifyOtp(
        otpVerificationData: OtpVerificationModel(
          email: controller.email,
          otp: controller.otpController.text,
        ),
      );
      if (result) {
        controller.clearField();
        Get.offAllNamed(AppRoutes.logInScreen);
      }
    }
  }
}
