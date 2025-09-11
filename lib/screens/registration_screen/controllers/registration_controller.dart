import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/screens/registration_screen/models/registration_model.dart';

class RegistrationController extends GetxController {
  bool isPObscure = true;
  bool isCPObscure = true;
  bool isLoading = false;
  bool isChecked = false;
  int currentGender = 0;
  String? identity;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<bool> registerUser({required RegistrationModel registrationData}) async {

    _setLoading(true);

    try {
      final response =
      await ApiService().post(url: AppUrls.registrationUrl, data: registrationData);

      if (response.success) {
        AppConstFunctions.customSuccessMessage(message: 'Registration successful, Please verify OTP');
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'Registration failed';
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

  void togglePObscure() {
    isPObscure = !isPObscure;
    update();
  }

  void toggleCPObscure() {
    isCPObscure = !isCPObscure;
    update();
  }

  void toggleIsChecked(newValue) {
    isChecked = newValue;
    update();
  }

  void selectGender(int index) {
    currentGender = index;
    update();
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }

  void clearFields(){
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
