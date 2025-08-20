import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage_usa_app/screens/bio_data_management_screen/widgets/title_with_required.dart';

class Step10ContactInfo extends StatefulWidget {
  const Step10ContactInfo({super.key});

  @override
  State<Step10ContactInfo> createState() => _Step10ContactInfoState();
}

class _Step10ContactInfoState extends State<Step10ContactInfo> {
  final _fullNameController = TextEditingController();
  final _guardianMobileController = TextEditingController();
  final _relationshipController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Full Name (Required)
          TitleWithRequired(title: 'Full Name', isRequired: true),
          Gap(8.h),
          CustomTextFormField(
            hintText: 'Enter your full name',
            controller: _fullNameController,
          ),
          Gap(16.h),

          // Guardian's Mobile Number (Required)
          TitleWithRequired(title: 'Guardian\'s Mobile Number', isRequired: true),
          Gap(8.h),
          CustomTextFormField(
            hintText: 'Enter guardian\'s mobile number',
            controller: _guardianMobileController,
            keyboardType: TextInputType.phone,
          ),
          Gap(16.h),

          // Relationship with Guardian (Required)
          TitleWithRequired(title: 'Relationship with Guardian', isRequired: true),
          Gap(8.h),
          CustomTextFormField(
            hintText: 'e.g., Father, Mother, Brother, etc.',
            controller: _relationshipController,
          ),
          Gap(16.h),

          // Email (Required)
          TitleWithRequired(title: 'E-mail to receive biodata', isRequired: true),
          Gap(8.h),
          CustomTextFormField(
            hintText: 'Enter your email address',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          Gap(20.h),

          // Important Note
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.green, width: 1.w),
            ),
            child: Text(
              'Important: All contact information provided must be accurate and verifiable. This information will be used for official communication regarding your biodata.',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.green[800],
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _guardianMobileController.dispose();
    _relationshipController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}