import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_validators.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_drop_down_btn.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/controllers/step6_occupational_info_controller.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/widgets/title_with_required.dart';

class Step6OccupationalInfoForm extends StatelessWidget {
  const Step6OccupationalInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0.w),
      child: GetBuilder<Step6OccupationalInfoController>(
        builder: (controller) {
          return Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Occupation (Required)
                TitleWithRequired(title: 'Occupation', isRequired: true),
                Gap(8.h),
                CustomDropdownBtn(
                  value: controller.selectedOccupation,
                  items: controller.occupationOptions,
                  onChanged: (value) => controller.updateSelectedOccupation(value),
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
                  // Description of Profession
                  TitleWithRequired(title: 'Description of Profession', isRequired: false),
                  Gap(8.h),
                  CustomTextFormField(
                    hintText: 'Describe your profession in detail',
                    controller: controller.professionDescriptionController,
                    maxLines: 3,
                  ),
                  Gap(16.h),

                  // Monthly Income
                  TitleWithRequired(title: 'Monthly Income', isRequired: false),
                  Gap(8.h),
                  CustomTextFormField(
                    hintText: 'Enter your monthly income',
                    controller: controller.monthlyIncomeController,
                    keyboardType: TextInputType.number,
                    prefixText: '\$ ',
                  ),
                  Gap(16.h),
                ],
              ],
            ),
          );
        }
      ),
    );
  }
}