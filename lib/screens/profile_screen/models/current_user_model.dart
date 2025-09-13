class CurrentUserModel {
  int? statusCode;
  bool? success;
  String? message;
  Data? data;

  CurrentUserModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  CurrentUserModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? biodataStatus;
  List<String>? favoriteBiodatas;
  String? sId;
  String? name;
  String? email;
  bool? otpVerified;
  String? createdAt;
  String? updatedAt;
  String? userId;

  Data({
    this.biodataStatus,
    this.favoriteBiodatas,
    this.sId,
    this.name,
    this.email,
    this.otpVerified,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  Data.fromJson(Map<String, dynamic> json) {
    biodataStatus = json['biodataStatus'];
    favoriteBiodatas = json['favoriteBiodatas'].cast<String>();
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    otpVerified = json['otpVerified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['biodataStatus'] = biodataStatus;
    data['favoriteBiodatas'] = favoriteBiodatas;
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['otpVerified'] = otpVerified;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['userId'] = userId;
    return data;
  }
}
