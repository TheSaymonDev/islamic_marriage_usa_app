class Step9AuthorityQuestionsInfoRequest {
  int step;
  Data data;

  Step9AuthorityQuestionsInfoRequest({required this.step, required this.data});

  Step9AuthorityQuestionsInfoRequest.fromJson(Map<String, dynamic> json)
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
  String parentsKnow;
  String allInfoTrue;
  String agreeResponsibility;

  Data({
    required this.parentsKnow,
    required this.allInfoTrue,
    required this.agreeResponsibility,
  });

  Data.fromJson(Map<String, dynamic> json)
      : parentsKnow = json['parentsKnow'],
        allInfoTrue = json['allInfoTrue'],
        agreeResponsibility = json['agreeResponsibility'];

  Map<String, dynamic> toJson() {
    return {
      'parentsKnow': parentsKnow,
      'allInfoTrue': allInfoTrue,
      'agreeResponsibility': agreeResponsibility,
    };
  }
}
