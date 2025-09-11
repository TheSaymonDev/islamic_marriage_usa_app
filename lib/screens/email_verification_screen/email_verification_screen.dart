import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/config/routes/app_routes.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_validators.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_app_bar_with_title.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_elevated_btn.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_logo.dart';
import 'package:islamic_marriage_usa_app/screens/email_verification_screen/controllers/email_verification_controller.dart';
import 'package:islamic_marriage_usa_app/screens/email_verification_screen/models/email_verification_model.dart';

class EmailVerificationScreen extends StatelessWidget {
  EmailVerificationScreen({super.key});

  final _controller = Get.find<EmailVerificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithTitle(
          onPressed: () => Get.back(), title: 'Recover Account'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.h),
        child: SingleChildScrollView(
          child: Form(
            key: _controller.formKey,
            child: Column(
              children: [
                Gap(32.h),
                const CustomTextLogo(),
                Gap(60.h),
                CustomTextFormField(
                  hintText: 'Email',
                  controller: _controller.emailController,
                  validator: AppValidators.emailValidator,
                ),
                Gap(20.h),
                GetBuilder<EmailVerificationController>(
                    builder: (controller) => controller.isLoading
                        ? AppConstFunctions.customCircularProgressIndicator
                        : CustomElevatedBtn(
                            onPressed: () => _formOnSubmit(controller),
                            name: 'Verify Email')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _formOnSubmit(EmailVerificationController controller) async {
    if (controller.formKey.currentState!.validate()) {
      final result = await controller.verifyEmail(
        emailVerificationData: EmailVerificationModel(
          email: controller.emailController.text,
        ),
      );
      if (result) {
        Get.toNamed(
          AppRoutes.forgotOtpVerificationScreen,
          arguments: {
            'email': controller.emailController.text,
          },
        );
        controller.clearFields();
      }
    }
  }
}
