class OtpVerificationModel {
  String? email;
  String? otp;

  OtpVerificationModel({
    this.email,
    this.otp,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['otp'] = otp;
    return data;
  }
}
