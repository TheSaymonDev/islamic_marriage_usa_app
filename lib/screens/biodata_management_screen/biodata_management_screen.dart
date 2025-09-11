import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/config/routes/app_routes.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_app_bar_with_title.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_elevated_btn.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/controllers/step10_contact_info_controller.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/controllers/step1_general_info_controller.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/controllers/step2_address_info_controller.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/controllers/step3_edu_qualification_info_controller.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/controllers/step4_family_info_controller.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/controllers/step5_personal_info_controller.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/controllers/step6_occupational_info_controller.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/controllers/step7_marriage_related_info_controller.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/controllers/step8_expected_partner_info_controller.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/controllers/step9_authority_questions_info_controller.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/controllers/submit_biodata_controller.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/widgets/step10_contact_info_form.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/widgets/step1_general_info_form.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/widgets/step2_address_info_form.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/widgets/step3_edu_qualification_info_form.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/widgets/step4_family_info_form.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/widgets/step5_personal_info_form.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/widgets/step6_occupational_info_form.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/widgets/step7_marriage_related_info_form.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/widgets/step8_expected_partner_info_form.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/widgets/step9_authority_questions_info_form.dart';

class BiodataManagementScreen extends StatefulWidget {
  const BiodataManagementScreen({super.key});

  @override
  State<BiodataManagementScreen> createState() =>
      _BiodataManagementScreenState();
}

