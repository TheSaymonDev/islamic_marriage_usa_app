// import 'package:get/get.dart';
//
//
// class ResendOTPController extends GetxController{
//   Future<void> resendOTP({required IdentityVerificationModel resendOtpData}) async {
//     if (!await ConnectivityService.isConnected()) {
//       customErrorMessage(message: 'Please check your internet connection');
//       return;
//     }
//     try {
//       final response = await ApiService().post(
//           url: AppUrls.resendOTPUrl, data: resendOtpData);
//       if (response.success) {
//         customSuccessMessage(message: 'Resend OTP Your Mobile');
//         // Reset timer duration
//         Get.find<TimerController>().duration = const Duration(minutes: 2, seconds: 30);
//         // Restart the timer
//         Get.find<TimerController>().startTimer();
//       } else {
//         final errorMessage = response.message['message'] ?? 'OTP Sent Failed';
//         customErrorMessage(message: errorMessage);
//       }
//     } catch (error) {
//       customErrorMessage(message: error.toString());
//     }
//   }
// }