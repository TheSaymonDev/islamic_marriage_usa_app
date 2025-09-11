import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/screens/reset_password_screen/models/reset_password_model.dart';

class ResetPasswordController extends GetxController {
  bool isObscureNew = true;
  bool isObscureConfirm = true;
  bool isLoading = false;

  late String resetToken;

  final formKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    resetToken = Get.arguments['resetToken'] as String;
  }

  Future<bool> resetPassword(
      {required ResetPasswordModel resetPasswordData}) async {
    _setLoading(true);

    try {
      final response = await ApiService()
          .post(url: AppUrls.resetPasswordUrl, data: resetPasswordData);

      if (response.success) {
        AppConstFunctions.customSuccessMessage(
            message: 'Password reset successfully');
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Password reset failed';
        AppConstFunctions.customErrorMessage(message: errorMessage);
        return false;
      }
    } catch (error) {
      AppConstFunctions.customErrorMessage(message: error.toString());
      return false;
    } finally {
      _setLoading(false);
    }
  }

  void toggleObscureN() {
    isObscureNew = !isObscureNew;
    update();
  }

  void toggleObscureC() {
    isObscureConfirm = !isObscureConfirm;
    update();
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }

  void clearFields() {
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
