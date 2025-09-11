import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/screens/otp_verification_screen/controllers/timer_controller.dart';
import 'package:islamic_marriage_usa_app/screens/otp_verification_screen/models/otp_verification_model.dart';

class OtpVerificationController extends GetxController {
  bool isLoading = false;

  final otpController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  late String name;
  late String email;
  late String password;

  @override
  void onInit() {
    super.onInit();
    name = Get.arguments['name'] as String;
    email = Get.arguments['email'] as String;
    password = Get.arguments['password'] as String;

    // Timer start করুন
    Get.find<TimerController>().startTimer();
  }

  Future<bool> verifyOtp(
      {required OtpVerificationModel otpVerificationData}) async {
    _setLoading(true);

    try {
      final response = await ApiService()
          .post(url: AppUrls.otpVerificationUrl, data: otpVerificationData);

      if (response.success) {
        AppConstFunctions.customSuccessMessage(
            message: 'OTP verified successfully');
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

  void clearField() {
    otpController.clear();
  }

  @override
  void dispose() {
    // Timer cancel করুন
    final timerController = Get.find<TimerController>();
    timerController.timer!.cancel();

    otpController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
