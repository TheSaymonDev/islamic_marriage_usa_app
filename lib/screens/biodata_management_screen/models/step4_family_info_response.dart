import 'package:islamic_marriage_usa_app/data/models/step4_family_info.dart';

class Step4FamilyInfoResponse {
  int? statusCode;
  bool? success;
  String? message;
  Step4FamilyInfo? data;

  Step4FamilyInfoResponse({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  Step4FamilyInfoResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Step4FamilyInfo.fromJson(json['data']) : null;
  }
}
