import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/data/models/biodata_model.dart';

class BiodataDetailsController extends GetxController{

  late BiodataModel biodata;

  @override
  void onInit() {
    super.onInit();
    biodata = Get.arguments['biodata'] as BiodataModel;
  }
}