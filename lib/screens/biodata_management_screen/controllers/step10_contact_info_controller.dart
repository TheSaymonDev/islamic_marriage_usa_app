import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_logger.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/models/step10_contact_info_request.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/models/step10_contact_info_response.dart';

class Step10ContactInfoController extends GetxController {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final guardianMobileController = TextEditingController();
  final relationshipController = TextEditingController();
  final emailController = TextEditingController();

  Step10ContactInfoResponse? contactInfoData;

  @override
  void onInit() {
    super.onInit();
    fetchContactInfo();
  }

  @override
  void onClose() {
    fullNameController.dispose();
    guardianMobileController.dispose();
    relationshipController.dispose();
    emailController.dispose();
    super.onClose();
  }

  Future<String> upsertContactInfo() async {
    _setLoading(true);

    try {
      final data = Step10ContactInfoRequest(
        step: 10,
        data: Data(
          contactEmail: emailController.text,
          fullName: fullNameController.text,
          guardianMobile: guardianMobileController.text,
          guardianRelation: relationshipController.text,
        ),
      );
      AppLogger.logInfo('Request Body: ${data.toJson()}');
      final response = await ApiService().post(
          url: AppUrls.upsertBiodataUrl,
          data: data,
          headers: AppUrls.getHeaderWithToken);

      if (response.success) {
        final isCompleted = response.data['data']['isCompleted'];
        AppConstFunctions.customSuccessMessage(
            message: 'Contact Information Saved Successfully');
        return isCompleted == true ? "complete" : "incomplete";
      } else {
        final errorMessage =
            response.message['message'] ?? 'Contact Information Save Failed';
        AppConstFunctions.customErrorMessage(message: errorMessage);
        return "incomplete";
      }
    } catch (error) {
      AppConstFunctions.customErrorMessage(message: error.toString());
      return "incomplete";
    } finally {
      _setLoading(false);
    }
  }

  Future<void> fetchContactInfo() async {
    try {
      final response = await ApiService().get(
        url: '${AppUrls.getBiodataByStepUrl}/10',
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success && response.data != null) {
        contactInfoData = Step10ContactInfoResponse.fromJson(response.data!);
        _populateFormFields(contactInfoData!);
      } else {
        final errorMessage =
            response.message['message'] ?? 'Contact Information Read Failed';
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

  void _populateFormFields(Step10ContactInfoResponse contactInfoData) {
    // Populate the form fields with the fetched data
    if (contactInfoData.data != null) {
      final data = contactInfoData.data!;

      // Set values to text controllers
      fullNameController.text = data.fullName ?? '';
      guardianMobileController.text = data.guardianMobile ?? '';
      relationshipController.text = data.guardianRelation ?? '';
      emailController.text = data.contactEmail ?? '';
    }
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}
