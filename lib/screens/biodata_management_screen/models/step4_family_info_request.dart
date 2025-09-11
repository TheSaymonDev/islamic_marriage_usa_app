class Step4FamilyInfoRequest {
  int step;
  Data data;

  Step4FamilyInfoRequest({required this.step, required this.data});

  Step4FamilyInfoRequest.fromJson(Map<String, dynamic> json)
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
  String fathersName; // required
  String mothersName; // required
  String? brothersCount;
  String? brothersInfo;
  String? familyFinancial;
  String? familyReligion;
  String? fatherOccupation;
  String? isFatherAlive;
  String? isMotherAlive;
  String? motherOccupation;
  String? sistersCount;
  String? sistersInfo;
  String? uncleProfession;

  Data({
    required this.fathersName,
    required this.mothersName,
    this.brothersCount,
    this.brothersInfo,
    this.familyFinancial,
    this.familyReligion,
    this.fatherOccupation,
    this.isFatherAlive,
    this.isMotherAlive,
    this.motherOccupation,
    this.sistersCount,
    this.sistersInfo,
    this.uncleProfession,
  });

  Data.fromJson(Map<String, dynamic> json)
      : fathersName = json['fathersName'] ?? '',
        mothersName = json['mothersName'] ?? '',
        brothersCount = json['brothersCount'],
        brothersInfo = json['brothersInfo'],
        familyFinancial = json['familyFinancial'],
        familyReligion = json['familyReligion'],
        fatherOccupation = json['fatherOccupation'],
        isFatherAlive = json['isFatherAlive'],
        isMotherAlive = json['isMotherAlive'],
        motherOccupation = json['motherOccupation'],
        sistersCount = json['sistersCount'],
        sistersInfo = json['sistersInfo'],
        uncleProfession = json['uncleProfession'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fathersName'] = fathersName;
    data['mothersName'] = mothersName;
    if (brothersCount != null && brothersCount.toString().isNotEmpty) {
      data['brothersCount'] = brothersCount;
    }
    data['brothersInfo'] = brothersInfo;
    data['familyFinancial'] = familyFinancial;
    data['familyReligion'] = familyReligion;
    data['fatherOccupation'] = fatherOccupation;
    if (isFatherAlive != null && isFatherAlive.toString().isNotEmpty) {
      data['isFatherAlive'] = isFatherAlive;
    }
    if (isMotherAlive != null && isMotherAlive.toString().isNotEmpty) {
      data['isMotherAlive'] = isMotherAlive;
    }
    data['motherOccupation'] = motherOccupation;
    if (sistersCount != null && sistersCount.toString().isNotEmpty) {
      data['sistersCount'] = sistersCount;
    }
    data['sistersInfo'] = sistersInfo;
    data['uncleProfession'] = uncleProfession;
    return data;
  }
}
