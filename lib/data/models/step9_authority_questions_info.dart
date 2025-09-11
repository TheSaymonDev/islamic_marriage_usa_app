class Step9AuthorityQuestionsInfo {
  String? sId;
  String? parentsKnow;
  String? allInfoTrue;
  String? agreeResponsibility;

  Step9AuthorityQuestionsInfo({
    this.sId,
    this.parentsKnow,
    this.allInfoTrue,
    this.agreeResponsibility,
  });

  Step9AuthorityQuestionsInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    parentsKnow = json['parentsKnow'];
    allInfoTrue = json['allInfoTrue'];
    agreeResponsibility = json['agreeResponsibility'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['parentsKnow'] = parentsKnow;
    data['allInfoTrue'] = allInfoTrue;
    data['agreeResponsibility'] = agreeResponsibility;
    return data;
  }
}
