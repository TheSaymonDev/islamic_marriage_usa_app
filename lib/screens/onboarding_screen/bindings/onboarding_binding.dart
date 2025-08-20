import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/screens/onboarding_screen/controllers/slider_controller.dart';

class OnboardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SliderController());
  }
}
