import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_validators.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/controllers/step2_address_info_controller.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/widgets/title_with_required.dart';

class Step2AddressInfoForm extends StatelessWidget {
  const Step2AddressInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0.w),
      child: GetBuilder<Step2AddressInfoController>(builder: (controller) {
        return Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // By Born Address (Required)
              TitleWithRequired(title: 'By Born Address', isRequired: true),
              Gap(8.h),
              CustomTextFormField(
                hintText: 'Enter your birth address',
                controller: controller.byBornAddressController,
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
                // Current Address (Optional)
                TitleWithRequired(title: 'Current Address', isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Enter your current address',
                  controller: controller.currentAddressController,
                ),
                Gap(16.h),

                // Where did you grow up? (Optional)
                TitleWithRequired(
                    title: 'Where did you grow up?', isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Enter where you grew up',
                  controller: controller.growUpAddressController,
                ),
                Gap(16.h),

                // Where are you willing to settle? (Optional)
                TitleWithRequired(
                    title: 'Where are you willing to settle?', isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Enter preferred settlement location',
                  controller: controller.settleAddressController,
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
