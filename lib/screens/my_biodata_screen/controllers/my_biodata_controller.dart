import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/screens/my_biodata_screen/models/my_biodata_model.dart';

class MyBiodataController extends GetxController {
  bool isLoading = false;
  MyBiodataModel? myBiodata;

  @override
  void onInit() {
    super.onInit();
    _fetchMyBiodata();
  }

  Future<void> _fetchMyBiodata() async {
    _setLoading(true);

    try {
      final response = await ApiService().get(
        url: AppUrls.getMyBiodataUrl,
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success && response.data != null) {
        myBiodata = MyBiodataModel.fromJson(response.data);
      } else {
        final errorMessage =
            response.message['message'] ?? 'My biodata read failed';
        if (errorMessage != 'Biodata not found') {
          AppConstFunctions.customErrorMessage(message: errorMessage);
        }
      }
    } catch (error) {
      AppConstFunctions.customErrorMessage(
          message: 'Error: ${error.toString()}');
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}
