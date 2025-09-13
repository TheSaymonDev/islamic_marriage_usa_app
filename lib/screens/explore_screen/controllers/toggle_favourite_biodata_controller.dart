import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/screens/profile_screen/controllers/current_user_controller.dart';

class ToggleFavouriteBiodataController extends GetxController {
  final CurrentUserController _currentUserController =
      Get.find<CurrentUserController>();

  // Check if a biodata is favourite
  bool isFavourite(String biodataId) {
    return _currentUserController.userData?.data?.favoriteBiodatas
            ?.contains(biodataId) ??
        false;
  }

  // Toggle favourite status
  Future<void> toggleFavourite(String biodataId) async {
    if (isFavourite(biodataId)) {
      await removeFromFavouriteList(biodataId: biodataId);
    } else {
      await addToFavouriteList(biodataId: biodataId);
    }
  }

  Future<void> addToFavouriteList({
    required String biodataId,
  }) async {
    try {
      final response = await ApiService().postWithOutData(
        url: '${AppUrls.addToFavouriteUrl}/$biodataId',
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success) {
        // Refresh current user data to get updated favorites
        await _currentUserController.fetchCurrentUserData();
        AppConstFunctions.customSuccessMessage(
            message: 'Successfully added to favourite');
      } else {
        final errorMessage =
            response.message['message'] ?? 'Failed to add to favourite';
        AppConstFunctions.customErrorMessage(message: errorMessage);
      }
    } catch (error) {
      AppConstFunctions.customErrorMessage(
          message: 'Error: ${error.toString()}');
    }
    update();
  }

  Future<void> removeFromFavouriteList({
    required String biodataId,
  }) async {
    try {
      final response = await ApiService().delete(
        url: '${AppUrls.removeFromFavourite}/$biodataId',
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success) {
        // Refresh current user data to get updated favorites
        await _currentUserController.fetchCurrentUserData();
        AppConstFunctions.customSuccessMessage(
            message: 'Successfully removed from favourite');
      } else {
        final errorMessage =
            response.message['message'] ?? 'Failed to remove from favourite';
        AppConstFunctions.customErrorMessage(message: errorMessage);
      }
    } catch (error) {
      AppConstFunctions.customErrorMessage(
          message: 'Error: ${error.toString()}');
    }
    update();
  }
}
