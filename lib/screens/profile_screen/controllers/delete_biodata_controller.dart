import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';

class DeleteBiodataController extends GetxController {
  bool isLoading = false;
  Future<bool> deleteBiodata() async {
    _setLoading(true);

    try {
      final response = await ApiService().delete(
        url: AppUrls.deleteBiodataUrl,
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success) {
        AppConstFunctions.customSuccessMessage(
            message: 'Biodata deleted successfully');
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Biodata deletion failed';
        AppConstFunctions.customErrorMessage(message: errorMessage);
        return false;
      }
    } catch (error) {
      AppConstFunctions.customErrorMessage(message: error.toString());
      return false;
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}
