import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {
  bool isLoading = false;
  int? userId;
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // Future<bool> identityVerify({
  //   required IdentityVerificationModel identityVerificationData,
  // }) async {
  //   if (!await ConnectivityService.isConnected()) {
  //     customErrorMessage(message: 'Please check your internet connection');
  //     return false;
  //   }
  //   _setLoading(true);
  //   try {
  //     final response = await ApiService()
  //         .post(url: AppUrls.identityUrl, data: identityVerificationData);
  //     if (response.success) {
  //       customSuccessMessage(message: 'Sent OTP Your Mobile');
  //       userId = response.data['data']['user_id'];
  //       _setLoading(false);
  //       return true;
  //     } else {
  //       final errorMessage = response.message['message'] ?? 'OTP Sent Failed';
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

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}
