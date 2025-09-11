import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/data/services/shared_preference_service.dart';
import 'package:islamic_marriage_usa_app/screens/log_in_screen/models/log_in_model.dart';

class LogInController extends GetxController {
  bool isLoading = false;
  bool isObscure = true;
  bool isChecked = false;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  Future<bool> logInUser({required LogInModel logInData}) async {

    _setLoading(true);

    try {
      final response =
      await ApiService().post(url: AppUrls.logInUrl, data: logInData);

      if (response.success) {
        AppConstFunctions.customSuccessMessage(message: 'Login successful');
        SharedPreferencesService().saveToken(response.data['data']['token']);
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'Login failed';
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

  void toggleObscure() {
    isObscure = !isObscure;
    update();
  }

  void toggleIsChecked(bool newValue) {
    isChecked = newValue;
    update();
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }

  void clearFields(){
    emailController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

}
