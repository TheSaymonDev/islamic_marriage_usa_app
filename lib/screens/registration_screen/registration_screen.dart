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
import 'package:islamic_marriage_usa_app/screens/registration_screen/controllers/registration_controller.dart';
import 'package:islamic_marriage_usa_app/screens/registration_screen/models/registration_model.dart';
import 'package:islamic_marriage_usa_app/screens/registration_screen/widgets/log_in_row.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final _controller = Get.find<RegistrationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBarWithTitle(onPressed: () => Get.back(), title: 'Join Us'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.h),
        child: SingleChildScrollView(
          child: Form(
            key: _controller.formKey,
            child: Column(
              children: [
                Gap(32.h),
                const CustomTextLogo(),
                CustomTextFormField(
                  hintText: 'Full Name',
                  controller: _controller.nameController,
                  validator: AppValidators.requiredValidator,
                ),
                Gap(16.h),
                CustomTextFormField(
                  hintText: 'Email',
                  controller: _controller.emailController,
                  validator: AppValidators.emailValidator,
                ),
                Gap(16.h),
                GetBuilder<RegistrationController>(builder: (controller) {
                  return CustomTextFormField(
                      hintText: 'Password',
                      controller: _controller.passwordController,
                      obscureText: controller.isPObscure,
                      validator: AppValidators.passwordValidator,
                      suffixIcon: IconButton(
                          onPressed: () => controller.togglePObscure(),
                          icon: Icon(
                              controller.isPObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: context.isDarkMode
                                  ? AppColors.lightGreyClr
                                  : AppColors.darkGreyClr,
                              size: 22.sp)));
                }),
                Gap(16.h),
                GetBuilder<RegistrationController>(builder: (controller) {
                  return CustomTextFormField(
                      hintText: 'Confirm Password',
                      controller: _controller.confirmPasswordController,
                      obscureText: controller.isCPObscure,
                      validator: (value) =>
                          AppValidators.confirmPasswordValidator(
                            value,
                            controller.passwordController,
                          ),
                      suffixIcon: IconButton(
                          onPressed: () => controller.toggleCPObscure(),
                          icon: Icon(
                              controller.isCPObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: context.isDarkMode
                                  ? AppColors.lightGreyClr
                                  : AppColors.darkGreyClr,
                              size: 22.sp)));
                }),
                Gap(24.h),
                GetBuilder<RegistrationController>(
                    builder: (controller) => controller.isLoading
                        ? AppConstFunctions.customCircularProgressIndicator
                        : CustomElevatedBtn(
                            onPressed: () => _formOnSubmit(controller),
                            name: 'Register')),
                Gap(90.h),
                LogInRow()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _formOnSubmit(RegistrationController controller) async {
    if (controller.formKey.currentState!.validate()) {
      final result = await controller.registerUser(
        registrationData: RegistrationModel(
          name: controller.nameController.text,
          email: controller.emailController.text,
          password: controller.passwordController.text,
        ),
      );
      if (result) {
        Get.toNamed(
          AppRoutes.otpVerificationScreen,
          arguments: {
            'name': controller.nameController.text,
            'email': controller.emailController.text,
            'password': controller.passwordController.text,
          },
        );
        controller.clearFields();
      }
    }
  }
}
