import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/screens/no_internet_screen/controllers/connection_controller.dart';

class NoInternetBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ConnectionController());
  }
}