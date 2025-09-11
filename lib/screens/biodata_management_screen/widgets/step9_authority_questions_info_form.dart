import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_validators.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_drop_down_btn.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/controllers/step9_authority_questions_info_controller.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/widgets/title_with_required.dart';

class Step9AuthorityQuestionsInfoForm extends StatelessWidget {
  const Step9AuthorityQuestionsInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0.w),
      child: GetBuilder<Step9AuthorityQuestionsController>(
        builder: (controller) {
          return Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Parents Knowledge Question
                TitleWithRequired(
                  title:
                      'Do your parents know that you are submitting biodata on this website?',
                  isRequired: true,
                ),
                Gap(8.h),
                CustomDropdownBtn(
                  value: controller.parentsKnowledge,
                  items: controller.yesNoOptions,
                  onChanged: (value) => controller.updateParentsKnowledge(value),
                  validator: AppValidators.requiredValidator,
                ),
                Gap(16.h),

                // Information Truthfulness Question
                TitleWithRequired(
                  title:
                      'By Allah, testify that all the information given is true',
                  isRequired: true,
                ),
                Gap(8.h),
                CustomDropdownBtn(
                  value: controller.informationTruthfulness,
                  items: controller.yesNoOptions,
                  onChanged: (value) =>
                      controller.updateInformationTruthfulness(value),
                  validator: AppValidators.requiredValidator,
                ),
                Gap(16.h),

                // Agreement to Terms Question
                TitleWithRequired(
                  title:
                      'If you provide any false information, islamicmarriageusa.com will not take any responsibility for the conventional law and the hereafter. Do you agree?',
                  isRequired: true,
                ),
                Gap(8.h),
                CustomDropdownBtn(
                  value: controller.agreementToTerms,
                  items: controller.yesNoOptions,
                  onChanged: (value) => controller.updateAgreementToTerms(value),
                  validator: AppValidators.requiredValidator,
                ),
                Gap(16.h),

                // Important Note
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Colors.orange, width: 1.w),
                  ),
                  child: Text(
                    'Note: These questions are mandatory. Providing false information may have serious consequences both legally and religiously.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.orange[800],
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
