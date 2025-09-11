class Step5PersonalInfoRequest {
  int step;
  Data data;

  Step5PersonalInfoRequest({required this.step, required this.data});

  Map<String, dynamic> toJson() {
    return {
      'step': step,
      'data': data.toJson(),
    };
  }
}

class Data {
  String legality; // required
  String ethnicity; // required
  String mobile; // required
  String? clothesOutside;
  String? deenWork;
  String? disease;
  String? fiqh;
  String? hobbies;
  String? islamicBooks;
  String? mahramCompliance;
  String? weeklyMissedPrayers;
  String? prayFiveTimesSince;
  String? reciteQuran;
  String? scholars;
  String? selfDescription;
  String? shrineBelief;
  String? specialKnowledge;
  String? watchMedia;

  Data({
    required this.legality,
    required this.ethnicity,
    required this.mobile,
    this.clothesOutside,
    this.deenWork,
    this.disease,
    this.fiqh,
    this.hobbies,
    this.islamicBooks,
    this.mahramCompliance,
    this.weeklyMissedPrayers,
    this.prayFiveTimesSince,
    this.reciteQuran,
    this.scholars,
    this.selfDescription,
    this.shrineBelief,
    this.specialKnowledge,
    this.watchMedia,
  });


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['legality'] = legality;
    data['ethnicity'] = ethnicity;
    data['mobile'] = mobile;

    data['clothesOutside'] = clothesOutside;
    data['deenWork'] = deenWork;
    data['disease'] = disease;
    if (fiqh != null && fiqh.toString().isNotEmpty) {
      data['fiqh'] = fiqh;
    }
    data['hobbies'] = hobbies;
    data['islamicBooks'] = islamicBooks;
    data['mahramCompliance'] = mahramCompliance;
    data['weeklyMissedPrayers'] = weeklyMissedPrayers;
    data['prayFiveTimesSince'] = prayFiveTimesSince;
    data['reciteQuran'] = reciteQuran;
    data['scholars'] = scholars;
    data['selfDescription'] = selfDescription;
    data['shrineBelief'] = shrineBelief;
    data['specialKnowledge'] = specialKnowledge;
    data['watchMedia'] = watchMedia;

    return data;
  }
}
