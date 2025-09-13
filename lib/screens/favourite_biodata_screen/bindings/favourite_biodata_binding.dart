import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/screens/favourite_biodata_screen/controllers/favourite_biodata_controller.dart';

class FavouriteBiodataBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => FavouriteBiodataController(),
    );
  }
}
