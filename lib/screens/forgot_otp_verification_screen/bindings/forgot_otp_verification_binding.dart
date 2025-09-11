import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/screens/forgot_otp_verification_screen/controllers/forgot_otp_verification_controller.dart';
import 'package:islamic_marriage_usa_app/screens/forgot_otp_verification_screen/controllers/forgot_timer_controller.dart';
import 'package:islamic_marriage_usa_app/screens/forgot_otp_verification_screen/controllers/resend_forgot_otp_controller.dart';

class ForgotOtpVerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ForgotTimerController(),
    );
    Get.lazyPut(
      () => ForgotOtpVerificationController(),
    );
    Get.lazyPut(
      () => ResendForgotOtpController(),
    );
  }
}
