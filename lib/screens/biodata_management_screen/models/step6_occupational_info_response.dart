import 'package:islamic_marriage_usa_app/data/models/step6_occupational_info.dart';

class Step6OccupationalInfoResponse {
  int? statusCode;
  bool? success;
  String? message;
  Step6OccupationalInfo? data;

  Step6OccupationalInfoResponse({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  Step6OccupationalInfoResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null
        ? Step6OccupationalInfo.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
