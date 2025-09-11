import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_validators.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_drop_down_btn.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/controllers/step4_family_info_controller.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/widgets/title_with_required.dart';

class Step4FamilyInfoForm extends StatelessWidget {
  const Step4FamilyInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0.w),
      child: GetBuilder<Step4FamilyInfoController>(builder: (controller) {
        return Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Father's Name (Required)
              TitleWithRequired(title: 'Father\'s Name', isRequired: true),
              Gap(8.h),
              CustomTextFormField(
                hintText: 'Enter father\'s name',
                controller: controller.fatherNameController,
                validator: AppValidators.requiredValidator,
              ),
              Gap(16.h),

              // Mother's Name (Required)
              TitleWithRequired(title: 'Mother\'s Name', isRequired: true),
              Gap(8.h),
              CustomTextFormField(
                hintText: 'Enter mother\'s name',
                controller: controller.motherNameController,
                validator: AppValidators.requiredValidator,
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
                // Is your father alive?
                TitleWithRequired(
                    title: 'Is your father alive?', isRequired: false),
                Gap(8.h),
                CustomDropdownBtn(
                  value: controller.isFatherAlive,
                  items: controller.aliveOptions,
                  onChanged: (value) => controller.updateIsFatherAlive(value),
                ),
                Gap(16.h),

                // Description of father's profession
                if (controller.isFatherAlive != null &&
                    controller.isFatherAlive != 'Not, alive') ...[
                  TitleWithRequired(
                      title: 'Description of father\'s profession',
                      isRequired: false),
                  Gap(8.h),
                  CustomTextFormField(
                    hintText: 'Enter father\'s profession details',
                    controller: controller.fatherProfessionController,
                  ),
                  Gap(16.h),
                ],

                // Is your mother alive?
                TitleWithRequired(
                    title: 'Is your mother alive?', isRequired: false),
                Gap(8.h),
                CustomDropdownBtn(
                  value: controller.isMotherAlive,
                  items: controller.aliveOptions,
                  onChanged: (value) => controller.updateIsMotherAlive(value),
                ),
                Gap(16.h),

                // Description of mother's profession
                if (controller.isMotherAlive != null &&
                    controller.isMotherAlive != 'Not, alive') ...[
                  TitleWithRequired(
                      title: 'Description of mother\'s profession',
                      isRequired: false),
                  Gap(8.h),
                  CustomTextFormField(
                    hintText: 'Enter mother\'s profession details',
                    controller: controller.motherProfessionController,
                  ),
                  Gap(16.h),
                ],

                // How many brothers do you have?
                TitleWithRequired(
                    title: 'How many brothers do you have?', isRequired: false),
                Gap(8.h),
                CustomDropdownBtn(
                  value: controller.brothersCount,
                  items: controller.brotherCountOptions,
                  onChanged: (value) => controller.updateBrothersCount(value),
                ),
                Gap(16.h),

                // Brother's Information
                if (controller.brothersCount != null &&
                    controller.brothersCount != 'No Brother') ...[
                  TitleWithRequired(
                      title: 'Brother\'s Information', isRequired: false),
                  Gap(8.h),
                  CustomTextFormField(
                    hintText: 'Enter details about your brothers',
                    controller: controller.brothersInfoController,
                    maxLines: 3,
                  ),
                  Gap(16.h),
                ],

                // How many sisters do you have?
                TitleWithRequired(
                    title: 'How many sisters do you have?', isRequired: false),
                Gap(8.h),
                CustomDropdownBtn(
                  value: controller.sistersCount,
                  items: controller.sisterCountOptions,
                  onChanged: (value) => controller.updateSistersCount(value),
                ),
                Gap(16.h),

                // Sister's Information
                if (controller.sistersCount != null &&
                    controller.sistersCount != 'No Sister') ...[
                  TitleWithRequired(
                      title: 'Sister\'s Information', isRequired: false),
                  Gap(8.h),
                  CustomTextFormField(
                    hintText: 'Enter details about your sisters',
                    controller: controller.sistersInfoController,
                    maxLines: 3,
                  ),
                  Gap(16.h),
                ],

                // Profession of Uncles
                TitleWithRequired(
                    title: 'Profession of Uncles', isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Enter profession details of uncles',
                  controller: controller.unclesProfessionController,
                ),
                Gap(16.h),

                // Describe the family's financial situation
                TitleWithRequired(
                    title: 'Describe the family\'s financial situation',
                    isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Describe financial condition',
                  controller: controller.financialSituationController,
                  maxLines: 3,
                ),
                Gap(16.h),

                // How is your family's religious condition?
                TitleWithRequired(
                    title: 'How is your family\'s religious condition?',
                    isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Describe religious condition',
                  controller: controller.religiousConditionController,
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
