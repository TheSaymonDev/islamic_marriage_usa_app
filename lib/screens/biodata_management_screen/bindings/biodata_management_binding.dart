import 'package:get/get.dart';
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

class BiodataManagementBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(Step1GeneralInfoController());
    Get.put(Step2AddressInfoController());
    Get.put(Step3EduQualificationController());
    Get.put(Step4FamilyInfoController());
    Get.put(Step5PersonalInfoController());
    Get.put(Step6OccupationalInfoController());
    Get.put(Step7MarriageRelatedInfoController());
    Get.put(Step8ExpectedPartnerInfoController());
    Get.put(Step9AuthorityQuestionsController());
    Get.put(Step10ContactInfoController());
    Get.put(SubmitBiodataController());
  }
}