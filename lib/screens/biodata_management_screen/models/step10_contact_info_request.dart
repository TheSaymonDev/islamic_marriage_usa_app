class Step10ContactInfoRequest {
  int step;
  Data data;

  Step10ContactInfoRequest({required this.step, required this.data});

  Step10ContactInfoRequest.fromJson(Map<String, dynamic> json)
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
  String fullName;
  String guardianMobile;
  String guardianRelation;
  String contactEmail;

  Data({
    required this.fullName,
    required this.guardianMobile,
    required this.guardianRelation,
    required this.contactEmail,
  });

  Data.fromJson(Map<String, dynamic> json)
      : fullName = json['fullName'],
        guardianMobile = json['guardianMobile'],
        guardianRelation = json['guardianRelation'],
        contactEmail = json['contactEmail'];

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'guardianMobile': guardianMobile,
      'guardianRelation': guardianRelation,
      'contactEmail': contactEmail,
    };
  }
}
