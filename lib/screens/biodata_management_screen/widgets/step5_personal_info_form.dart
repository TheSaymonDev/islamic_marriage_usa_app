import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_validators.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_drop_down_btn.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/controllers/step5_personal_info_controller.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/widgets/title_with_required.dart';

class Step5PersonalInfoForm extends StatelessWidget {
  const Step5PersonalInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0.w),
      child: GetBuilder<Step5PersonalInfoController>(builder: (controller) {
        return Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Legality (Required)
              TitleWithRequired(title: 'Legality', isRequired: true),
              Gap(8.h),
              CustomTextFormField(
                hintText: 'Enter your legality',
                controller: controller.legalityController,
                validator: AppValidators.requiredValidator,
              ),
              Gap(16.h),
              // Ethnicity (Required)
              TitleWithRequired(title: 'Ethnicity', isRequired: true),
              Gap(8.h),
              CustomTextFormField(
                hintText: 'Enter your ethnicity',
                controller: controller.ethnicityController,
                validator: AppValidators.requiredValidator,
              ),
              Gap(16.h),

              // Mobile Number (Required)
              TitleWithRequired(
                  title: 'Bride/Groom\'s Mobile Number', isRequired: true),
              Gap(8.h),
              CustomTextFormField(
                hintText: 'Enter mobile number',
                controller: controller.mobileNumberController,
                keyboardType: TextInputType.phone,
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
                // What kind of clothes do you usually wear outside the house?
                TitleWithRequired(
                    title:
                        'What kind of clothes do you usually wear outside the house?',
                    isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Describe your usual clothing',
                  controller: controller.clothesTypeController,
                ),
                Gap(16.h),

                // Do you pray five times a day? Since when?
                TitleWithRequired(
                    title: 'Do you pray five times a day? Since when?',
                    isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Answer about your prayer habits',
                  controller: controller.prayerSinceController,
                ),
                Gap(16.h),

                // Usually, how many times (Waqt) a week are your prayers missed (Qaza)?
                TitleWithRequired(
                    title:
                        'Usually, how many times (Waqt) a week are your prayers missed (Qaza)?',
                    isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Describe your missed prayers',
                  controller: controller.missedPrayersController,
                ),
                Gap(16.h),

                // Do you comply with mahram / non-mahram?
                TitleWithRequired(
                    title: 'Do you comply with mahram / non-mahram?',
                    isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Answer about mahram compliance',
                  controller: controller.mahramComplianceController,
                ),
                Gap(16.h),

                // Are you able to recite the Quran correctly?
                TitleWithRequired(
                    title: 'Are you able to recite the Quran correctly?',
                    isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Answer about Quran recitation',
                  controller: controller.quranRecitationController,
                ),
                Gap(16.h),

                // Which fiqh do you follow?
                TitleWithRequired(
                    title: 'Which fiqh do you follow?', isRequired: false),
                Gap(8.h),
                CustomDropdownBtn(
                  value: controller.selectedFiqh,
                  items: controller.fiqhOptions,
                  onChanged: (value) => controller.updateSelectedFiqh(value),
                ),
                Gap(16.h),

                // Do you watch or listen to dramas/movies/serials/songs?
                TitleWithRequired(
                    title:
                        'Do you watch or listen to dramas/movies/serials/songs?',
                    isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Answer about your media habits',
                  controller: controller.mediaHabitsController,
                ),
                Gap(16.h),

                // Do you have any mental or physical diseases?
                TitleWithRequired(
                    title: 'Do you have any mental or physical diseases?',
                    isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Describe any health conditions',
                  controller: controller.healthConditionController,
                ),
                Gap(16.h),

                // Are you involved in any special work for Deen?
                TitleWithRequired(
                    title: 'Are you involved in any special work for Deen?',
                    isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Describe your religious activities',
                  controller: controller.religiousWorkController,
                ),
                Gap(16.h),

                // What are your ideas or beliefs about the shrine (Mazar)?
                TitleWithRequired(
                    title:
                        'What are your ideas or beliefs about the shrine (Mazar)?',
                    isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Share your beliefs about shrines',
                  controller: controller.shrineBeliefsController,
                  maxLines: 3,
                ),
                Gap(16.h),

                // Write the names of at least 3 Islamic books you read
                TitleWithRequired(
                    title: 'Write the names of at least 3 Islamic books you read',
                    isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'List Islamic books you have read',
                  controller: controller.islamicBooksController,
                  maxLines: 3,
                ),
                Gap(16.h),

                // Write the names of at least 3 Islamic scholars of your choice
                TitleWithRequired(
                    title:
                        'Write the names of at least 3 Islamic scholars of your choice',
                    isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'List Islamic scholars you follow',
                  controller: controller.islamicScholarsController,
                  maxLines: 3,
                ),
                Gap(16.h),

                // Write about your hobbies, likes, dislikes, tastes, dreams, etc.
                TitleWithRequired(
                    title:
                        'Write about your hobbies, likes, dislikes, tastes, dreams, etc.',
                    isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Share your personal interests and preferences',
                  controller: controller.hobbiesController,
                  maxLines: 4,
                ),
                Gap(16.h),

                // If you have any special knowledge about Islamic or worldly qualifications
                TitleWithRequired(
                    title:
                        'If you have any special knowledge about Islamic or worldly qualifications:',
                    isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Describe your special knowledge or qualifications',
                  controller: controller.specialKnowledgeController,
                  maxLines: 3,
                ),
                Gap(16.h),

                // Write about yourself in a few sentences
                TitleWithRequired(
                    title: 'Write about yourself in a few sentences:',
                    isRequired: false),
                Gap(8.h),
                CustomTextFormField(
                  hintText: 'Briefly describe yourself',
                  controller: controller.aboutYourselfController,
                  maxLines: 4,
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
