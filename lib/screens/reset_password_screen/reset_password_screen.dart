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
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_logo.dart';
import 'package:islamic_marriage_usa_app/screens/reset_password_screen/controllers/reset_password_controller.dart';
import 'package:islamic_marriage_usa_app/screens/reset_password_screen/models/reset_password_model.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final _controller = Get.find<ResetPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithTitle(
          onPressed: () => Get.back(), title: 'Reset Your Password'),
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
                GetBuilder<ResetPasswordController>(builder: (controller) {
                  return CustomTextFormField(
                    hintText: 'New Password',
                    controller: _controller.newPasswordController,
                    obscureText: controller.isObscureNew,
                    validator: AppValidators.passwordValidator,
                    suffixIcon: IconButton(
                        onPressed: () => controller.toggleObscureN(),
                        icon: Icon(
                            controller.isObscureNew
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: context.isDarkMode
                                ? AppColors.lightGreyClr
                                : AppColors.darkGreyClr,
                            size: 22.sp)),
                  );
                }),
                Gap(16.h),
                GetBuilder<ResetPasswordController>(
                  builder: (controller) {
                    return CustomTextFormField(
                        hintText: 'Confirm Password',
                        controller: _controller.confirmPasswordController,
                        obscureText: controller.isObscureConfirm,
                        validator: (value) =>
                            AppValidators.confirmPasswordValidator(
                                value, _controller.newPasswordController),
                        suffixIcon: IconButton(
                            onPressed: () => controller.toggleObscureC(),
                            icon: Icon(
                                controller.isObscureConfirm
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: context.isDarkMode
                                    ? AppColors.lightGreyClr
                                    : AppColors.darkGreyClr,
                                size: 25.sp)));
                  },
                ),
                Gap(20.h),
                GetBuilder<ResetPasswordController>(
                    builder: (controller) => controller.isLoading
                        ? AppConstFunctions.customCircularProgressIndicator
                        : CustomElevatedBtn(
                        onPressed: () => _formOnSubmit(controller),
                            name: 'Reset Password'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _formOnSubmit(ResetPasswordController controller) async {
    if (controller.formKey.currentState!.validate()) {
      final result = await controller.resetPassword(
       resetPasswordData: ResetPasswordModel(
         resetToken: controller.resetToken,
         newPassword: controller.newPasswordController.text,
       ),
      );
      if (result) {
        controller.clearFields();
        Get.offAllNamed(AppRoutes.logInScreen);
      }
    }
  }

}
