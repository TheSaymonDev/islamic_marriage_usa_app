import 'package:islamic_marriage_usa_app/data/models/step8_expected_partner_info.dart';

class Step8ExpectedPartnerInfoResponse {
  int? statusCode;
  bool? success;
  String? message;
  Step8ExpectedPartnerInfo? data;

  Step8ExpectedPartnerInfoResponse({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  Step8ExpectedPartnerInfoResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null
        ? Step8ExpectedPartnerInfo.fromJson(json['data'])
        : null;
  }
}
