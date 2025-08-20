import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_drop_down_btn.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/screens/bio_data_management_screen/widgets/title_with_required.dart';

class Step1GeneralInfo extends StatefulWidget {
  const Step1GeneralInfo({super.key});

  @override
  State<Step1GeneralInfo> createState() => _Step1GeneralInfoState();
}

class _Step1GeneralInfoState extends State<Step1GeneralInfo> {
  final _bioDataTypes = ['Male\'s Biodata', 'Female\'s Biodata'];
  final _maritalStatuses = [
    'Never Married',
    'Married',
    'Divorced',
    'Widow',
    'Widower'
  ];
  final _complexions = ['Black', 'Brown', 'Light Brown', 'Fair', 'Very Fair'];
  final _heights = ['Less than 4 feet', '4\' 1\'\' - 7\'', 'More than 7 feet'];
  final _weights = ['Less than 30 kg', '31 kg - 120 kg', 'More than 120 kg'];
  final _bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
    'Don\'t know'
  ];

  String? _selectedBioDataType;
  String? _selectedMaritalStatus;
  String? _selectedComplexion;
  String? _selectedHeight;
  String? _selectedWeight;
  String? _selectedBloodGroup;
  final _stateController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _dateOfBirthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Type of Biodata
          TitleWithRequired(title: 'Type of Biodata', isRequired: true),
          Gap(8.h),
          CustomDropdownBtn(
            value: _selectedBioDataType,
            items: _bioDataTypes,
            onChanged: (value) {
              setState(() {
                _selectedBioDataType = value;
              });
            },
          ),
          Gap(16.h),

          // Marital Status
          TitleWithRequired(title: 'Marital Status', isRequired: true),
          Gap(8.h),
          CustomDropdownBtn(
            value: _selectedMaritalStatus,
            items: _maritalStatuses,
            onChanged: (value) {
              setState(() {
                _selectedMaritalStatus = value;
              });
            },
          ),
          Gap(16.h),

          // Date of Birth
          TitleWithRequired(title: 'Date of Birth', isRequired: true),
          Gap(8.h),
          CustomTextFormField(
            hintText: 'Select Date',
            controller: _dateOfBirthController,
            readOnly: true,
            suffixIcon: Icon(
              Icons.calendar_month,
              color: AppColors.primaryClr,
              size: 20.sp,
            ),
            onTap: () {
              _selectDate();
            },
          ),
          Gap(16.h),

          // Complexion
          TitleWithRequired(title: 'Complexion', isRequired: true),
          Gap(8.h),
          CustomDropdownBtn(
            value: _selectedComplexion,
            items: _complexions,
            onChanged: (value) {
              setState(() {
                _selectedComplexion = value;
              });
            },
          ),
          Gap(16.h),

          // Height
          TitleWithRequired(title: 'Height', isRequired: true),
          Gap(8.h),
          CustomDropdownBtn(
            value: _selectedHeight,
            items: _heights,
            onChanged: (value) {
              setState(() {
                _selectedHeight = value;
              });
            },
          ),
          Gap(16.h),

          // Weight
          TitleWithRequired(title: 'Weight', isRequired: true),
          Gap(8.h),
          CustomDropdownBtn(
            value: _selectedWeight,
            items: _weights,
            onChanged: (value) {
              setState(() {
                _selectedWeight = value;
              });
            },
          ),
          Gap(16.h),

          // Blood Group
          TitleWithRequired(title: 'Blood Group', isRequired: true),
          Gap(8.h),
          CustomDropdownBtn(
            value: _selectedBloodGroup,
            items: _bloodGroups,
            onChanged: (value) {
              setState(() {
                _selectedBloodGroup = value;
              });
            },
          ),
          Gap(16.h),

          // State
          TitleWithRequired(title: 'State', isRequired: true),
          Gap(8.h),
          CustomTextFormField(
            hintText: 'Enter your state',
            controller: _stateController,
          ),
          Gap(16.h),

          // Postal Code
          TitleWithRequired(title: 'Postal Code', isRequired: true),
          Gap(8.h),
          CustomTextFormField(
            hintText: 'Enter postal code',
            controller: _postalCodeController,
          ),
        ],
      ),
    );
  }

  void _selectDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      _dateOfBirthController.text =
          DateFormat('dd-MM-yyyy').format(selectedDate);
    }
  }
}
