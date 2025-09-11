import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_extensions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_logger.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/models/step4_family_info_request.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/models/step4_family_info_response.dart';

class Step4FamilyInfoController extends GetxController {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  final fatherNameController = TextEditingController();
  final motherNameController = TextEditingController();
  final fatherProfessionController = TextEditingController();
  final motherProfessionController = TextEditingController();
  final brothersInfoController = TextEditingController();
  final sistersInfoController = TextEditingController();
  final unclesProfessionController = TextEditingController();
  final financialSituationController = TextEditingController();
  final religiousConditionController = TextEditingController();

  String? isFatherAlive;
  String? isMotherAlive;
  String? brothersCount;
  String? sistersCount;

  bool showOptionalFields = false;

  final aliveOptions = ['Yes, alive', 'Not, alive'];
  final brotherCountOptions = [
    'No Brother',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];
  final sisterCountOptions = [
    'No Sister',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];

  Step4FamilyInfoResponse? familyInfoData;

  @override
  void onInit() {
    super.onInit();
    fetchFamilyInfo();
  }

  @override
  void onClose() {
    fatherNameController.dispose();
    motherNameController.dispose();
    fatherProfessionController.dispose();
    motherProfessionController.dispose();
    brothersInfoController.dispose();
    sistersInfoController.dispose();
    unclesProfessionController.dispose();
    financialSituationController.dispose();
    religiousConditionController.dispose();
    super.onClose();
  }

  Future<bool> upsertFamilyInfo() async {
    _setLoading(true);

    try {
      final data = Step4FamilyInfoRequest(
        step: 4,
        data: Data(
          fathersName: fatherNameController.text,
          mothersName: motherNameController.text,
          brothersCount: brothersCount ?? '',
          brothersInfo: brothersInfoController.text,
          fatherOccupation: fatherProfessionController.text,
          familyFinancial: financialSituationController.text,
          isFatherAlive: isFatherAlive ?? '',
          isMotherAlive: isMotherAlive ?? '',
          motherOccupation: motherProfessionController.text,
          familyReligion: religiousConditionController.text,
          sistersCount: sistersCount ?? '',
          sistersInfo: sistersInfoController.text,
          uncleProfession: unclesProfessionController.text,
        ),
      );
      AppLogger.logInfo('Request Body: ${data.toJson()}');
      final response = await ApiService().post(
          url: AppUrls.upsertBiodataUrl,
          data: data,
          headers: AppUrls.getHeaderWithToken);

      if (response.success) {
        AppConstFunctions.customSuccessMessage(
            message: 'Family Info Saved Successfully');
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Family Info Save Failed';
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

  Future<void> fetchFamilyInfo() async {
    try {
      final response = await ApiService().get(
        url: '${AppUrls.getBiodataByStepUrl}/4',
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success && response.data != null) {
        familyInfoData = Step4FamilyInfoResponse.fromJson(response.data!);
        _populateFormFields(familyInfoData!);
      } else {
        final errorMessage =
            response.message['message'] ?? 'Family Info Read Failed';
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

  void _populateFormFields(Step4FamilyInfoResponse familyInfoData) {
    final data = familyInfoData.data;
    if (data != null) {
      // Required fields
      fatherNameController.text = data.fathersName ?? '';
      motherNameController.text = data.mothersName ?? '';

      // Optional fields
      isFatherAlive = data.isFatherAlive;
      fatherProfessionController.text = data.fatherOccupation ?? '';
      isMotherAlive = data.isMotherAlive;
      motherProfessionController.text = data.motherOccupation ?? '';
      brothersCount = data.brothersCount;
      brothersInfoController.text = data.brothersInfo ?? '';
      sistersCount = data.sistersCount;
      sistersInfoController.text = data.sistersInfo ?? '';
      unclesProfessionController.text = data.uncleProfession ?? '';
      financialSituationController.text = data.familyFinancial ?? '';
      religiousConditionController.text = data.familyReligion ?? '';

      // Show optional fields section if any optional field has data
      if (data.isFatherAlive.hasValue ||
          data.fatherOccupation.hasValue ||
          data.isMotherAlive.hasValue ||
          data.motherOccupation.hasValue ||
          data.brothersCount.hasValue ||
          data.brothersInfo.hasValue ||
          data.sistersCount.hasValue ||
          data.sistersInfo.hasValue ||
          data.uncleProfession.hasValue ||
          data.familyFinancial.hasValue ||
          data.familyReligion.hasValue) {
        showOptionalFields = true;
      }

      update();
    }
  }

  void updateIsFatherAlive(String? value) {
    isFatherAlive = value;
    update();
  }

  void updateIsMotherAlive(String? value) {
    isMotherAlive = value;
    update();
  }

  void updateBrothersCount(String? value) {
    brothersCount = value;
    update();
  }

  void updateSistersCount(String? value) {
    sistersCount = value;
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
