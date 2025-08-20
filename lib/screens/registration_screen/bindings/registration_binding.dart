import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/screens/registration_screen/controllers/registration_controller.dart';

class RegistrationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RegistrationController(),
    );
  }
}
