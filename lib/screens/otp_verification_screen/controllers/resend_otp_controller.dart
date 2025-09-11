import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/screens/otp_verification_screen/controllers/timer_controller.dart';
import 'package:islamic_marriage_usa_app/screens/registration_screen/models/registration_model.dart';

class ResendOtpController extends GetxController {
  bool isLoading = false;

  Future<void> resendOTP({required RegistrationModel resendOtpData}) async {
    isLoading = true;
    update();

    try {
      final response = await ApiService()
          .post(url: AppUrls.registrationUrl, data: resendOtpData);

      if (response.success) {
        AppConstFunctions.customSuccessMessage(message: 'OTP resent to your email');

        // Timer restart করুন
        final timerController = Get.find<TimerController>();
        timerController.startTimer();
      } else {
        final errorMessage = response.message['message'] ?? 'Resend OTP failed';
        AppConstFunctions.customErrorMessage(message: errorMessage);
      }
    } catch (error) {
      AppConstFunctions.customErrorMessage(message: error.toString());
    } finally {
      isLoading = false;
      update();
    }
  }
}