import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/data/services/connectivity_service.dart';


class LogInController extends GetxController {
  bool isLoading = false;
  bool isObscure = true;
  bool isChecked = false;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Future<String> signInUser({required SignInModel signInData}) async {
  //   if (!await ConnectivityService.isConnected()) {
  //     customErrorMessage(message: 'Please check your internet connection');
  //     return 'No internet connection';
  //   }
  //   _setLoading(true);
  //   try {
  //     final response = await ApiService().post(url: AppUrls.signInUrl, data: signInData);
  //     _setLoading(false);
  //     if (response.success) {
  //       final message = response.data['message'];
  //       if (message == 'Login Successful') {
  //         customSuccessMessage(message: 'Successfully Log In');
  //         SharedPreferencesService().saveUserData(response.data);
  //       } else if (message == 'User not verified') {
  //         customErrorMessage(message: message);
  //       }
  //       return message;
  //     } else {
  //       final errorMessage = response.message['message'] ?? 'Log In Failed';
  //       customErrorMessage(message: errorMessage);
  //       return errorMessage;
  //     }
  //   } catch (error) {
  //     _setLoading(false);
  //     customErrorMessage(message: error.toString());
  //     return error.toString();
  //   }
  // }
  //
  // Future<void> launchInBrowser(Uri url) async {
  //   if (!await launchUrl(
  //     url,
  //     mode: LaunchMode.externalApplication,
  //   )) {
  //     throw Exception('Could not launch $url');
  //   }
  // }

  void toggleObscure() {
    isObscure = !isObscure;
    update();
  }

  void toggleIsChecked(bool newValue) {
    isChecked = newValue;
    update();
  }

  // void _setLoading(bool value) {
  //   isLoading = value;
  //   update();
  // }
}
