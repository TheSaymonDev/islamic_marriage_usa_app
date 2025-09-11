import 'package:islamic_marriage_usa_app/data/models/step5_personal_info.dart';

class Step5PersonalInfoResponse {
  int? statusCode;
  bool? success;
  String? message;
  Step5PersonalInfo? data;

  Step5PersonalInfoResponse({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  Step5PersonalInfoResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    data =
        json['data'] != null ? Step5PersonalInfo.fromJson(json['data']) : null;
  }
}
