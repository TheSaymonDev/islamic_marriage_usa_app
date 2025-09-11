class Step1GeneralInfo {
  String? sId;
  String? biodataType;
  String? maritalStatus;
  String? dateOfBirth;
  String? height;
  String? complexion;
  String? weight;
  String? bloodGroup;
  String? state;
  String? postalCode;

  Step1GeneralInfo({
    this.sId,
    this.biodataType,
    this.maritalStatus,
    this.dateOfBirth,
    this.height,
    this.complexion,
    this.weight,
    this.bloodGroup,
    this.state,
    this.postalCode,
  });

  Step1GeneralInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    biodataType = json['biodataType'];
    maritalStatus = json['maritalStatus'];
    dateOfBirth = json['dateOfBirth'];
    height = json['height'];
    complexion = json['complexion'];
    weight = json['weight'];
    bloodGroup = json['bloodGroup'];
    state = json['state'];
    postalCode = json['postalCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['biodataType'] = biodataType;
    data['maritalStatus'] = maritalStatus;
    data['dateOfBirth'] = dateOfBirth;
    data['height'] = height;
    data['complexion'] = complexion;
    data['weight'] = weight;
    data['bloodGroup'] = bloodGroup;
    data['state'] = state;
    data['postalCode'] = postalCode;
    return data;
  }
}
