import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_extensions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_logger.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/models/step3_edu_qualification_info_request.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/models/step3_edu_qualification_info_response.dart';

class Step3EduQualificationController extends GetxController {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  final highestQualificationController = TextEditingController();
  final passingYearController = TextEditingController();
  final resultController = TextEditingController();
  final institutionNameController = TextEditingController();
  final otherQualificationsController = TextEditingController();

  bool showOptionalFields = false;

  Step3EduQualificationInfoResponse? eduQualificationInfoData;

  @override
  void onInit() {
    super.onInit();
    fetchEduQualificationInfo();
  }

  @override
  void onClose() {
    highestQualificationController.dispose();
    passingYearController.dispose();
    resultController.dispose();
    institutionNameController.dispose();
    otherQualificationsController.dispose();
    super.onClose();
  }

  Future<bool> upsertEduQualificationInfo() async {
    _setLoading(true);

    try {
      final data = Step3EduQualificationInfoRequest(
        step: 3,
        data: Data(
          highestEducation: highestQualificationController.text,
          passYear: passingYearController.text,
          result: resultController.text,
          institutionName: institutionNameController.text,
          otherQualifications: otherQualificationsController.text,
        ),
      );
      AppLogger.logInfo('Request Body: ${data.toJson()}');
      final response = await ApiService().post(
          url: AppUrls.upsertBiodataUrl,
          data: data,
          headers: AppUrls.getHeaderWithToken);

      if (response.success) {
        AppConstFunctions.customSuccessMessage(
            message: 'Education Qualification Info Saved Successfully');
        return true;
      } else {
        final errorMessage = response.message['message'] ??
            'Education Qualification Info Save Failed';
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

  Future<void> fetchEduQualificationInfo() async {
    try {
      final response = await ApiService().get(
        url: '${AppUrls.getBiodataByStepUrl}/3',
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success && response.data != null) {
        eduQualificationInfoData =
            Step3EduQualificationInfoResponse.fromJson(response.data!);
        _populateFormFields(eduQualificationInfoData!);
      } else {
        final errorMessage =
            response.message['message'] ?? 'Education Qualification Info Read Failed';
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
      Step3EduQualificationInfoResponse eduQualificationInfoData) {
    final data = eduQualificationInfoData.data;
    if (data != null) {
      // Required field
      highestQualificationController.text = data.highestEducation ?? '';

      // Optional fields - only populate if they have data
      passingYearController.text = data.passYear?.toString() ?? '';
      resultController.text = data.result ?? '';
      institutionNameController.text = data.institutionName ?? '';
      otherQualificationsController.text = data.otherQualifications ?? '';

      // Show optional fields section if any optional field has data
      if (data.passYear.hasValue ||
          data.result.hasValue ||
          data.institutionName.hasValue ||
          data.otherQualifications.hasValue) {
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
