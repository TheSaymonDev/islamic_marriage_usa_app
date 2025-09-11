import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_extensions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_logger.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/models/step7_marriage_related_info_request.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/models/step7_marriage_related_info_response.dart';

class Step7MarriageRelatedInfoController extends GetxController {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  final marriageThoughtsController = TextEditingController();

  String? guardiansAgreement;

  bool showOptionalFields = false;

  final agreementOptions = ['Yes', 'No'];

  Step7MarriageRelatedInfoResponse? marriageRelatedInfoData;

  @override
  void onInit() {
    super.onInit();
    fetchMarriageRelatedInfo();
  }

  @override
  void onClose() {
    marriageThoughtsController.dispose();
    super.onClose();
  }

  Future<bool> upsertMarriageRelatedInfo() async {
    _setLoading(true);

    try {
      final data = Step7MarriageRelatedInfoRequest(
        step: 7,
        data: Data(
          guardianApproval: guardiansAgreement!,
          marriageThoughts: marriageThoughtsController.text,
        ),
      );
      AppLogger.logInfo('Request Body: ${data.toJson()}');
      final response = await ApiService().post(
          url: AppUrls.upsertBiodataUrl,
          data: data,
          headers: AppUrls.getHeaderWithToken);

      if (response.success) {
        AppConstFunctions.customSuccessMessage(
            message: 'Marriage Related Info Saved Successfully');
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Marriage Related Info Save Failed';
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

  Future<void> fetchMarriageRelatedInfo() async {
    try {
      final response = await ApiService().get(
        url: '${AppUrls.getBiodataByStepUrl}/7',
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success && response.data != null) {
        marriageRelatedInfoData =
            Step7MarriageRelatedInfoResponse.fromJson(response.data!);
        _populateFormFields(marriageRelatedInfoData!);
      } else {
        final errorMessage =
            response.message['message'] ?? 'Marriage Related Info Read Failed';
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

  void _populateFormFields(
      Step7MarriageRelatedInfoResponse marriageRelatedInfoData) {
    final data = marriageRelatedInfoData.data;
    if (data != null) {
      // Required field
      guardiansAgreement = data.guardianApproval;

      // Optional field
      marriageThoughtsController.text = data.marriageThoughts ?? '';

      // Show optional fields section if optional field has data
      if (data.marriageThoughts.hasValue) {
        showOptionalFields = true;
      }

      update();
    }
  }

  void updateGuardiansAgreement(String? value) {
    guardiansAgreement = value;
    update();
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
