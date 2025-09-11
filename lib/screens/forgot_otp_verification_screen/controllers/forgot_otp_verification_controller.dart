import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/screens/forgot_otp_verification_screen/controllers/forgot_timer_controller.dart';
import 'package:islamic_marriage_usa_app/screens/forgot_otp_verification_screen/models/forgot_otp_verification_model.dart';

class ForgotOtpVerificationController extends GetxController {
  bool isLoading = false;

  final forgotOtpController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  late String email;
  String? resetToken;

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'] as String;
    // Timer start করুন
    Get.find<ForgotTimerController>().startTimer();
  }

  Future<bool> verifyForgotPasswordOtp({
    required ForgotOtpVerificationModel forgotOtpVerificationData,
  }) async {

    _setLoading(true);

    try {
      final response = await ApiService().post(
          url: AppUrls.forgotOtpVerificationUrl, data: forgotOtpVerificationData);

      if (response.success) {
        AppConstFunctions.customSuccessMessage(
            message: 'OTP verified, you can reset your password now');
        resetToken = response.data['data']['resetToken'];
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'OTP verification failed';
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
    forgotOtpController.clear();
  }

  @override
  void dispose() {
    // Timer cancel করুন
    final forgotTimerController = Get.find<ForgotTimerController>();
    forgotTimerController.timer!.cancel();

    forgotOtpController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
