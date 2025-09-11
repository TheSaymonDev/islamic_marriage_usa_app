class Step3EduQualificationInfo {
  String? sId;
  String? highestEducation;
  String? passYear;
  String? result;
  String? institutionName;
  String? otherQualifications;

  Step3EduQualificationInfo({
    this.sId,
    this.highestEducation,
    this.passYear,
    this.result,
    this.institutionName,
    this.otherQualifications,
  });

  Step3EduQualificationInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    highestEducation = json['highestEducation'];
    passYear = json['passYear'];
    result = json['result'];
    institutionName = json['institutionName'];
    otherQualifications = json['otherQualifications'];
  }

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
