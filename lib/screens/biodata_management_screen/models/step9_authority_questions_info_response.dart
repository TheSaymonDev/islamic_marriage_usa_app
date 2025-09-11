import 'package:islamic_marriage_usa_app/data/models/step9_authority_questions_info.dart';

class Step9AuthorityQuestionsInfoResponse {
  int? statusCode;
  bool? success;
  String? message;
  Step9AuthorityQuestionsInfo? data;

  Step9AuthorityQuestionsInfoResponse({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  Step9AuthorityQuestionsInfoResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Step9AuthorityQuestionsInfo.fromJson(json['data']) : null;
  }
}
