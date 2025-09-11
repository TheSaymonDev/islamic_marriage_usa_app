class Step4FamilyInfo {
  String? sId;
  String? fathersName;
  String? mothersName;
  String? isFatherAlive;
  String? fatherOccupation;
  String? isMotherAlive;
  String? motherOccupation;
  String? brothersCount;
  String? brothersInfo;
  String? sistersCount;
  String? sistersInfo;
  String? uncleProfession;
  String? familyFinancial;
  String? familyReligion;

  Step4FamilyInfo({
    this.sId,
    this.fathersName,
    this.mothersName,
    this.isFatherAlive,
    this.fatherOccupation,
    this.isMotherAlive,
    this.motherOccupation,
    this.brothersCount,
    this.brothersInfo,
    this.sistersCount,
    this.sistersInfo,
    this.uncleProfession,
    this.familyFinancial,
    this.familyReligion,
  });

  Step4FamilyInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fathersName = json['fathersName'];
    mothersName = json['mothersName'];
    isFatherAlive = json['isFatherAlive'];
    fatherOccupation = json['fatherOccupation'];
    isMotherAlive = json['isMotherAlive'];
    motherOccupation = json['motherOccupation'];
    brothersCount = json['brothersCount'];
    brothersInfo = json['brothersInfo'];
    sistersCount = json['sistersCount'];
    sistersInfo = json['sistersInfo'];
    uncleProfession = json['uncleProfession'];
    familyFinancial = json['familyFinancial'];
    familyReligion = json['familyReligion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fathersName'] = fathersName;
    data['mothersName'] = mothersName;
    data['isFatherAlive'] = isFatherAlive;
    data['fatherOccupation'] = fatherOccupation;
    data['isMotherAlive'] = isMotherAlive;
    data['motherOccupation'] = motherOccupation;
    data['brothersCount'] = brothersCount;
    data['brothersInfo'] = brothersInfo;
    data['sistersCount'] = sistersCount;
    data['sistersInfo'] = sistersInfo;
    data['uncleProfession'] = uncleProfession;
    data['familyFinancial'] = familyFinancial;
    data['familyReligion'] = familyReligion;
    return data;
  }
}
