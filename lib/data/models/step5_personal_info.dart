class Step5PersonalInfo {
  String? sId;
  String? legality;
  String? ethnicity;
  String? mobile;
  String? clothesOutside;
  String? prayFiveTimesSince;
  String? weeklyMissedPrayers;
  String? mahramCompliance;
  String? reciteQuran;
  String? fiqh;
  String? watchMedia;
  String? disease;
  String? deenWork;
  String? shrineBelief;
  String? islamicBooks;
  String? scholars;
  String? hobbies;
  String? specialKnowledge;
  String? selfDescription;

  Step5PersonalInfo({
    this.sId,
    this.legality,
    this.ethnicity,
    this.mobile,
    this.clothesOutside,
    this.prayFiveTimesSince,
    this.weeklyMissedPrayers,
    this.mahramCompliance,
    this.reciteQuran,
    this.fiqh,
    this.watchMedia,
    this.disease,
    this.deenWork,
    this.shrineBelief,
    this.islamicBooks,
    this.scholars,
    this.hobbies,
    this.specialKnowledge,
    this.selfDescription,
  });

  Step5PersonalInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    legality = json['legality'];
    ethnicity = json['ethnicity'];
    mobile = json['mobile'];
    clothesOutside = json['clothesOutside'];
    prayFiveTimesSince = json['prayFiveTimesSince'];
    weeklyMissedPrayers = json['weeklyMissedPrayers'];
    mahramCompliance = json['mahramCompliance'];
    reciteQuran = json['reciteQuran'];
    fiqh = json['fiqh'];
    watchMedia = json['watchMedia'];
    disease = json['disease'];
    deenWork = json['deenWork'];
    shrineBelief = json['shrineBelief'];
    islamicBooks = json['islamicBooks'];
    scholars = json['scholars'];
    hobbies = json['hobbies'];
    specialKnowledge = json['specialKnowledge'];
    selfDescription = json['selfDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['legality'] = legality;
    data['ethnicity'] = ethnicity;
    data['mobile'] = mobile;
    data['clothesOutside'] = clothesOutside;
    data['prayFiveTimesSince'] = prayFiveTimesSince;
    data['weeklyMissedPrayers'] = weeklyMissedPrayers;
    data['mahramCompliance'] = mahramCompliance;
    data['reciteQuran'] = reciteQuran;
    data['fiqh'] = fiqh;
    data['watchMedia'] = watchMedia;
    data['disease'] = disease;
    data['deenWork'] = deenWork;
    data['shrineBelief'] = shrineBelief;
    data['islamicBooks'] = islamicBooks;
    data['scholars'] = scholars;
    data['hobbies'] = hobbies;
    data['specialKnowledge'] = specialKnowledge;
    data['selfDescription'] = selfDescription;
    return data;
  }
}
