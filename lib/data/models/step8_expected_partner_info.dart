class Step8ExpectedPartnerInfo {
  String? sId;
  List<int>? expectedAgeRange;
  List<String>? expectedComplexion;
  String? expectedHeight;
  String? expectedEducation;
  List<String>? expectedState;
  List<String>? expectedMaritalStatus;
  String? expectedOccupation;
  String? expectedFinancialCondition;
  String? expectedPartnerAttributes;
  String? expectedLegality;
  String? expectedEthnicity;

  Step8ExpectedPartnerInfo({
    this.sId,
    this.expectedAgeRange,
    this.expectedComplexion,
    this.expectedHeight,
    this.expectedEducation,
    this.expectedState,
    this.expectedMaritalStatus,
    this.expectedOccupation,
    this.expectedFinancialCondition,
    this.expectedPartnerAttributes,
    this.expectedLegality,
    this.expectedEthnicity,
  });

  Step8ExpectedPartnerInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    expectedAgeRange = json['expectedAgeRange'].cast<int>();
    expectedComplexion = json['expectedComplexion'].cast<String>();
    expectedHeight = json['expectedHeight'];
    expectedEducation = json['expectedEducation'];
    expectedState = json['expectedState'].cast<String>();
    expectedMaritalStatus = json['expectedMaritalStatus'].cast<String>();
    expectedOccupation = json['expectedOccupation'];
    expectedFinancialCondition = json['expectedFinancialCondition'];
    expectedPartnerAttributes = json['expectedPartnerAttributes'];
    expectedLegality = json['expectedLegality'];
    expectedEthnicity = json['expectedEthnicity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expectedAgeRange'] = expectedAgeRange;
    data['expectedComplexion'] = expectedComplexion;
    data['expectedHeight'] = expectedHeight;
    data['expectedEducation'] = expectedEducation;
    data['expectedState'] = expectedState;
    data['expectedMaritalStatus'] = expectedMaritalStatus;
    data['expectedOccupation'] = expectedOccupation;
    data['expectedFinancialCondition'] = expectedFinancialCondition;
    data['expectedPartnerAttributes'] = expectedPartnerAttributes;
    data['expectedLegality'] = expectedLegality;
    data['expectedEthnicity'] = expectedEthnicity;
    return data;
  }
}
