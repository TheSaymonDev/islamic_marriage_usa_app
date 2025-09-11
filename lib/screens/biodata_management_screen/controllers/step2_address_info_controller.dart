import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_extensions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_logger.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/models/step2_address_info_request.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/models/step2_address_info_response.dart';

class Step2AddressInfoController extends GetxController {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  final byBornAddressController = TextEditingController();
  final currentAddressController = TextEditingController();
  final growUpAddressController = TextEditingController();
  final settleAddressController = TextEditingController();

  bool showOptionalFields = false;

  Step2AddressInfoResponse? addressInfoData;

  @override
  void onInit() {
    super.onInit();
    fetchAddressInfo();
  }

  @override
  void onClose() {
    byBornAddressController.dispose();
    currentAddressController.dispose();
    growUpAddressController.dispose();
    settleAddressController.dispose();
    super.onClose();
  }

  Future<bool> upsertAddressInfo() async {
    _setLoading(true);

    try {
      final data = Step2AddressInfoRequest(
          step: 2,
          data: Data(
            byBornAddress: byBornAddressController.text,
            currentAddress: currentAddressController.text,
            grewUpLocation: growUpAddressController.text,
            willingToSettle: settleAddressController.text,
          ));
      AppLogger.logInfo('Request Body: ${data.toJson()}');
      final response = await ApiService().post(
          url: AppUrls.upsertBiodataUrl,
          data: data,
          headers: AppUrls.getHeaderWithToken);

      if (response.success) {
        AppConstFunctions.customSuccessMessage(
            message: 'Address Info Saved Successfully');
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Address Info Save Failed';
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

  Future<void> fetchAddressInfo() async {
    try {
      final response = await ApiService().get(
        url: '${AppUrls.getBiodataByStepUrl}/2',
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success && response.data != null) {
        addressInfoData = Step2AddressInfoResponse.fromJson(response.data!);
        _populateFormFields(addressInfoData!);
      } else {
        final errorMessage =
            response.message['message'] ?? 'Address Info Read Failed';
        if (errorMessage != 'Biodata not found') {
          AppConstFunctions.customErrorMessage(message: errorMessage);
        }
      }
    } catch (error) {
      AppConstFunctions.customErrorMessage(
          message: 'Error: ${error.toString()}');
    }
    update();
  }

  void _populateFormFields(Step2AddressInfoResponse addressInfoData) {
    final data = addressInfoData.data;
    if (data != null) {
      // Required field
      byBornAddressController.text = data.byBornAddress ?? '';

      // Optional fields - only populate if they have data
      currentAddressController.text = data.currentAddress ?? '';
      growUpAddressController.text = data.grewUpLocation ?? '';
      settleAddressController.text = data.willingToSettle ?? '';

      // Show optional fields section if any optional field has data
      if (data.currentAddress.hasValue ||
          data.grewUpLocation.hasValue ||
          data.willingToSettle.hasValue) {
        showOptionalFields = true;
      }

      update();
    }
  }

  void toggleOptionalFields(bool value) {
    showOptionalFields = value;
    update();
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}
