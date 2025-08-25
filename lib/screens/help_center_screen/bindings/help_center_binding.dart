import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/screens/help_center_screen/controllers/contact_us_controller.dart';

class HelpCenterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ContactUsController(),
    );
  }
}
