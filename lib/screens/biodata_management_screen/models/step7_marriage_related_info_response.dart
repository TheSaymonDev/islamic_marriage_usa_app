import 'package:islamic_marriage_usa_app/data/models/step7_marriage_related_info.dart';

class Step7MarriageRelatedInfoResponse {
  int? statusCode;
  bool? success;
  String? message;
  Step7MarriageRelatedInfo? data;

  Step7MarriageRelatedInfoResponse({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  Step7MarriageRelatedInfoResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null
        ? Step7MarriageRelatedInfo.fromJson(json['data'])
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
