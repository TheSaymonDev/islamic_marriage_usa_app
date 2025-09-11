class Step2AddressInfo {
  String? sId;

  String? byBornAddress;
  String? currentAddress;
  String? grewUpLocation;
  String? willingToSettle;

  Step2AddressInfo({
    this.sId,
    this.byBornAddress,
    this.currentAddress,
    this.grewUpLocation,
    this.willingToSettle,
  });

  Step2AddressInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    byBornAddress = json['byBornAddress'];
    currentAddress = json['currentAddress'];
    grewUpLocation = json['grewUpLocation'];
    willingToSettle = json['willingToSettle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['byBornAddress'] = byBornAddress;
    data['currentAddress'] = currentAddress;
    data['grewUpLocation'] = grewUpLocation;
    data['willingToSettle'] = willingToSettle;
    return data;
  }
}
