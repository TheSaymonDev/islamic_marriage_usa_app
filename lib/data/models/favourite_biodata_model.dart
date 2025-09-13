import 'package:islamic_marriage_usa_app/data/models/biodata_model.dart';

class FavouriteBiodataModel {
  int? statusCode;
  bool? success;
  String? message;
  List<Data>? data;

  FavouriteBiodataModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  FavouriteBiodataModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? user;
  BiodataModel? biodata;

  Data({this.sId, this.user, this.biodata});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    biodata =
        json['biodata'] != null ? BiodataModel.fromJson(json['biodata']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['user'] = user;
    if (biodata != null) {
      data['biodata'] = biodata!.toJson();
    }
    return data;
  }
}
