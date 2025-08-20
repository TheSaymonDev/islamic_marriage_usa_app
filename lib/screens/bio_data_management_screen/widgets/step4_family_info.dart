import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_drop_down_btn.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/screens/bio_data_management_screen/widgets/title_with_required.dart';

class Step4FamilyInfo extends StatefulWidget {
  const Step4FamilyInfo({super.key});

  @override
  State<Step4FamilyInfo> createState() => _Step4FamilyInfoState();
}

class _Step4FamilyInfoState extends State<Step4FamilyInfo> {
  final _fatherNameController = TextEditingController();
  final _motherNameController = TextEditingController();
  final _fatherProfessionController = TextEditingController();
  final _motherProfessionController = TextEditingController();
  final _brothersInfoController = TextEditingController();
  final _sistersInfoController = TextEditingController();
  final _unclesProfessionController = TextEditingController();
  final _financialSituationController = TextEditingController();
  final _religiousConditionController = TextEditingController();

  String? _isFatherAlive;
  String? _isMotherAlive;
  String? _brothersCount;
  String? _sistersCount;

  bool _showOptionalFields = false;

  final _aliveOptions = ['Yes', 'Not alive'];
  final _siblingCountOptions = [
    'No Brother',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Father's Name (Required)
          TitleWithRequired(title: 'Father\'s Name', isRequired: true),
          Gap(8.h),
          CustomTextFormField(
            hintText: 'Enter father\'s name',
            controller: _fatherNameController,
          ),
          Gap(16.h),

          // Mother's Name (Required)
          TitleWithRequired(title: 'Mother\'s Name', isRequired: true),
          Gap(8.h),
          CustomTextFormField(
            hintText: 'Enter mother\'s name',
            controller: _motherNameController,
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
            // Is your father alive?
            TitleWithRequired(title: 'Is your father alive?', isRequired: false),
            Gap(8.h),
            CustomDropdownBtn(
              value: _isFatherAlive,
              items: _aliveOptions,
              onChanged: (value) {
                setState(() {
                  _isFatherAlive = value;
                });
              },
            ),
            Gap(16.h),

            // Description of father's profession
            TitleWithRequired(title: 'Description of father\'s profession', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Enter father\'s profession details',
              controller: _fatherProfessionController,
            ),
            Gap(16.h),

            // Is your mother alive?
            TitleWithRequired(title: 'Is your mother alive?', isRequired: false),
            Gap(8.h),
            CustomDropdownBtn(
              value: _isMotherAlive,
              items: _aliveOptions,
              onChanged: (value) {
                setState(() {
                  _isMotherAlive = value;
                });
              },
            ),
            Gap(16.h),

            // Description of mother's profession
            TitleWithRequired(title: 'Description of mother\'s profession', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Enter mother\'s profession details',
              controller: _motherProfessionController,
            ),
            Gap(16.h),

            // How many brothers do you have?
            TitleWithRequired(title: 'How many brothers do you have?', isRequired: false),
            Gap(8.h),
            CustomDropdownBtn(
              value: _brothersCount,
              items: _siblingCountOptions,
              onChanged: (value) {
                setState(() {
                  _brothersCount = value;
                });
              },
            ),
            Gap(16.h),

            // Brother's Information
            if (_brothersCount != null && _brothersCount != 'No Brother') ...[
              TitleWithRequired(title: 'Brother\'s Information', isRequired: false),
              Gap(8.h),
              CustomTextFormField(
                hintText: 'Enter details about your brothers',
                controller: _brothersInfoController,
                maxLines: 3,
              ),
              Gap(16.h),
            ],

            // How many sisters do you have?
            TitleWithRequired(title: 'How many sisters do you have?', isRequired: false),
            Gap(8.h),
            CustomDropdownBtn(
              value: _sistersCount,
              items: _siblingCountOptions,
              onChanged: (value) {
                setState(() {
                  _sistersCount = value;
                });
              },
            ),
            Gap(16.h),

            // Sister's Information
            if (_sistersCount != null && _sistersCount != 'No Sister') ...[
              TitleWithRequired(title: 'Sister\'s Information', isRequired: false),
              Gap(8.h),
              CustomTextFormField(
                hintText: 'Enter details about your sisters',
                controller: _sistersInfoController,
                maxLines: 3,
              ),
              Gap(16.h),
            ],

            // Profession of Uncles
            TitleWithRequired(title: 'Profession of Uncles', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Enter profession details of uncles',
              controller: _unclesProfessionController,
            ),
            Gap(16.h),

            // Describe the family's financial situation
            TitleWithRequired(title: 'Describe the family\'s financial situation', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Describe financial condition',
              controller: _financialSituationController,
              maxLines: 3,
            ),
            Gap(16.h),

            // How is your family's religious condition?
            TitleWithRequired(title: 'How is your family\'s religious condition?', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Describe religious condition',
              controller: _religiousConditionController,
              maxLines: 3,
            ),
            Gap(16.h),
          ],
        ],
      ),
    );
  }

  @override
  void dispose() {
    _fatherNameController.dispose();
    _motherNameController.dispose();
    _fatherProfessionController.dispose();
    _motherProfessionController.dispose();
    _brothersInfoController.dispose();
    _sistersInfoController.dispose();
    _unclesProfessionController.dispose();
    _financialSituationController.dispose();
    _religiousConditionController.dispose();
    super.dispose();
  }
}