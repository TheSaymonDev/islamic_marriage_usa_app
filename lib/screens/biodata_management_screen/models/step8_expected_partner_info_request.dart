class Step8ExpectedPartnerInfoRequest {
  int step;
  Data data;

  Step8ExpectedPartnerInfoRequest({required this.step, required this.data});

  Map<String, dynamic> toJson() {
    return {
      'step': step,
      'data': data.toJson(),
    };
  }
}

class Data {
  List<int> expectedAgeRange; // required
  List<String>? expectedComplexion;
  String? expectedHeight;
  String? expectedEducation;
  List<String>? expectedState;
  List<String>? expectedMaritalStatus;
  String? expectedOccupation;
  String? expectedFinancialCondition;
  String? expectedPartnerAttributes;
  String? expectedEthnicity;
  String? expectedLegality;

  Data({
    required this.expectedAgeRange,
    this.expectedComplexion,
    this.expectedHeight,
    this.expectedEducation,
    this.expectedState,
    this.expectedMaritalStatus,
    this.expectedOccupation,
    this.expectedFinancialCondition,
    this.expectedPartnerAttributes,
    this.expectedEthnicity,
    this.expectedLegality,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expectedAgeRange'] = expectedAgeRange;

    data['expectedComplexion'] = expectedComplexion;
    data['expectedState'] = expectedState;
    data['expectedMaritalStatus'] = expectedMaritalStatus;

    data['expectedHeight'] = expectedHeight;
    data['expectedEducation'] = expectedEducation;
    data['expectedOccupation'] = expectedOccupation;
    data['expectedFinancialCondition'] = expectedFinancialCondition;
    data['expectedPartnerAttributes'] = expectedPartnerAttributes;
    data['expectedEthnicity'] = expectedEthnicity;
    data['expectedLegality'] = expectedLegality;

    return data;
  }
}
