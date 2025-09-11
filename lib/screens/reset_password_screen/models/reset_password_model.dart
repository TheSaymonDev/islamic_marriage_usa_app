class ResetPasswordModel {
  String? resetToken;
  String? newPassword;

  ResetPasswordModel({this.resetToken, this.newPassword});

  ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    resetToken = json['resetToken'];
    newPassword = json['newPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resetToken'] = resetToken;
    data['newPassword'] = newPassword;
    return data;
  }
}
