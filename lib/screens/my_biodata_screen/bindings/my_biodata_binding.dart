import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/screens/my_biodata_screen/controllers/my_biodata_controller.dart';

class MyBiodataBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MyBiodataController(),
    );
  }
}
