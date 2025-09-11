import 'package:islamic_marriage_usa_app/data/models/step3_edu_qualification_info.dart';

class Step3EduQualificationInfoResponse {
  int? statusCode;
  bool? success;
  String? message;
  Step3EduQualificationInfo? data;

  Step3EduQualificationInfoResponse({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  Step3EduQualificationInfoResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null
        ? Step3EduQualificationInfo.fromJson(json['data'])
        : null;
  }
}
