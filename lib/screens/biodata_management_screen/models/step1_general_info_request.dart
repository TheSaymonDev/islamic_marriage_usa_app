class Step1GeneralInfoRequest {
  int step;
  Data data;

  Step1GeneralInfoRequest({required this.step, required this.data});

  Map<String, dynamic> toJson() {
    return {
      'step': step,
      'data': data.toJson(),
    };
  }
}

class Data {
  String biodataType;
  String maritalStatus;
  String complexion;
  String height;
  String weight;
  String bloodGroup;
  String state;
  String postalCode;
  String dateOfBirth;

  Data({
    required this.biodataType,
    required this.maritalStatus,
    required this.complexion,
    required this.height,
    required this.weight,
    required this.bloodGroup,
    required this.state,
    required this.postalCode,
    required this.dateOfBirth,
  });

  Map<String, dynamic> toJson() {
    return {
      'biodataType': biodataType,
      'maritalStatus': maritalStatus,
      'complexion': complexion,
      'height': height,
      'weight': weight,
      'bloodGroup': bloodGroup,
      'state': state,
      'postalCode': postalCode,
      'dateOfBirth': dateOfBirth,
    };
  }
}
