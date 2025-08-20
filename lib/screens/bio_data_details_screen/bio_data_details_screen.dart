import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_app_bar_with_title.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_bio_data_table.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_expansion_tile.dart';

class BioDataDetailsScreen extends StatefulWidget {
  const BioDataDetailsScreen({super.key});

  @override
  State<BioDataDetailsScreen> createState() => _BioDataDetailsScreenState();
}

class _BioDataDetailsScreenState extends State<BioDataDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithTitle(
          onPressed: () => Get.back(), title: 'Bio Data Details'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity.w,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.primaryClr,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage(AppUrls.maleIcon),
                      backgroundColor: Colors.white,
                    ),
                    Gap(8.h),
                    Text(
                      'Biodata No: 55',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white),
                    ),
                    Gap(8.h),
                    CustomBioDataTable(
                      data: removeEmptyFields(generateGeneralInfo),
                    ),
                  ],
                ),
              ),
              CustomExpansionTile(title: 'Address Info', children: [
                CustomBioDataTable(
                  data: removeEmptyFields(generateAddressInfo),
                )
              ]),
              CustomExpansionTile(
                  title: 'Educational Qualification Info',
                  children: [
                    CustomBioDataTable(
                      data: removeEmptyFields(generateEduQualificationInfo),
                    )
                  ]),
              CustomExpansionTile(title: 'Family Info', children: [
                CustomBioDataTable(
                  data: removeEmptyFields(generateFamilyInfo),
                )
              ]),
              CustomExpansionTile(title: 'Personal Info'.tr, children: [
                CustomBioDataTable(
                  data: removeEmptyFields(generatePersonalInfo),
                )
              ]),
              CustomExpansionTile(title: 'Occupational Info', children: [
                CustomBioDataTable(
                  data: removeEmptyFields(generateOccupationalInfo),
                )
              ]),
              CustomExpansionTile(title: 'Marriage Related Info', children: [
                CustomBioDataTable(
                  data: removeEmptyFields(generateMarriageRelatedInfo),
                )
              ]),
              CustomExpansionTile(
                  title: 'Expected Life Partner Info',
                  children: [
                    CustomBioDataTable(
                      data: removeEmptyFields(generateExpectedLifePartnerInfo),
                    )
                  ]),
              CustomExpansionTile(
                title: 'Authorized Question Info',
                children: [
                  CustomBioDataTable(
                    data: removeEmptyFields(generateAuthorityQuestion),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Filter out empty fields
  Map<String, String?> removeEmptyFields(Map<String, String?> data) {
    return data..removeWhere((key, value) => value == null || value.isEmpty);
  }

  final generateGeneralInfo = {
    'Biodata Type': "Male's Biodata",
    'Marital Status': 'Unmarried',
    'Date of Birth': '15-01-2001',
    'Complexion': 'Light Brown',
    'Height': "5' 3\"",
    'Weight': '55 kg',
    'Blood Group': 'B+',
    'State': 'Texas',
    'Postal Code': '3570',
  };

  final generateAddressInfo = {
    'By Born Address': 'Los Angeles, California, USA',
    'Current Address': 'Los Angeles, California, USA',
    'Where did you grow up?': 'Los Angeles, California, USA',
    'Where did you willing to settle': 'Los Angeles, California, USA',
  };

  final generateEduQualificationInfo = {
    'Highest education qualification': 'Diploma in Engineering',
    'Passing year': '2022',
    'Result': '3.75 out of 4.00',
    'Name of educational institution': 'Cumilla Polytechnic Institute',
    'Other educational qualification': 'SSC 2017'
  };

  final generateFamilyInfo = {
    "Father's Name": 'Md. Jahangir Alam',
    'Is your father alive?': 'Yes, alive',
    "Description of father's profession": 'Chef 20 Years experience',
    "Mother's Name": 'Md. Jahangir Alam',
    'Is your mother alive?': 'Yes, alive',
    "Description of mother's profession": 'House wife',
    'How many brothers do you have?': 'No brother',
    "Brother's Information": 'No brother',
    'How many sisters do you have?': '1 sister',
    "Sister's Information": 'Studying at Cumilla Polytechnic Institute',
    'Profession of uncles': 'Teacher',
    "Describe the family's financial situation": '',
    "How is your family's religious condition?":
        'Regular prayer, islamic environment'
  };

  final generatePersonalInfo = {
    'Your legality': 'Asian',
    'Your Ethnicity': 'Bengali',
    "Bride/Groom's Mobile Number": '01643831739',
    'What kind of clothes do you usually wear outside the house?': 'Shirt and pant',
    "Do you pray five times a day? Since when?": 'Yes',
    "Usually, how many times(Waqt) a week are your prayers missed(Qaza)?": 'fef',
    "Do you comply with mahara / non-mahram?": 'rere',
    "Are you able to recite the Quran correctly?": 'rrrr',
    " Which fiqh do you follow?": 'rrrr',
    "Do you watch or listen to dramas/movies/serials/songs?": 'rrqr',
    "Do you have any mental or physical diseases?": 'rqrq',
    "Are you involved in any special work of deen?": 'rqrqr',
    "What are your ideas or beliefs about the shrine(Mazar)?": 'rqr',
    "Write the names of at least 3 Islamic books do you read?": 'qrrrrq',
    "Write the names of at least 3 Islamic scholars of your choice": 'qrrqr',
    "Write about your hobbies, likes, dislikes, tastes, dreams, and so on": 'rqqrrq',
    'Do you have beard according to sunnah? Since when?': 'rqrqr',
    'If you have any special knowledge about Islamic or worldly qualification':
        'qrqrqwr',
    'Write about yourself in a few sentences': 'qrwqrqwr'
  };

  final generateOccupationalInfo = {
    'Occupation': 'Software Engineer',
    'Description of Profession': 'Mobile Application Developed Since 3 years',
    'Monthly Income': 'Around 25k'
  };

  final generateMarriageRelatedInfo = {
    'Do your guardians agree to your marriage?': 'Yes',
    'Why are you getting married? What are your thoughts on marriage?': 'rqwrqwrwq',
  };

  final generateExpectedLifePartnerInfo = {
    'Expected Age': 'rrwq',
    'Expected Complexion': 'rqwrwqr',
    'Expected Height': 'wqrrqw',
    'Educational Qualification': 'rwqqwr',
    'State': 'rwqqwr',
    'Marital Status': 'rqwqr',
    'Occupation': 'rwqr',
    'Financial Condition': 'rqwrqwr',
    'Expected qualities or attributes of your life partner': 'rwrqw',
    'Ethnicity': 'rwqrqw',
  };

  final generateAuthorityQuestion = {
    'Do your parents know that you are submitting biodata on this website?':
        'Yes',
    'By Allah, testify that all the information given is true': 'Yes',
    'If you provide any false information, islamicmarriageusa.com will not take any responsibility for the conventional law and the hereafter. Do you agree?':
        'Yes',
  };
}
