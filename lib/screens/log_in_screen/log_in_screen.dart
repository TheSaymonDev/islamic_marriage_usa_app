import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/config/routes/app_routes.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_validators.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_app_bar_with_title.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_elevated_btn.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_logo.dart';
import 'package:islamic_marriage_usa_app/screens/log_in_screen/controllers/log_in_controller.dart';
import 'package:islamic_marriage_usa_app/screens/log_in_screen/widgets/remember_forgot_password_row.dart';
import 'package:islamic_marriage_usa_app/screens/log_in_screen/widgets/sign_up_row.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final _controller = Get.find<LogInController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithTitle(
          onPressed: () => Get.back(), title: 'Welcome Back'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.h),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Gap(32.h),
                const CustomTextLogo(),
                CustomTextFormField(
                    hintText: 'Email',
                    validator: AppValidators.emailValidator,
                    controller: _controller.emailController),
                Gap(16.h),
                GetBuilder<LogInController>(
                  builder: (controller) {
                    return CustomTextFormField(
                        hintText: 'Password'.tr,
                        controller: _controller.passwordController,
                        validator: AppValidators.passwordValidator,
                        obscureText: controller.isObscure,
                        suffixIcon: IconButton(
                            onPressed: () => controller.toggleObscure,
                            icon: Icon(
                                controller.isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: context.isDarkMode
                                    ? AppColors.lightGreyClr
                                    : AppColors.darkGreyClr,
                                size: 22.sp)));
                  },
                ),
                Gap(8.h),
                RememberForgotPasswordRow(),
                Gap(16.h),
                CustomElevatedBtn(
                    onPressed: () => Get.toNamed(AppRoutes.homeScreen),
                    name: 'Log in'),
                Gap(130.h),
                SignUpRow()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
