import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_drop_down_btn.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/screens/bio_data_management_screen/widgets/title_with_required.dart';

class Step5PersonalInfo extends StatefulWidget {
  const Step5PersonalInfo({super.key});

  @override
  State<Step5PersonalInfo> createState() => _Step5PersonalInfoState();
}

class _Step5PersonalInfoState extends State<Step5PersonalInfo> {
  final _ethnicityController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _clothesTypeController = TextEditingController();
  final _prayerSinceController = TextEditingController();
  final _missedPrayersController = TextEditingController();
  final _mahramComplianceController = TextEditingController();
  final _quranRecitationController = TextEditingController();
  final _mediaHabitsController = TextEditingController();
  final _healthConditionController = TextEditingController();
  final _religiousWorkController = TextEditingController();
  final _shrineBeliefsController = TextEditingController();
  final _islamicBooksController = TextEditingController();
  final _islamicScholarsController = TextEditingController();
  final _hobbiesController = TextEditingController();
  final _beardInfoController = TextEditingController();
  final _specialKnowledgeController = TextEditingController();
  final _aboutYourselfController = TextEditingController();

  String? _selectedFiqh;

  bool _showOptionalFields = false;

  final _fiqhOptions = [
    'Hanafi',
    'Maliki',
    'Shafi\'i',
    'Hanbali',
    'Ahle Hadis/Salafi'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ethnicity (Required)
          TitleWithRequired(title: 'Ethnicity', isRequired: true),
          Gap(8.h),
          CustomTextFormField(
            hintText: 'Enter your ethnicity',
            controller: _ethnicityController,
          ),
          Gap(16.h),

          // Mobile Number (Required)
          TitleWithRequired(title: 'Bride/Groom\'s Mobile Number', isRequired: true),
          Gap(8.h),
          CustomTextFormField(
            hintText: 'Enter mobile number',
            controller: _mobileNumberController,
            keyboardType: TextInputType.phone,
          ),

          // Optional Fields Checkbox
          Row(
            children: [
              Checkbox(
                value: _showOptionalFields,
                onChanged: (value) {
                  setState(() {
                    _showOptionalFields = value!;
                  });
                },
              ),
              Text(
                'Want to answer more?',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),

          // Conditional Optional Fields
          if (_showOptionalFields) ...[
            // What kind of clothes do you usually wear outside the house?
            TitleWithRequired(title: 'What kind of clothes do you usually wear outside the house?', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Describe your usual clothing',
              controller: _clothesTypeController,
            ),
            Gap(16.h),

            // Do you pray five times a day? Since when?
            TitleWithRequired(title: 'Do you pray five times a day? Since when?', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Answer about your prayer habits',
              controller: _prayerSinceController,
            ),
            Gap(16.h),

            // Usually, how many times (Waqt) a week are your prayers missed (Qaza)?
            TitleWithRequired(title: 'Usually, how many times (Waqt) a week are your prayers missed (Qaza)?', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Describe your missed prayers',
              controller: _missedPrayersController,
            ),
            Gap(16.h),

            // Do you comply with mahram / non-mahram?
            TitleWithRequired(title: 'Do you comply with mahram / non-mahram?', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Answer about mahram compliance',
              controller: _mahramComplianceController,
            ),
            Gap(16.h),

            // Are you able to recite the Quran correctly?
            TitleWithRequired(title: 'Are you able to recite the Quran correctly?', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Answer about Quran recitation',
              controller: _quranRecitationController,
            ),
            Gap(16.h),

            // Which fiqh do you follow?
            TitleWithRequired(title: 'Which fiqh do you follow?', isRequired: false),
            Gap(8.h),
            CustomDropdownBtn(
              value: _selectedFiqh,
              items: _fiqhOptions,
              onChanged: (value) {
                setState(() {
                  _selectedFiqh = value;
                });
              },
            ),
            Gap(16.h),

            // Do you watch or listen to dramas/movies/serials/songs?
            TitleWithRequired(title: 'Do you watch or listen to dramas/movies/serials/songs?', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Answer about your media habits',
              controller: _mediaHabitsController,
            ),
            Gap(16.h),

            // Do you have any mental or physical diseases?
            TitleWithRequired(title: 'Do you have any mental or physical diseases?', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Describe any health conditions',
              controller: _healthConditionController,
            ),
            Gap(16.h),

            // Are you involved in any special work for Deen?
            TitleWithRequired(title: 'Are you involved in any special work for Deen?', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Describe your religious activities',
              controller: _religiousWorkController,
            ),
            Gap(16.h),

            // What are your ideas or beliefs about the shrine (Mazar)?
            TitleWithRequired(title: 'What are your ideas or beliefs about the shrine (Mazar)?', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Share your beliefs about shrines',
              controller: _shrineBeliefsController,
              maxLines: 3,
            ),
            Gap(16.h),

            // Write the names of at least 3 Islamic books you read
            TitleWithRequired(title: 'Write the names of at least 3 Islamic books you read', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'List Islamic books you have read',
              controller: _islamicBooksController,
              maxLines: 3,
            ),
            Gap(16.h),

            // Write the names of at least 3 Islamic scholars of your choice
            TitleWithRequired(title: 'Write the names of at least 3 Islamic scholars of your choice', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'List Islamic scholars you follow',
              controller: _islamicScholarsController,
              maxLines: 3,
            ),
            Gap(16.h),

            // Write about your hobbies, likes, dislikes, tastes, dreams, etc.
            TitleWithRequired(title: 'Write about your hobbies, likes, dislikes, tastes, dreams, etc.', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Share your personal interests and preferences',
              controller: _hobbiesController,
              maxLines: 4,
            ),
            Gap(16.h),

            // Do you have a beard?
            TitleWithRequired(title: 'Do you have a beard?', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Answer about beard',
              controller: _beardInfoController,
            ),
            Gap(16.h),

            // If you have any special knowledge about Islamic or worldly qualifications
            TitleWithRequired(title: 'If you have any special knowledge about Islamic or worldly qualifications:', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Describe your special knowledge or qualifications',
              controller: _specialKnowledgeController,
              maxLines: 3,
            ),
            Gap(16.h),

            // Write about yourself in a few sentences
            TitleWithRequired(title: 'Write about yourself in a few sentences:', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Briefly describe yourself',
              controller: _aboutYourselfController,
              maxLines: 4,
            ),
            Gap(16.h),
          ],
        ],
      ),
    );
  }

  @override
  void dispose() {
    _ethnicityController.dispose();
    _mobileNumberController.dispose();
    _clothesTypeController.dispose();
    _prayerSinceController.dispose();
    _missedPrayersController.dispose();
    _mahramComplianceController.dispose();
    _quranRecitationController.dispose();
    _mediaHabitsController.dispose();
    _healthConditionController.dispose();
    _religiousWorkController.dispose();
    _shrineBeliefsController.dispose();
    _islamicBooksController.dispose();
    _islamicScholarsController.dispose();
    _hobbiesController.dispose();
    _beardInfoController.dispose();
    _specialKnowledgeController.dispose();
    _aboutYourselfController.dispose();
    super.dispose();
  }
}