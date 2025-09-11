class ForgotOtpVerificationModel {
  String? email;
  String? otp;

  ForgotOtpVerificationModel({
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
