import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/screens/reset_password_screen/controllers/reset_password_controller.dart';

class ResetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ResetPasswordController(),
    );
  }
}
