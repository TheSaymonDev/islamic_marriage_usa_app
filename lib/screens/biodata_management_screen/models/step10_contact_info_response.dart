import 'package:islamic_marriage_usa_app/data/models/step10_contact_info.dart';

class Step10ContactInfoResponse {
  int? statusCode;
  bool? success;
  String? message;
  Step10ContactInfo? data;

  Step10ContactInfoResponse({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  Step10ContactInfoResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Step10ContactInfo.fromJson(json['data']) : null;
  }
}
