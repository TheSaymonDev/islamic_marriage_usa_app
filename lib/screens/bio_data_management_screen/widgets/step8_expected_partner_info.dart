import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_drop_down_btn.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/screens/bio_data_management_screen/widgets/title_with_required.dart';

class Step8ExpectedPartnerInfo extends StatefulWidget {
  const Step8ExpectedPartnerInfo({super.key});

  @override
  State<Step8ExpectedPartnerInfo> createState() => _Step8ExpectedPartnerInfoState();
}

class _Step8ExpectedPartnerInfoState extends State<Step8ExpectedPartnerInfo> {
  final _financialConditionController = TextEditingController();
  final _expectedQualitiesController = TextEditingController();
  final _expectedEthnicityController = TextEditingController();
  final _expectedLegalityController = TextEditingController();

  String? _selectedMinAge;
  String? _selectedMaxAge;
  String? _selectedComplexion;
  String? _selectedMinHeight;
  String? _selectedMinEducation;
  String? _selectedState;
  String? _selectedMaritalStatus;
  String? _selectedOccupation;

  bool _showOptionalFields = false;

  final _ageOptions = ['18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40+'];
  final _complexionOptions = ['Black', 'Brown', 'Light Brown', 'Fair', 'Very Fair', 'No Preference'];
  final _heightOptions = ['4\'6"', '4\'7"', '4\'8"', '4\'9"', '4\'10"', '4\'11"', '5\'', '5\'1"', '5\'2"', '5\'3"', '5\'4"', '5\'5"', '5\'6"', '5\'7"', '5\'8"', '5\'9"', '5\'10"', '5\'11"', '6\'', '6\'1"', '6\'2"', '6\'3"', '6\'4"', '6\'5"', 'No Preference'];
  final _educationOptions = ['High School', 'Bachelor', 'Master', 'PhD', 'Islamic Education', 'No Preference'];
  final _stateOptions = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming', 'No Preference'];
  final _maritalStatusOptions = ['Never Married', 'Married', 'Divorced', 'Widow', 'Widower', 'No Preference'];
  final _occupationOptions = ['Imam', 'Teacher', 'Engineer', 'Doctor', 'Govt. Job', 'Private Job', 'Businessman', 'Freelancer', 'Student', 'Homemaker', 'No Preference'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Age Range (Required)
          TitleWithRequired(title: 'Age Range', isRequired: true),
          Gap(8.h),
          Row(
            children: [
              Expanded(
                child: CustomDropdownBtn(
                  value: _selectedMinAge,
                  items: _ageOptions,
                  onChanged: (value) {
                    setState(() {
                      _selectedMinAge = value;
                    });
                  },
                  hintText: 'Min Age',
                ),
              ),
              Gap(16.w),
              Expanded(
                child: CustomDropdownBtn(
                  value: _selectedMaxAge,
                  items: _ageOptions,
                  onChanged: (value) {
                    setState(() {
                      _selectedMaxAge = value;
                    });
                  },
                  hintText: 'Max Age',
                ),
              ),
            ],
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
            // Complexion
            TitleWithRequired(title: 'Complexion', isRequired: false),
            Gap(8.h),
            CustomDropdownBtn(
              value: _selectedComplexion,
              items: _complexionOptions,
              onChanged: (value) {
                setState(() {
                  _selectedComplexion = value;
                });
              },
            ),
            Gap(16.h),

            // Minimum Height
            TitleWithRequired(title: 'Minimum Height', isRequired: false),
            Gap(8.h),
            CustomDropdownBtn(
              value: _selectedMinHeight,
              items: _heightOptions,
              onChanged: (value) {
                setState(() {
                  _selectedMinHeight = value;
                });
              },
            ),
            Gap(16.h),

            // Minimum Educational Qualification
            TitleWithRequired(title: 'Minimum Educational Qualification', isRequired: false),
            Gap(8.h),
            CustomDropdownBtn(
              value: _selectedMinEducation,
              items: _educationOptions,
              onChanged: (value) {
                setState(() {
                  _selectedMinEducation = value;
                });
              },
            ),
            Gap(16.h),

            // State
            TitleWithRequired(title: 'State', isRequired: false),
            Gap(8.h),
            CustomDropdownBtn(
              value: _selectedState,
              items: _stateOptions,
              onChanged: (value) {
                setState(() {
                  _selectedState = value;
                });
              },
            ),
            Gap(16.h),

            // Marital Status
            TitleWithRequired(title: 'Marital Status', isRequired: false),
            Gap(8.h),
            CustomDropdownBtn(
              value: _selectedMaritalStatus,
              items: _maritalStatusOptions,
              onChanged: (value) {
                setState(() {
                  _selectedMaritalStatus = value;
                });
              },
            ),
            Gap(16.h),

            // Occupation
            TitleWithRequired(title: 'Occupation', isRequired: false),
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
            Gap(16.h),

            // Financial Condition
            TitleWithRequired(title: 'Financial Condition', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Describe expected financial condition',
              controller: _financialConditionController,
              maxLines: 2,
            ),
            Gap(16.h),

            // Expected qualities or attributes
            TitleWithRequired(title: 'Expected qualities or attributes of your life partner', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Describe expected qualities and attributes',
              controller: _expectedQualitiesController,
              maxLines: 4,
            ),
            Gap(16.h),

            // Expected Ethnicity
            TitleWithRequired(title: 'Expected Ethnicity', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Enter expected ethnicity preferences',
              controller: _expectedEthnicityController,
              maxLines: 2,
            ),
            Gap(16.h),

            // Expected Legality
            TitleWithRequired(title: 'Expected Legality', isRequired: false),
            Gap(8.h),
            CustomTextFormField(
              hintText: 'Describe expected legal requirements',
              controller: _expectedLegalityController,
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
    _financialConditionController.dispose();
    _expectedQualitiesController.dispose();
    _expectedEthnicityController.dispose();
    _expectedLegalityController.dispose();
    super.dispose();
  }
}