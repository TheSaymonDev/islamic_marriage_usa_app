import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_colors.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_app_bar_with_title.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_bio_data_table.dart';
import 'package:islamic_marriage_usa_app/core/widgets/custom_expansion_tile.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_details_screen/controllers/biodata_details_controller.dart';

class BiodataDetailsScreen extends StatelessWidget {
  BiodataDetailsScreen({super.key});

  final _controller = Get.find<BiodataDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarWithTitle(
            onPressed: () => Get.back(), title: 'Biodata Details'),
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
                        backgroundImage: AssetImage(
                          _controller.biodata.step1GeneralInfo?.biodataType ==
                                  "Female's Biodata"
                              ? AppUrls.femaleIcon
                              : AppUrls.maleIcon,
                        ),
                        backgroundColor: Colors.white,
                      ),
                      Gap(8.h),
                      Text(
                        'Biodata No: ${_controller.biodata.bioDataId ?? "N/A"}',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                      Gap(8.h),
                      if (_controller.biodata.step1GeneralInfo != null)
                        CustomBioDataTable(
                          data: removeEmptyFields(generateGeneralInfo()),
                        ),
                    ],
                  ),
                ),
                // Address Info Section
                if (_controller.biodata.step2AddressInfo != null)
                  CustomExpansionTile(title: 'Address Info', children: [
                    CustomBioDataTable(
                      data: removeEmptyFields(generateAddressInfo()),
                    )
                  ]),

                // Educational Qualification Info Section
                if (_controller.biodata.step3EduQualificationInfo != null)
                  CustomExpansionTile(
                      title: 'Educational Qualification Info',
                      children: [
                        CustomBioDataTable(
                          data:
                              removeEmptyFields(generateEduQualificationInfo()),
                        )
                      ]),

                // Family Info Section
                if (_controller.biodata.step4FamilyInfo != null)
                  CustomExpansionTile(title: 'Family Info', children: [
                    CustomBioDataTable(
                      data: removeEmptyFields(generateFamilyInfo()),
                    )
                  ]),

                // Personal Info Section
                if (_controller.biodata.step5PersonalInfo != null)
                  CustomExpansionTile(title: 'Personal Info'.tr, children: [
                    CustomBioDataTable(
                      data: removeEmptyFields(generatePersonalInfo()),
                    )
                  ]),

                // Occupational Info Section
                if (_controller.biodata.step6OccupationalInfo != null)
                  CustomExpansionTile(title: 'Occupational Info', children: [
                    CustomBioDataTable(
                      data: removeEmptyFields(generateOccupationalInfo()),
                    )
                  ]),

                // Marriage Related Info Section
                if (_controller.biodata.step7MarriageRelatedInfo != null)
                  CustomExpansionTile(
                      title: 'Marriage Related Info',
                      children: [
                        CustomBioDataTable(
                          data:
                              removeEmptyFields(generateMarriageRelatedInfo()),
                        )
                      ]),

                // Expected Life Partner Info Section
                if (_controller.biodata.step8ExpectedPartnerInfo != null)
                  CustomExpansionTile(
                      title: 'Expected Life Partner Info',
                      children: [
                        CustomBioDataTable(
                          data: removeEmptyFields(
                              generateExpectedLifePartnerInfo()),
                        )
                      ]),

                // Authorized Question Info Section
                if (_controller.biodata.step9AuthorityQuestionsInfo != null)
                  CustomExpansionTile(
                    title: 'Authorized Question Info',
                    children: [
                      CustomBioDataTable(
                        data: removeEmptyFields(generateAuthorityQuestion()),
                      )
                    ],
                  ),

                // Contact Info Section
                if (_controller.biodata.step10ContactInfo != null)
                  CustomExpansionTile(
                    title: 'Contact Info',
                    children: [
                      CustomBioDataTable(
                        data: removeEmptyFields(generateContactInfo()),
                      )
                    ],
                  ),
              ],
            ),
          ),
        ));
  }

  // Filter out empty fields
  Map<String, String?> removeEmptyFields(Map<String, String?> data) {
    return data..removeWhere((key, value) => value == null || value.isEmpty);
  }

  // Generate General Info from API data
  Map<String, String?> generateGeneralInfo() {
    final generalInfo = _controller.biodata.step1GeneralInfo;
    return {
      'Biodata Type': generalInfo?.biodataType,
      'Marital Status': generalInfo?.maritalStatus,
      'Date of Birth': AppConstFunctions.formatApiDate(generalInfo?.dateOfBirth),
      'Complexion': generalInfo?.complexion,
      'Height': generalInfo?.height,
      'Weight': generalInfo?.weight,
      'Blood Group': generalInfo?.bloodGroup,
      'State': generalInfo?.state,
      'Postal Code': generalInfo?.postalCode,
    };
  }

  // Generate Address Info from API data
  Map<String, String?> generateAddressInfo() {
    final addressInfo = _controller.biodata.step2AddressInfo;
    return {
      'By Born Address': addressInfo?.byBornAddress,
      'Current Address': addressInfo?.currentAddress,
      'Where did you grow up?': addressInfo?.grewUpLocation,
      'Where did you willing to settle': addressInfo?.willingToSettle,
    };
  }

  // Generate Educational Qualification Info from API data
  Map<String, String?> generateEduQualificationInfo() {
    final eduInfo = _controller.biodata.step3EduQualificationInfo;
    return {
      'Highest education qualification': eduInfo?.highestEducation,
      'Passing year': eduInfo?.passYear,
      'Result': eduInfo?.result,
      'Name of educational institution': eduInfo?.institutionName,
      'Other educational qualification': eduInfo?.otherQualifications,
    };
  }

  // Generate Family Info from API data
  Map<String, String?> generateFamilyInfo() {
    final familyInfo = _controller.biodata.step4FamilyInfo;
    return {
      "Father's Name": familyInfo?.fathersName,
      'Is your father alive?': familyInfo?.isFatherAlive,
      "Description of father's profession": familyInfo?.fatherOccupation,
      "Mother's Name": familyInfo?.mothersName,
      'Is your mother alive?': familyInfo?.isMotherAlive,
      "Description of mother's profession": familyInfo?.motherOccupation,
      'How many brothers do you have?': familyInfo?.brothersCount,
      "Brother's Information": familyInfo?.brothersInfo,
      'How many sisters do you have?': familyInfo?.sistersCount,
      "Sister's Information": familyInfo?.sistersInfo,
      'Profession of uncles': familyInfo?.uncleProfession,
      "Describe the family's financial situation": familyInfo?.familyFinancial,
      "How is your family's religious condition?": familyInfo?.familyReligion,
    };
  }

  // Generate Personal Info from API data
  Map<String, String?> generatePersonalInfo() {
    final personalInfo = _controller.biodata.step5PersonalInfo;
    return {
      'Your legality': personalInfo?.legality,
      'Your Ethnicity': personalInfo?.ethnicity,
      "Bride/Groom's Mobile Number": personalInfo?.mobile,
      'What kind of clothes do you usually wear outside the house?':
          personalInfo?.clothesOutside,
      "Do you pray five times a day? Since when?":
          personalInfo?.prayFiveTimesSince,
      "Usually, how many times(Waqt) a week are your prayers missed(Qaza)?":
          personalInfo?.weeklyMissedPrayers,
      "Do you comply with mahara / non-mahram?": personalInfo?.mahramCompliance,
      "Are you able to recite the Quran correctly?": personalInfo?.reciteQuran,
      " Which fiqh do you follow?": personalInfo?.fiqh,
      "Do you watch or listen to dramas/movies/serials/songs?":
          personalInfo?.watchMedia,
      "Do you have any mental or physical diseases?": personalInfo?.disease,
      "Are you involved in any special work of deen?": personalInfo?.deenWork,
      "What are your ideas or beliefs about the shrine(Mazar)?":
          personalInfo?.shrineBelief,
      "Write the names of at least 3 Islamic books do you read?":
          personalInfo?.islamicBooks,
      "Write the names of at least 3 Islamic scholars of your choice":
          personalInfo?.scholars,
      "Write about your hobbies, likes, dislikes, tastes, dreams, and so on":
          personalInfo?.hobbies,
      'Do you have beard according to sunnah? Since when?': '',
      'If you have any special knowledge about Islamic or worldly qualification':
          personalInfo?.specialKnowledge,
      'Write about yourself in a few sentences': personalInfo?.selfDescription,
    };
  }

  // Generate Occupational Info from API data
  Map<String, String?> generateOccupationalInfo() {
    final occupationalInfo = _controller.biodata.step6OccupationalInfo;
    return {
      'Occupation': occupationalInfo?.occupation,
      'Description of Profession': occupationalInfo?.professionDescription,
      'Monthly Income': occupationalInfo?.monthlyIncome,
    };
  }

  // Generate Marriage Related Info from API data
  Map<String, String?> generateMarriageRelatedInfo() {
    final marriageInfo = _controller.biodata.step7MarriageRelatedInfo;
    return {
      'Do your guardians agree to your marriage?':
          marriageInfo?.guardianApproval,
      'Why are you getting married? What are your thoughts on marriage?':
          marriageInfo?.marriageThoughts,
    };
  }

  // Generate Expected Life Partner Info from API data
  Map<String, String?> generateExpectedLifePartnerInfo() {
    final partnerInfo = _controller.biodata.step8ExpectedPartnerInfo;
    return {
      'Expected Age': partnerInfo?.expectedAgeRange?.join(' - '),
      'Expected Complexion': partnerInfo?.expectedComplexion?.join(', '),
      'Expected Height': partnerInfo?.expectedHeight,
      'Educational Qualification': partnerInfo?.expectedEducation,
      'State': partnerInfo?.expectedState?.join(', '),
      'Marital Status': partnerInfo?.expectedMaritalStatus?.join(', '),
      'Occupation': partnerInfo?.expectedOccupation,
      'Financial Condition': partnerInfo?.expectedFinancialCondition,
      'Expected qualities or attributes of your life partner':
          partnerInfo?.expectedPartnerAttributes,
      'Ethnicity': partnerInfo?.expectedEthnicity,
    };
  }

  // Generate Authority Question from API data
  Map<String, String?> generateAuthorityQuestion() {
    final authorityInfo = _controller.biodata.step9AuthorityQuestionsInfo;
    return {
      'Do your parents know that you are submitting biodata on this website?':
          authorityInfo?.parentsKnow,
      'By Allah, testify that all the information given is true':
          authorityInfo?.allInfoTrue,
      'If you provide any false information, islamicmarriageusa.com will not take any responsibility for the conventional law and the hereafter. Do you agree?':
          authorityInfo?.agreeResponsibility,
    };
  }

  // Generate Contact Info from API data
  Map<String, String?> generateContactInfo() {
    final contactInfo = _controller.biodata.step10ContactInfo;
    return {
      'Full Name': contactInfo?.fullName,
      "Guardian's Mobile Number": contactInfo?.guardianMobile,
      'Relationship with Guardian': contactInfo?.guardianRelation,
      'Email': contactInfo?.contactEmail,
    };
  }
}
