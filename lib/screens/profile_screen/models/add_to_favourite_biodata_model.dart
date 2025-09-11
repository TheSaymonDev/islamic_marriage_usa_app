class AddToFavouriteBiodataModel {
  String? biodataId;

  AddToFavouriteBiodataModel({
    this.biodataId,
  });


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['biodataId'] = biodataId;
    return data;
  }
}
