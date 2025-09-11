import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_validators.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/controllers/step3_edu_qualification_info_controller.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/widgets/title_with_required.dart';

class Step3EduQualificationInfoForm extends StatelessWidget {
  const Step3EduQualificationInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0.w),
      child: GetBuilder<Step3EduQualificationController>(builder: (controller) {
        return Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Highest Educational Qualification (Required)
              TitleWithRequired(
                  title: 'Highest Educational Qualification', isRequired: true),
              Gap(8.h),
              CustomTextFormField(
                hintText: 'Enter your highest qualification',
                controller: controller.highestQualificationController,
                validator: AppValidators.requiredValidator,
              ),
              // Optional Fields Checkbox
              Row(
                children: [
                  Checkbox(
                    value: controller.showOptionalFields,
                    onChanged: (value) => controller.toggleOptionalFields(value!),
                  ),
                  Text(
                    'Want to answer more?',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              // Conditional Optional Fields
              if (controller.showOptionalFields) ...[
                // Passing Year (Optional)
                TitleWithRequired(title: 'Passing Year', isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Enter passing year',
                  controller: controller.passingYearController,
                  keyboardType: TextInputType.number,
                  validator: AppValidators.passingYearValidator,
                ),
                Gap(16.h),

                // Result (Optional)
                TitleWithRequired(title: 'Result', isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Enter your result/GPA',
                  controller: controller.resultController,
                ),
                Gap(16.h),

                // Name of Educational Institution (Optional)
                TitleWithRequired(
                    title: 'Name of Educational Institution', isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Enter institution name',
                  controller: controller.institutionNameController,
                ),
                Gap(16.h),

                // Other Educational Qualifications (Optional)
                TitleWithRequired(
                    title: 'Other Educational Qualifications', isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Enter other qualifications',
                  controller: controller.otherQualificationsController,
                  maxLines: 3,
                ),
                Gap(16.h),
              ],
            ],
          ),
        );
      }),
    );
  }
}
