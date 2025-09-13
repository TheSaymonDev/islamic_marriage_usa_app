import 'package:islamic_marriage_usa_app/data/models/step10_contact_info.dart';
import 'package:islamic_marriage_usa_app/data/models/step1_general_info.dart';
import 'package:islamic_marriage_usa_app/data/models/step2_address_info.dart';
import 'package:islamic_marriage_usa_app/data/models/step3_edu_qualification_info.dart';
import 'package:islamic_marriage_usa_app/data/models/step4_family_info.dart';
import 'package:islamic_marriage_usa_app/data/models/step5_personal_info.dart';
import 'package:islamic_marriage_usa_app/data/models/step6_occupational_info.dart';
import 'package:islamic_marriage_usa_app/data/models/step7_marriage_related_info.dart';
import 'package:islamic_marriage_usa_app/data/models/step8_expected_partner_info.dart';
import 'package:islamic_marriage_usa_app/data/models/step9_authority_questions_info.dart';

class BiodataModel {
  String? sId;
  String? user;
  String? bioDataId;
  bool? isCompleted;
  String? status;
  String? submittedAt;
  Step1GeneralInfo? step1GeneralInfo;
  Step2AddressInfo? step2AddressInfo;
  Step3EduQualificationInfo? step3EduQualificationInfo;
  Step4FamilyInfo? step4FamilyInfo;
  Step5PersonalInfo? step5PersonalInfo;
  Step6OccupationalInfo? step6OccupationalInfo;
  Step7MarriageRelatedInfo? step7MarriageRelatedInfo;
  Step8ExpectedPartnerInfo? step8ExpectedPartnerInfo;
  Step9AuthorityQuestionsInfo? step9AuthorityQuestionsInfo;
  Step10ContactInfo? step10ContactInfo;

  BiodataModel({
    this.sId,
    this.user,
    this.bioDataId,
    this.isCompleted,
    this.status,
    this.submittedAt,
    this.step1GeneralInfo,
    this.step2AddressInfo,
    this.step3EduQualificationInfo,
    this.step4FamilyInfo,
    this.step5PersonalInfo,
    this.step6OccupationalInfo,
    this.step7MarriageRelatedInfo,
    this.step8ExpectedPartnerInfo,
    this.step9AuthorityQuestionsInfo,
    this.step10ContactInfo,
  });

  BiodataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    bioDataId = json['bioDataId'];
    isCompleted = json['isCompleted'];
    status = json['status'];
    submittedAt = json['submittedAt'];
    step1GeneralInfo = json['step1GeneralInfo'] != null
        ? Step1GeneralInfo.fromJson(json['step1GeneralInfo'])
        : null;
    step2AddressInfo = json['step2AddressInfo'] != null
        ? Step2AddressInfo.fromJson(json['step2AddressInfo'])
        : null;
    step3EduQualificationInfo = json['step3EduQualificationInfo'] != null
        ? Step3EduQualificationInfo.fromJson(json['step3EduQualificationInfo'])
        : null;
    step4FamilyInfo = json['step4FamilyInfo'] != null
        ? Step4FamilyInfo.fromJson(json['step4FamilyInfo'])
        : null;
    step5PersonalInfo = json['step5PersonalInfo'] != null
        ? Step5PersonalInfo.fromJson(json['step5PersonalInfo'])
        : null;
    step6OccupationalInfo = json['step6OccupationalInfo'] != null
        ? Step6OccupationalInfo.fromJson(json['step6OccupationalInfo'])
        : null;
    step7MarriageRelatedInfo = json['step7MarriageRelatedInfo'] != null
        ? Step7MarriageRelatedInfo.fromJson(json['step7MarriageRelatedInfo'])
        : null;
    step8ExpectedPartnerInfo = json['step8ExpectedPartnerInfo'] != null
        ? Step8ExpectedPartnerInfo.fromJson(json['step8ExpectedPartnerInfo'])
        : null;
    step9AuthorityQuestionsInfo = json['step9AuthorityQuestionsInfo'] != null
        ? Step9AuthorityQuestionsInfo.fromJson(
            json['step9AuthorityQuestionsInfo'])
        : null;
    step10ContactInfo = json['step10ContactInfo'] != null
        ? Step10ContactInfo.fromJson(json['step10ContactInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['user'] = user;
    data['bioDataId'] = bioDataId;
    data['isCompleted'] = isCompleted;
    data['status'] = status;
    data['submittedAt'] = submittedAt;
    if (step1GeneralInfo != null) {
      data['step1GeneralInfo'] = step1GeneralInfo!.toJson();
    }
    if (step2AddressInfo != null) {
      data['step2AddressInfo'] = step2AddressInfo!.toJson();
    }
    if (step3EduQualificationInfo != null) {
      data['step3EduQualificationInfo'] = step3EduQualificationInfo!.toJson();
    }
    if (step4FamilyInfo != null) {
      data['step4FamilyInfo'] = step4FamilyInfo!.toJson();
    }
    if (step5PersonalInfo != null) {
      data['step5PersonalInfo'] = step5PersonalInfo!.toJson();
    }
    if (step6OccupationalInfo != null) {
      data['step6OccupationalInfo'] = step6OccupationalInfo!.toJson();
    }
    if (step7MarriageRelatedInfo != null) {
      data['step7MarriageRelatedInfo'] = step7MarriageRelatedInfo!.toJson();
    }
    if (step8ExpectedPartnerInfo != null) {
      data['step8ExpectedPartnerInfo'] = step8ExpectedPartnerInfo!.toJson();
    }
    if (step9AuthorityQuestionsInfo != null) {
      data['step9AuthorityQuestionsInfo'] =
          step9AuthorityQuestionsInfo!.toJson();
    }
    if (step10ContactInfo != null) {
      data['step10ContactInfo'] = step10ContactInfo!.toJson();
    }
    return data;
  }
}
