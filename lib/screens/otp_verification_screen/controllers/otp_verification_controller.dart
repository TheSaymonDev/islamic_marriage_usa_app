import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController{
  bool isLoading = false;

  final otpController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  String? identity;

  // Future<bool> verifyOTP({required OtpVerificationModel otpVerificationData}) async {
  //   if (!await ConnectivityService.isConnected()) {
  //     customErrorMessage(message: 'Please check your internet connection');
  //     return false;
  //   }
  //   _setLoading(true);
  //   try {
  //     final response = await ApiService()
  //         .post(url: AppUrls.otpVerificationUrl, data: otpVerificationData);
  //     if (response.success) {
  //       customSuccessMessage(message: 'Otp Successfully Verified');
  //       _setLoading(false);
  //       return true;
  //     } else {
  //       final errorMessage =
  //           response.message['message'] ?? 'Otp Verification Failed';
  //       customErrorMessage(message: errorMessage);
  //       _setLoading(false);
  //       return false;
  //     }
  //   } catch (error) {
  //     customErrorMessage(message: error.toString());
  //     _setLoading(false);
  //     return false;
  //   }
  // }
  //
  // void _setLoading(bool value) {
  //   isLoading = value;
  //   update();
  // }
  //
  // @override
  // void onInit() {
  //   super.onInit();
  //   Get.find<TimerController>().startTimer();
  //   identity = Get.arguments['identity'] as String;
  // }
  //
  // @override
  // void dispose() {
  //   Get.find<TimerController>().timer.cancel();
  //   super.dispose();
  // }
}