class Step7MarriageRelatedInfoRequest {
  int step;
  Data data;

  Step7MarriageRelatedInfoRequest({required this.step, required this.data});

  Step7MarriageRelatedInfoRequest.fromJson(Map<String, dynamic> json)
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
  String guardianApproval; // required
  String? marriageThoughts; // optional

  Data({required this.guardianApproval, this.marriageThoughts});

  Data.fromJson(Map<String, dynamic> json)
      : guardianApproval = json['guardianApproval'] ?? '',
        marriageThoughts = json['marriageThoughts'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guardianApproval'] = guardianApproval;
    data['marriageThoughts'] = marriageThoughts;
    return data;
  }
}
