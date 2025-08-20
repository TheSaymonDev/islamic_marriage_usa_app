import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/controllers/language_controller.dart';
import 'package:islamic_marriage_usa_app/core/controllers/theme_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(LanguageController());
  }
}
