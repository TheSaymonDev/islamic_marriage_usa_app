import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_extensions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_logger.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/models/step6_occupational_info_request.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/models/step6_occupational_info_response.dart';

class Step6OccupationalInfoController extends GetxController {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  final professionDescriptionController = TextEditingController();
  final monthlyIncomeController = TextEditingController();

  String? selectedOccupation;

  bool showOptionalFields = false;

  final occupationOptions = [
    'Imam',
    'Teacher',
    'Engineer',
    'Doctor',
    'Govt. Job',
    'Private Job',
    'Businessman',
    'Freelancer',
    'Student',
    'Others',
    'No Profession'
  ];

  Step6OccupationalInfoResponse? occupationalInfoData;

  @override
  void onInit() {
    super.onInit();
    fetchOccupationalInfo();
  }

  @override
  void onClose() {
    professionDescriptionController.dispose();
    monthlyIncomeController.dispose();
    super.onClose();
  }

  Future<bool> upsertOccupationalInfo() async {
    _setLoading(true);

    try {
      final data = Step6OccupationalInfoRequest(
        step: 6,
        data: Data(
          monthlyIncome: monthlyIncomeController.text,
          occupation: selectedOccupation!,
          professionDescription: professionDescriptionController.text,
        ),
      );
      AppLogger.logInfo('Request Body: ${data.toJson()}');
      final response = await ApiService().post(
          url: AppUrls.upsertBiodataUrl,
          data: data,
          headers: AppUrls.getHeaderWithToken);

      if (response.success) {
        AppConstFunctions.customSuccessMessage(
            message: 'Occupational Info Saved Successfully');
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Occupational Info Save Failed';
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

  Future<void> fetchOccupationalInfo() async {
    try {
      final response = await ApiService().get(
        url: '${AppUrls.getBiodataByStepUrl}/6',
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success && response.data != null) {
        occupationalInfoData =
            Step6OccupationalInfoResponse.fromJson(response.data!);
        _populateFormFields(occupationalInfoData!);
      } else {
        final errorMessage =
            response.message['message'] ?? 'Occupational Info Read Failed';
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

  void _populateFormFields(Step6OccupationalInfoResponse occupationalInfoData) {
    final data = occupationalInfoData.data;
    if (data != null) {
      // Required field
      selectedOccupation = data.occupation;

      // Optional fields
      professionDescriptionController.text = data.professionDescription ?? '';
      monthlyIncomeController.text = data.monthlyIncome?.toString() ?? '';

      // Show optional fields section if any optional field has data
      if (data.professionDescription.hasValue || data.monthlyIncome.hasValue) {
        showOptionalFields = true;
      }

      update();
    }
  }

  void updateSelectedOccupation(String? value) {
    selectedOccupation = value;
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
