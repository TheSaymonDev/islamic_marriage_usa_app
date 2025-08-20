import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/screens/home_screen/controllers/bottom_nav_controller.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavController());
  }
}