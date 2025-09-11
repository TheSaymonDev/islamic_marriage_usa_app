import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/screens/profile_screen/controllers/current_user_controller.dart';
import 'package:islamic_marriage_usa_app/screens/profile_screen/controllers/delete_biodata_controller.dart';
import 'package:islamic_marriage_usa_app/screens/profile_screen/controllers/favourite_biodata_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FavouriteBiodataController());
    Get.put(CurrentUserController());
    Get.lazyPut(
      () => DeleteBiodataController(),
    );
  }
}
