import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_multi_select_dropdown_btn.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/controllers/step8_expected_partner_info_controller.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/widgets/title_with_required.dart';

class Step8ExpectedPartnerInfoForm extends StatelessWidget {
  const Step8ExpectedPartnerInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0.w),
      child: GetBuilder<Step8ExpectedPartnerInfoController>(
        builder: (controller) {
          return Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Age Range (Required)
                TitleWithRequired(title: 'Age Range', isRequired: true),
                Gap(8.h),
                SliderTheme(
                  data: SliderThemeData(
                      trackHeight: 2.h,
                      valueIndicatorColor: AppColors.primaryClr,
                      valueIndicatorTextStyle: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColors.lightBgClr)),
                  child: RangeSlider(
                    values: controller.ageRange,
                    min: 18,
                    max: 50,
                    divisions: 32,
                    activeColor: AppColors.primaryClr,
                    inactiveColor: AppColors.primaryClr.withValues(alpha: 0.3),
                    labels: RangeLabels(
                      controller.ageRange.start.toStringAsFixed(0),
                      controller.ageRange.end.toStringAsFixed(0),
                    ),
                    onChanged: (newRange) {
                      controller.updateAgeRange(newRange);
                    },
                  ),
                ),

                // Optional Fields Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: controller.showOptionalFields,
                      onChanged: (value) =>
                          controller.toggleOptionalFields(value!),
                    ),
                    Text(
                      'Want to answer more?',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),

                // Conditional Optional Fields
                if (controller.showOptionalFields) ...[
                  // Complexion
                  TitleWithRequired(title: 'Complexion', isRequired: false),
                  Gap(8.h),
                  CustomMultiSelectDropdownBtn(
                    selectedValues: controller.selectedComplexions,
                    items: controller.complexionOptions,
                    onChanged: (values) =>
                        controller.updateSelectedComplexion(values),
                    hintText: 'Select Complexion',
                  ),
                  Gap(16.h),

                  // Minimum Height
                  TitleWithRequired(title: 'Minimum Height', isRequired: false),
                  Gap(8.h),
                  CustomTextFormField(
                    hintText: '5 ft 3 inch - 6 ft',
                    controller: controller.expectedHeightController,
                  ),
                  Gap(16.h),

                  // Minimum Educational Qualification
                  TitleWithRequired(
                      title: 'Minimum Educational Qualification',
                      isRequired: false),
                  Gap(8.h),
                  CustomTextFormField(
                    hintText: 'Degree completed',
                    controller: controller.expectedEducationController,
                  ),
                  Gap(16.h),

                  // State
                  TitleWithRequired(title: 'State', isRequired: false),
                  Gap(8.h),
                  CustomMultiSelectDropdownBtn(
                    selectedValues: controller.selectedStates,
                    items: controller.stateOptions,
                    onChanged: (values) =>
                        controller.updateSelectedState(values),
                    hintText: 'Select State',
                  ),
                  Gap(16.h),

                  // Marital Status
                  TitleWithRequired(title: 'Marital Status', isRequired: false),
                  Gap(8.h),
                  CustomMultiSelectDropdownBtn(
                    selectedValues: controller.selectedMaritalStatuses,
                    items: controller.maritalStatusOptions,
                    onChanged: (values) =>
                        controller.updateSelectedMaritalStatuses(values),
                    hintText: 'Select Marital Status',
                  ),
                  Gap(16.h),

                  // Occupation
                  TitleWithRequired(title: 'Occupation', isRequired: false),
                  Gap(8.h),
                  CustomTextFormField(
                    hintText: 'Private Job',
                    controller: controller.expectedOccupationController,
                  ),
                  Gap(16.h),

                  // Financial Condition
                  TitleWithRequired(
                      title: 'Financial Condition', isRequired: false),
                  Gap(8.h),
                  CustomTextFormField(
                    hintText: 'Describe expected financial condition',
                    controller: controller.financialConditionController,
                    maxLines: 2,
                  ),
                  Gap(16.h),

                  // Expected qualities or attributes
                  TitleWithRequired(
                      title:
                          'Expected qualities or attributes of your life partner',
                      isRequired: false),
                  Gap(8.h),
                  CustomTextFormField(
                    hintText: 'Describe expected qualities and attributes',
                    controller: controller.expectedQualitiesController,
                    maxLines: 4,
                  ),
                  Gap(16.h),

                  // Expected Ethnicity
                  TitleWithRequired(
                      title: 'Expected Ethnicity', isRequired: false),
                  Gap(8.h),
                  CustomTextFormField(
                    hintText: 'Enter expected ethnicity preferences',
                    controller: controller.expectedEthnicityController,
                    maxLines: 2,
                  ),
                  Gap(16.h),

                  // Expected Legality
                  TitleWithRequired(
                      title: 'Expected Legality', isRequired: false),
                  Gap(8.h),
                  CustomTextFormField(
                    hintText: 'Describe expected legal requirements',
                    controller: controller.expectedLegalityController,
                    maxLines: 3,
                  ),
                  Gap(16.h),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
