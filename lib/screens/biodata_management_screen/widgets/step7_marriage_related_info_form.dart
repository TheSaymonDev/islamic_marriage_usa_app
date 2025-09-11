import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_validators.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_drop_down_btn.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/controllers/step7_marriage_related_info_controller.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/widgets/title_with_required.dart';

class Step7MarriageRelatedInfoForm extends StatelessWidget {
  const Step7MarriageRelatedInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0.w),
      child: GetBuilder<Step7MarriageRelatedInfoController>(
        builder: (controller) {
          return Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Guardians Agreement (Required)
                TitleWithRequired(
                    title: 'Do your guardians agree to your marriage?',
                    isRequired: true),
                Gap(8.h),
                CustomDropdownBtn(
                  value: controller.guardiansAgreement,
                  items: controller.agreementOptions,
                  onChanged: (value) =>
                      controller.updateGuardiansAgreement(value),
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
                  // Marriage Thoughts
                  TitleWithRequired(
                      title:
                          'Why are you getting married? What are your thoughts on marriage?',
                      isRequired: false),
                  Gap(8.h),
                  CustomTextFormField(
                    hintText: 'Share your thoughts and reasons for marriage',
                    controller: controller.marriageThoughtsController,
                    maxLines: 5,
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
