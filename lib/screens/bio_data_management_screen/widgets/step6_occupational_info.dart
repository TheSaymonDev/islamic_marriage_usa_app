import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_drop_down_btn.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/screens/bio_data_management_screen/widgets/title_with_required.dart';

class Step6OccupationalInfo extends StatefulWidget {
  const Step6OccupationalInfo({super.key});

  @override
  State<Step6OccupationalInfo> createState() => _Step6OccupationalInfoState();
}

class _Step6OccupationalInfoState extends State<Step6OccupationalInfo> {
  final _professionDescriptionController = TextEditingController();
  final _monthlyIncomeController = TextEditingController();

  String? _selectedOccupation;

  bool _showOptionalFields = false;

  final _occupationOptions = [
    'Imam',
    'Teacher',
    'Engineer',
    'Doctor',
    'Govt. Job',
    'Private Job',
    'Businessman',
    'Freelancer',
    'Student',
    'Others',
    'No Profession'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Occupation (Required)
          TitleWithRequired(title: 'Occupation', isRequired: true),
          Gap(8.h),
          CustomDropdownBtn(
            value: _selectedOccupation,
            items: _occupationOptions,
            onChanged: (value) {
              setState(() {
                _selectedOccupation = value;
              });
            },
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
            // Description of Profession
            TitleWithRequired(title: 'Description of Profession', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Describe your profession in detail',
              controller: _professionDescriptionController,
              maxLines: 3,
            ),
            Gap(16.h),

            // Monthly Income
            TitleWithRequired(title: 'Monthly Income', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Enter your monthly income',
              controller: _monthlyIncomeController,
              keyboardType: TextInputType.number,
              prefixText: '\$ ',
            ),
            Gap(16.h),
          ],
        ],
      ),
    );
  }

  @override
  void dispose() {
    _professionDescriptionController.dispose();
    _monthlyIncomeController.dispose();
    super.dispose();
  }
}