class _BiodataManagementScreenState extends State<BiodataManagementScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // স্টেপ টাইটেল লিস্ট
  final List<String> _stepTitles = [
    'General Information',
    'Address Information',
    'Educational Qualification',
    'Family Information',
    'Personal Information',
    'Occupational Information',
    'Marriage Related Info',
    'Expected Partner Info',
    'Authority Questions',
    'Contact Information'
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithTitle(
        onPressed: () => Get.back(),
        title: _stepTitles[_currentPage],
      ),
      body: Column(
        children: [
          _buildStepIndicator(),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: const [
                Step1GeneralInfoForm(),
                Step2AddressInfoForm(),
                Step3EduQualificationInfoForm(),
                Step4FamilyInfoForm(),
                Step5PersonalInfoForm(),
                Step6OccupationalInfoForm(),
                Step7MarriageRelatedInfoForm(),
                Step8ExpectedPartnerInfoForm(),
                Step9AuthorityQuestionsInfoForm(),
                Step10ContactInfoForm(),
              ],
            ),
          ),
          Gap(16.h),
          _buildNavigationButtons(),
          Gap(16.h),
        ],
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      color: AppColors.lightCardClr,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(10 * 2 - 1, (index) {
            if (index.isEven) {
              final stepIndex = index ~/ 2;
              final bool isActive = _currentPage == stepIndex;

              return InkWell(
                onTap: () {
                  _pageController.jumpToPage(stepIndex);
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 15.r,
                      backgroundColor: isActive
                          ? AppColors.primaryClr
                          : AppColors.secondaryClr,
                      child: Text(
                        (stepIndex + 1).toString(),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    Gap(4.h),
                    Text(
                      'Step ${stepIndex + 1}',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: isActive ? Colors.black : Colors.grey,
                        fontWeight:
                            isActive ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                margin: EdgeInsets.only(bottom: 12.h),
                width: 40.w,
                height: 2.h,
                color: AppColors.primaryClr,
              );
            }
          }),
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Previous button: সব step এ except 0
        if (_currentPage > 0)
          CustomElevatedBtn(
            onPressed: () {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            name: 'Previous',
            width: 150.w,
          ),

        // ✅ এখানে condition ঠিক করলাম
        if (_currentPage < 9)
          _buildNextButton(_currentPage)
        else
          _buildSubmitButton(),
      ],
    );
  }

  Widget _buildNextButton(int currentPage) {
    switch (currentPage) {
      case 0:
        return GetBuilder<Step1GeneralInfoController>(
            builder: (controller) => controller.isLoading
                ? AppConstFunctions.customCircularProgressIndicator
                : CustomElevatedBtn(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result = await controller.upsertGeneralInfo();
                        if (result) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      }
                    },
                    name: 'Save & Next',
                    width: 150.w,
                  ));
      case 1:
        return GetBuilder<Step2AddressInfoController>(
            builder: (controller) => controller.isLoading
                ? AppConstFunctions.customCircularProgressIndicator
                : CustomElevatedBtn(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result = await controller.upsertAddressInfo();
                        if (result) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      }
                    },
                    name: 'Save & Next',
                    width: 150.w,
                  ));
      case 2:
        return GetBuilder<Step3EduQualificationController>(
            builder: (controller) => controller.isLoading
                ? AppConstFunctions.customCircularProgressIndicator
                : CustomElevatedBtn(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result =
                            await controller.upsertEduQualificationInfo();
                        if (result) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      }
                    },
                    name: 'Save & Next',
                    width: 150.w,
                  ));
      case 3:
        return GetBuilder<Step4FamilyInfoController>(
            builder: (controller) => controller.isLoading
                ? AppConstFunctions.customCircularProgressIndicator
                : CustomElevatedBtn(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result = await controller.upsertFamilyInfo();
                        if (result) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      }
                    },
                    name: 'Save & Next',
                    width: 150.w,
                  ));
      case 4:
        return GetBuilder<Step5PersonalInfoController>(
            builder: (controller) => controller.isLoading
                ? AppConstFunctions.customCircularProgressIndicator
                : CustomElevatedBtn(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result = await controller.upsertPersonalInfo();
                        if (result) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      }
                    },
                    name: 'Save & Next',
                    width: 150.w,
                  ));
      case 5:
        return GetBuilder<Step6OccupationalInfoController>(
            builder: (controller) => controller.isLoading
                ? AppConstFunctions.customCircularProgressIndicator
                : CustomElevatedBtn(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result =
                            await controller.upsertOccupationalInfo();
                        if (result) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      }
                    },
                    name: 'Save & Next',
                    width: 150.w,
                  ));
      case 6:
        return GetBuilder<Step7MarriageRelatedInfoController>(
            builder: (controller) => controller.isLoading
                ? AppConstFunctions.customCircularProgressIndicator
                : CustomElevatedBtn(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result =
                            await controller.upsertMarriageRelatedInfo();
                        if (result) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      }
                    },
                    name: 'Save & Next',
                    width: 150.w,
                  ));
      case 7:
        return GetBuilder<Step8ExpectedPartnerInfoController>(
            builder: (controller) => controller.isLoading
                ? AppConstFunctions.customCircularProgressIndicator
                : CustomElevatedBtn(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result =
                            await controller.upsertExpectedPartnerInfo();
                        if (result) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      }
                    },
                    name: 'Save & Next',
                    width: 150.w,
                  ));
      case 8:
        return GetBuilder<Step9AuthorityQuestionsController>(
            builder: (controller) => controller.isLoading
                ? AppConstFunctions.customCircularProgressIndicator
                : CustomElevatedBtn(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result =
                            await controller.upsertAuthorityQuestionsInfo();
                        if (result) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      }
                    },
                    name: 'Save & Next',
                    width: 150.w,
                  ));
      default:
        return CustomElevatedBtn(
          onPressed: () {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          },
          name: 'Save & Next',
          width: 150.w,
        );
    }
  }

  Widget _buildSubmitButton() {
    return GetBuilder<Step10ContactInfoController>(
      builder: (controller) => controller.isLoading
          ? AppConstFunctions.customCircularProgressIndicator
          : CustomElevatedBtn(
        onPressed: () async {
          if (controller.formKey.currentState!.validate()) {
            final result = await controller.upsertContactInfo();
            if (result == "complete") {
              _showBiodataSubmitConfirmationDialog();
            } else {
              _showIncompleteStepsDialog();
            }
          }
        },
        name: 'Save & Submit',
        width: 150.w,
      ),
    );
  }

  void _showBiodataSubmitConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Submit'),
        content: const Text('Are you sure you want to submit this Biodata?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          GetBuilder<SubmitBiodataController>(
            builder: (controller) => controller.isLoading
                ? AppConstFunctions.customCircularProgressIndicator
                : ElevatedButton(
                    onPressed: () async {
                      final result = await controller.submitBiodata();
                      if (result) Get.offAllNamed(AppRoutes.homeScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greenClr,
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void _showIncompleteStepsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Incomplete Steps'),
        content: const Text(
          'Please complete all the remaining steps before submitting your Biodata.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

}
