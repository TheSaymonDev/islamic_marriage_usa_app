class Step2AddressInfoRequest {
  int? step;
  Data? data;

  Step2AddressInfoRequest({this.step, this.data});

  Step2AddressInfoRequest.fromJson(Map<String, dynamic> json) {
    step = json['step'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['step'] = step;
    if (data != null) {
      final dataJson = data!.toJson();
      if (dataJson.isNotEmpty) {
        json['data'] = dataJson;
      }
    }
    return json;
  }
}

class Data {
  String byBornAddress; // required
  String? currentAddress;
  String? grewUpLocation;
  String? willingToSettle;

  Data({
    required this.byBornAddress,
    this.currentAddress,
    this.grewUpLocation,
    this.willingToSettle,
  });

  Data.fromJson(Map<String, dynamic> json)
      : byBornAddress = json['byBornAddress'] ?? '',
        currentAddress = json['currentAddress'],
        grewUpLocation = json['grewUpLocation'],
        willingToSettle = json['willingToSettle'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['byBornAddress'] = byBornAddress;
    data['currentAddress'] = currentAddress;
    data['grewUpLocation'] = grewUpLocation;
    data['willingToSettle'] = willingToSettle;
    return data;
  }
}
