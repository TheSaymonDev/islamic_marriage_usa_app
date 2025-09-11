import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/screens/email_verification_screen/models/email_verification_model.dart';
import 'package:islamic_marriage_usa_app/screens/forgot_otp_verification_screen/controllers/forgot_timer_controller.dart';

class ResendForgotOtpController extends GetxController {
  bool isLoading = false;

  Future<void> resendForgotOtp({required EmailVerificationModel resendForgotOtpData}) async {
    isLoading = true;
    update();

    try {
      final response = await ApiService()
          .post(url: AppUrls.emailVerificationUrl, data: resendForgotOtpData);

      if (response.success) {
        AppConstFunctions.customSuccessMessage(message: 'OTP resend to your email');

        // Timer restart করুন
        final forgotTimerController = Get.find<ForgotTimerController>();
        forgotTimerController.startTimer();
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