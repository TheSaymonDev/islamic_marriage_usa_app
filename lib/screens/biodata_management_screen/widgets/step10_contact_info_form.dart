import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_validators.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/controllers/step10_contact_info_controller.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/widgets/title_with_required.dart';

class Step10ContactInfoForm extends StatelessWidget {
  const Step10ContactInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0.w),
      child: GetBuilder<Step10ContactInfoController>(builder: (controller) {
        return Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Full Name (Required)
              TitleWithRequired(title: 'Full Name', isRequired: true),
              Gap(8.h),
              CustomTextFormField(
                hintText: 'Enter your full name',
                controller: controller.fullNameController,
                validator: AppValidators.requiredValidator,
              ),
              Gap(16.h),

              // Guardian's Mobile Number (Required)
              TitleWithRequired(
                  title: 'Guardian\'s Mobile Number', isRequired: true),
              Gap(8.h),
              CustomTextFormField(
                hintText: 'Enter guardian\'s mobile number',
                controller: controller.guardianMobileController,
                keyboardType: TextInputType.phone,
                validator: AppValidators.requiredValidator,
              ),
              Gap(16.h),

              // Relationship with Guardian (Required)
              TitleWithRequired(
                  title: 'Relationship with Guardian', isRequired: true),
              Gap(8.h),
              CustomTextFormField(
                hintText: 'e.g., Father, Mother, Brother, etc.',
                controller: controller.relationshipController,
                validator: AppValidators.requiredValidator,
              ),
              Gap(16.h),

              // Email (Required)
              TitleWithRequired(
                  title: 'E-mail to receive biodata', isRequired: true),
              Gap(8.h),
              CustomTextFormField(
                hintText: 'Enter your email address',
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: AppValidators.emailValidator,
              ),
              Gap(20.h),

              // Important Note
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.green, width: 1.w),
                ),
                child: Text(
                  'Important: All contact information provided must be accurate and verifiable. This information will be used for official communication regarding your biodata.',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.green[800],
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
