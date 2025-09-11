import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/screens/explore_screen/models/all_biodata_model.dart';

class AllBiodataController extends GetxController {
  bool isLoading = false;
  AllBiodataModel? allBiodata;

  @override
  void onInit() {
    super.onInit();
    _fetchMyBiodata();
  }

  Future<void> _fetchMyBiodata() async {
    _setLoading(true);

    try {
      final response = await ApiService().get(
        url: AppUrls.getAllBiodataUrl,
      );

      if (response.success && response.data != null) {
        allBiodata = AllBiodataModel.fromJson(response.data);
      } else {
        final errorMessage =
            response.message['message'] ?? 'All biodata read failed';
        AppConstFunctions.customErrorMessage(message: errorMessage);
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
