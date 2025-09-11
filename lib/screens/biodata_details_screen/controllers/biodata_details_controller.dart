import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/screens/explore_screen/models/all_biodata_model.dart';

class BiodataDetailsController extends GetxController{

  late Biodatas biodata;

  @override
  void onInit() {
    super.onInit();
    biodata = Get.arguments['biodata'] as Biodatas;
  }
}