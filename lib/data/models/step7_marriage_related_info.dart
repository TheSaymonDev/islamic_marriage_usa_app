class Step7MarriageRelatedInfo {
  String? sId;
  String? guardianApproval;
  String? marriageThoughts;

  Step7MarriageRelatedInfo({
    this.sId,
    this.guardianApproval,
    this.marriageThoughts,
  });

  Step7MarriageRelatedInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    guardianApproval = json['guardianApproval'];
    marriageThoughts = json['marriageThoughts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guardianApproval'] = guardianApproval;
    data['marriageThoughts'] = marriageThoughts;
    return data;
  }
}
