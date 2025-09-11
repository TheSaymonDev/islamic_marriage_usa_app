import 'package:islamic_marriage_usa_app/data/models/step1_general_info.dart';

class Step1GeneralInfoResponse {
  int? statusCode;
  bool? success;
  String? message;
  Step1GeneralInfo? data;

  Step1GeneralInfoResponse({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  Step1GeneralInfoResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    data =
        json['data'] != null ? Step1GeneralInfo.fromJson(json['data']) : null;
  }
}
