import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_details_screen/controllers/biodata_details_controller.dart';

class BiodataDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => BiodataDetailsController(),
    );
  }
}
