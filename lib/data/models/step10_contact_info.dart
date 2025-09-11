class Step10ContactInfo {
  String? sId;
  String? fullName;
  String? guardianMobile;
  String? guardianRelation;
  String? contactEmail;

  Step10ContactInfo({
    this.sId,
    this.fullName,
    this.guardianMobile,
    this.guardianRelation,
    this.contactEmail,
  });

  Step10ContactInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    guardianMobile = json['guardianMobile'];
    guardianRelation = json['guardianRelation'];
    contactEmail = json['contactEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['guardianMobile'] = guardianMobile;
    data['guardianRelation'] = guardianRelation;
    data['contactEmail'] = contactEmail;
    return data;
  }
}
