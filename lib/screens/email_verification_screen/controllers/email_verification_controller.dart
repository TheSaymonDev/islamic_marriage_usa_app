import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/screens/email_verification_screen/models/email_verification_model.dart';

class EmailVerificationController extends GetxController {
  bool isLoading = false;
  int? userId;
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<bool> verifyEmail(
      {required EmailVerificationModel emailVerificationData}) async {
    _setLoading(true);

    try {
      final response = await ApiService()
          .post(url: AppUrls.emailVerificationUrl, data: emailVerificationData);

      if (response.success) {
        AppConstFunctions.customSuccessMessage(
            message: 'Email verified successfully');
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Email verification failed';
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

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }

  void clearFields() {
    emailController.clear();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
