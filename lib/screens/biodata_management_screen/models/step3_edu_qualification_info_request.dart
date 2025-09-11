class Step3EduQualificationInfoRequest {
  int step;
  Data data;

  Step3EduQualificationInfoRequest({required this.step, required this.data});

  Step3EduQualificationInfoRequest.fromJson(Map<String, dynamic> json)
      : step = json['step'],
        data = Data.fromJson(json['data']);

  Map<String, dynamic> toJson() {
    return {
      'step': step,
      'data': data.toJson(),
    };
  }
}

class Data {
  String highestEducation; // required
  String? passYear; // optional
  String? result; // optional
  String? institutionName; // optional
  String? otherQualifications; // optional

  Data({
    required this.highestEducation,
    this.passYear,
    this.result,
    this.institutionName,
    this.otherQualifications,
  });

  Data.fromJson(Map<String, dynamic> json)
      : highestEducation = json['highestEducation'] ?? '',
        passYear = json['passYear'],
        result = json['result'],
        institutionName = json['institutionName'],
        otherQualifications = json['otherQualifications'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['highestEducation'] = highestEducation;

    data['passYear'] = passYear;
    data['result'] = result;
    data['institutionName'] = institutionName;
    data['otherQualifications'] = otherQualifications;

    return data;
  }
}
