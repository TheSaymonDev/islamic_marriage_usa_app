class Step6OccupationalInfo {
  String? sId;
  String? occupation;
  String? professionDescription;
  String? monthlyIncome;

  Step6OccupationalInfo({
    this.sId,
    this.occupation,
    this.professionDescription,
    this.monthlyIncome,
  });

  Step6OccupationalInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    occupation = json['occupation'];
    professionDescription = json['professionDescription'];
    monthlyIncome = json['monthlyIncome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['occupation'] = occupation;
    data['professionDescription'] = professionDescription;
    data['monthlyIncome'] = monthlyIncome;
    return data;
  }
}
