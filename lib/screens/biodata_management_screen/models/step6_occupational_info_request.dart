class Step6OccupationalInfoRequest {
  int step;
  Data data;

  Step6OccupationalInfoRequest({required this.step, required this.data});

  Step6OccupationalInfoRequest.fromJson(Map<String, dynamic> json)
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
  String occupation; // required
  String? professionDescription; // optional
  String? monthlyIncome; // optional

  Data({
    required this.occupation,
    this.professionDescription,
    this.monthlyIncome,
  });

  Data.fromJson(Map<String, dynamic> json)
      : occupation = json['occupation'] ?? '',
        professionDescription = json['professionDescription'],
        monthlyIncome = json['monthlyIncome'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['occupation'] = occupation;
    data['professionDescription'] = professionDescription;
    data['monthlyIncome'] = monthlyIncome;
    return data;
  }
}
