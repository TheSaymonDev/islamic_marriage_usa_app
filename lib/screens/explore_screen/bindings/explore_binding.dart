import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/screens/explore_screen/controllers/all_biodata_controller.dart';
import 'package:islamic_marriage_usa_app/screens/explore_screen/controllers/toggle_favourite_biodata_controller.dart';

class ExploreBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AllBiodataController());
    Get.put(ToggleFavouriteBiodataController());
  }
}
