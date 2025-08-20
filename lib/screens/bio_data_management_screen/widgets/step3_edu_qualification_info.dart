import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/screens/bio_data_management_screen/widgets/title_with_required.dart';

class Step3EduQualificationInfo extends StatefulWidget {
  const Step3EduQualificationInfo({super.key});

  @override
  State<Step3EduQualificationInfo> createState() =>
      _Step3EduQualificationInfoState();
}

class _Step3EduQualificationInfoState extends State<Step3EduQualificationInfo> {
  final _highestQualificationController = TextEditingController();
  final _passingYearController = TextEditingController();
  final _resultController = TextEditingController();
  final _institutionNameController = TextEditingController();
  final _otherQualificationsController = TextEditingController();

  bool _showOptionalFields = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Highest Educational Qualification (Required)
          TitleWithRequired(
              title: 'Highest Educational Qualification', isRequired: true),
          Gap(8.h),
          CustomTextFormField(
            hintText: 'Enter your highest qualification',
            controller: _highestQualificationController,
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
            // Passing Year (Optional)
            TitleWithRequired(title: 'Passing Year', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Enter passing year',
              controller: _passingYearController,
              keyboardType: TextInputType.number,
            ),
            Gap(16.h),

            // Result (Optional)
            TitleWithRequired(title: 'Result', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Enter your result/GPA',
              controller: _resultController,
            ),
            Gap(16.h),

            // Name of Educational Institution (Optional)
            TitleWithRequired(
                title: 'Name of Educational Institution', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Enter institution name',
              controller: _institutionNameController,
            ),
            Gap(16.h),

            // Other Educational Qualifications (Optional)
            TitleWithRequired(
                title: 'Other Educational Qualifications', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Enter other qualifications',
              controller: _otherQualificationsController,
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
    _highestQualificationController.dispose();
    _passingYearController.dispose();
    _resultController.dispose();
    _institutionNameController.dispose();
    _otherQualificationsController.dispose();
    super.dispose();
  }
}
