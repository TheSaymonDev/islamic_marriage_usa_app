import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_app_bar_with_title.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_elevated_btn.dart';
import 'package:islamic_marriage_usa_app/screens/bio_data_management_screen/widgets/step10_contact_info.dart';
import 'package:islamic_marriage_usa_app/screens/bio_data_management_screen/widgets/step1_general_info.dart';
import 'package:islamic_marriage_usa_app/screens/bio_data_management_screen/widgets/step2_address_info.dart';
import 'package:islamic_marriage_usa_app/screens/bio_data_management_screen/widgets/step3_edu_qualification_info.dart';
import 'package:islamic_marriage_usa_app/screens/bio_data_management_screen/widgets/step4_family_info.dart';
import 'package:islamic_marriage_usa_app/screens/bio_data_management_screen/widgets/step5_personal_info.dart';
import 'package:islamic_marriage_usa_app/screens/bio_data_management_screen/widgets/step6_occupational_info.dart';
import 'package:islamic_marriage_usa_app/screens/bio_data_management_screen/widgets/step7_marriage_related_info.dart';
import 'package:islamic_marriage_usa_app/screens/bio_data_management_screen/widgets/step8_expected_partner_info.dart';
import 'package:islamic_marriage_usa_app/screens/bio_data_management_screen/widgets/step9_authority_questions_info.dart';

class BioDataManagementScreen extends StatefulWidget {
  const BioDataManagementScreen({super.key});

  @override
  State<BioDataManagementScreen> createState() => _BioDataManagementScreenState();
}

class _BioDataManagementScreenState extends State<BioDataManagementScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  // প্রতিটি স্টেপের সম্পন্ন হওয়া অবস্থা ট্র্যাক করার জন্য একটি লিস্ট।
  // এখানে প্রাথমিক অবস্থায় কোনো স্টেপ সম্পন্ন হয়নি ধরা হয়েছে।
  // বাস্তব অ্যাপ্লিকেশনে এটি SharedPreferences বা API থেকে লোড হবে।
  final List<bool> _completedSteps = List.generate(10, (index) => false);

  // স্টেপের নামগুলোর লিস্ট
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
        title: _stepTitles[_currentPage], // ডাইনামিক টাইটেল
      ),
      body: Column(
        children: [
          // নতুন স্টেপ ইন্ডিকেটর যুক্ত করা হয়েছে
          _buildStepIndicator(),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(), // সোয়াইপ বন্ধ
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: const [
                Step1GeneralInfo(),
                Step2AddressInfo(),
                Step3EduQualificationInfo(),
                Step4FamilyInfo(),
                Step5PersonalInfo(),
                Step6OccupationalInfo(),
                Step7MarriageRelatedInfo(),
                Step8ExpectedPartnerInfo(),
                Step9AuthorityQuestionsInfo(),
                Step10ContactInfo(),
              ],
            ),
          ),
          Gap(16.h),
          _buildNavigationButtons(),
         Gap(16.h)
        ],
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.lightCardClr,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(10 * 2 - 1, (index) {
            // স্টেপ আইটেম
            if (index.isEven) {
              final stepIndex = index ~/ 2;
              final bool isCompleted = _completedSteps[stepIndex];
              final bool isActive = _currentPage == stepIndex;

              return InkWell(
                onTap: isCompleted || isActive
                    ? () {
                  _pageController.jumpToPage(stepIndex);
                }
                    : null,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 15.r,
                      backgroundColor: isCompleted
                          ? AppColors.greenClr
                          : isActive
                          ? AppColors.primaryClr
                          : AppColors.secondaryClr,
                      child: isCompleted
                          ?  Icon(Icons.check,
                          size: 16.sp, color: Colors.white)
                          : Text(
                        (stepIndex + 1).toString(),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),
                      ),
                    ),
                    Gap(4.h),
                    Text(
                      'Step ${stepIndex + 1}',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: isCompleted || isActive
                            ? Colors.black
                            : Colors.grey,
                        fontWeight: isCompleted || isActive
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              );
            }
            // লাইন আইটেম (স্টেপগুলোর মাঝে)
            else {
              return Container(
                margin: EdgeInsets.only(bottom: 12.h),
                width: 40.w, // লাইন কত লম্বা হবে
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
        if (_currentPage > 0)
          CustomElevatedBtn(onPressed: (){
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          }, name: 'Previous', width: 140.w,),
        if (_currentPage < 9)
          CustomElevatedBtn(onPressed: (){
            // এখানে আপনার ভ্যালিডেশন লজিক যুক্ত করতে পারেন
            // যদি ভ্যালিডেশন সফল হয়, তাহলে নেক্সট পেজে যান এবং বর্তমান স্টেপ সম্পন্ন হিসেবে চিহ্নিত করুন
            setState(() {
              _completedSteps[_currentPage] = true;
            });
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          }, name: 'Next', width: 140.w,),
        if (_currentPage == 9)
          CustomElevatedBtn(onPressed: (){
            // সেভ করার লজিক এখানে যুক্ত করুন
            Navigator.of(context).pop();
          }, name: 'Submit', width: 140.w,)
      ],
    );
  }
}