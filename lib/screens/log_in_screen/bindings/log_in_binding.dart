import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/screens/log_in_screen/controllers/log_in_controller.dart';

class LogInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LogInController(),
    );
  }
}
