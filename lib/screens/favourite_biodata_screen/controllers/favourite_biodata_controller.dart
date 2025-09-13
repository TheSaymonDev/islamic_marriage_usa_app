import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/models/favourite_biodata_model.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/screens/profile_screen/controllers/current_user_controller.dart';
import 'package:islamic_marriage_usa_app/screens/profile_screen/models/add_to_favourite_biodata_model.dart';

class FavouriteBiodataController extends GetxController {
  bool isLoading = false;
  FavouriteBiodataModel? favouriteBiodata;

  List<String> favouriteIds = [];

  final CurrentUserController _currentUserController =
      Get.find<CurrentUserController>();

  @override
  void onInit() {
    super.onInit();
    _fetchFavouriteBiodata();
  }

  Future<void> addToFavouriteList({
    required String biodataId,
  }) async {
    try {
      final response = await ApiService().post(
        url: AppUrls.addToFavouriteUrl,
        headers: AppUrls.getHeaderWithToken,
        data: AddToFavouriteBiodataModel(
          biodataId: biodataId,
        ),
      );

      if (response.success) {
        // Add to local list
        if (!favouriteIds.contains(biodataId)) {
          favouriteIds.add(biodataId);
        }
        await _fetchFavouriteBiodata();
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
        // Remove from local list
        favouriteIds.remove(biodataId);
        // 🔥 Remove from favouriteBiodata.data list (UI তে যাতে সাথে সাথে reflect করে)
        favouriteBiodata?.data?.removeWhere(
          (item) => item.biodata?.sId == biodataId,
        );
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

  Future<void> toggleFavourite(String biodataId) async {
    if (favouriteIds.contains(biodataId)) {
      await removeFromFavouriteList(biodataId: biodataId);
    } else {
      await addToFavouriteList(biodataId: biodataId);
    }
  }

  bool isFavourite(String biodataId) => favouriteIds.contains(biodataId);

  Future<void> _fetchFavouriteBiodata() async {
    try {
      _setLoading(true);
      final response = await ApiService().get(
        url: AppUrls.getFavouriteBiodataUrl,
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success) {
        favouriteBiodata = FavouriteBiodataModel.fromJson(response.data);
        // Extract all favourite biodata IDs
        favouriteIds.clear();
        if (favouriteBiodata?.data != null) {
          for (var item in favouriteBiodata!.data!) {
            if (item.biodata?.sId != null) {
              favouriteIds.add(item.biodata!.sId!);
            }
          }
        }
      } else {
        final errorMessage =
            response.message['message'] ?? 'Biodata remove failed';

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
