import 'package:islamic_marriage_usa_app/data/models/step2_address_info.dart';

class Step2AddressInfoResponse {
  int? statusCode;
  bool? success;
  String? message;
  Step2AddressInfo? data;

  Step2AddressInfoResponse({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  Step2AddressInfoResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    data =
        json['data'] != null ? Step2AddressInfo.fromJson(json['data']) : null;
  }
}
