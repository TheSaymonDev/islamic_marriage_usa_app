import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_extensions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_logger.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/models/step5_personal_info_request.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/models/step5_personal_info_response.dart';

class Step5PersonalInfoController extends GetxController {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  final legalityController = TextEditingController();
  final ethnicityController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final clothesTypeController = TextEditingController();
  final prayerSinceController = TextEditingController();
  final missedPrayersController = TextEditingController();
  final mahramComplianceController = TextEditingController();
  final quranRecitationController = TextEditingController();
  final mediaHabitsController = TextEditingController();
  final healthConditionController = TextEditingController();
  final religiousWorkController = TextEditingController();
  final shrineBeliefsController = TextEditingController();
  final islamicBooksController = TextEditingController();
  final islamicScholarsController = TextEditingController();
  final hobbiesController = TextEditingController();
  final specialKnowledgeController = TextEditingController();
  final aboutYourselfController = TextEditingController();

  String? selectedFiqh;

  bool showOptionalFields = false;

  final fiqhOptions = [
    'Hanafi',
    'Maliki',
    'Shafi\'i',
    'Hanbali',
    'Ahle Hadis/Salafi'
  ];

  Step5PersonalInfoResponse? personalInfoData;

  @override
  void onInit() {
    super.onInit();
    fetchPersonalInfo();
  }

  @override
  void onClose() {
    legalityController.dispose();
    ethnicityController.dispose();
    mobileNumberController.dispose();
    clothesTypeController.dispose();
    prayerSinceController.dispose();
    missedPrayersController.dispose();
    mahramComplianceController.dispose();
    quranRecitationController.dispose();
    mediaHabitsController.dispose();
    healthConditionController.dispose();
    religiousWorkController.dispose();
    shrineBeliefsController.dispose();
    islamicBooksController.dispose();
    islamicScholarsController.dispose();
    hobbiesController.dispose();
    specialKnowledgeController.dispose();
    aboutYourselfController.dispose();
    super.onClose();
  }

  Future<bool> upsertPersonalInfo() async {
    _setLoading(true);

    try {
      final data = Step5PersonalInfoRequest(
        step: 5,
        data: Data(
          selfDescription: aboutYourselfController.text,
          clothesOutside: clothesTypeController.text,
          ethnicity: ethnicityController.text,
          disease: healthConditionController.text,
          hobbies: hobbiesController.text,
          islamicBooks: islamicBooksController.text,
          scholars: islamicScholarsController.text,
          legality: legalityController.text,
          mahramCompliance: mahramComplianceController.text,
          watchMedia: mediaHabitsController.text,
          weeklyMissedPrayers: missedPrayersController.text,
          mobile: mobileNumberController.text,
          prayFiveTimesSince: prayerSinceController.text,
          reciteQuran: quranRecitationController.text,
          deenWork: religiousWorkController.text,
          fiqh: selectedFiqh,
          shrineBelief: shrineBeliefsController.text,
          specialKnowledge: specialKnowledgeController.text,
        ),
      );
      AppLogger.logInfo('Request Body: ${data.toJson()}');
      final response = await ApiService().post(
          url: AppUrls.upsertBiodataUrl,
          data: data,
          headers: AppUrls.getHeaderWithToken);

      if (response.success) {
        AppConstFunctions.customSuccessMessage(
            message: 'Personal Info Saved Successfully');
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Personal Info Save Failed';
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

  Future<void> fetchPersonalInfo() async {
    try {
      final response = await ApiService().get(
        url: '${AppUrls.getBiodataByStepUrl}/5',
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success && response.data != null) {
        personalInfoData = Step5PersonalInfoResponse.fromJson(response.data!);
        _populateFormFields(personalInfoData!);
      } else {
        final errorMessage =
            response.message['message'] ?? 'Personal Info Read Failed';
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

  void _populateFormFields(Step5PersonalInfoResponse personalInfoData) {
    final data = personalInfoData.data;
    if (data != null) {
      // Required fields
      legalityController.text = data.legality ?? '';
      ethnicityController.text = data.ethnicity ?? '';
      mobileNumberController.text = data.mobile ?? '';

      // Optional fields
      clothesTypeController.text = data.clothesOutside ?? '';
      prayerSinceController.text = data.prayFiveTimesSince ?? '';
      missedPrayersController.text = data.weeklyMissedPrayers ?? '';
      mahramComplianceController.text = data.mahramCompliance ?? '';
      quranRecitationController.text = data.reciteQuran ?? '';
      selectedFiqh = data.fiqh;
      mediaHabitsController.text = data.watchMedia ?? '';
      healthConditionController.text = data.disease ?? '';
      religiousWorkController.text = data.deenWork ?? '';
      shrineBeliefsController.text = data.shrineBelief ?? '';
      islamicBooksController.text = data.islamicBooks ?? '';
      islamicScholarsController.text = data.scholars ?? '';
      hobbiesController.text = data.hobbies ?? '';
      specialKnowledgeController.text = data.specialKnowledge ?? '';
      aboutYourselfController.text = data.selfDescription ?? '';

      // Show optional fields section if any optional field has data
      if (data.clothesOutside.hasValue ||
          data.prayFiveTimesSince.hasValue ||
          data.weeklyMissedPrayers.hasValue ||
          data.mahramCompliance.hasValue ||
          data.reciteQuran.hasValue ||
          data.fiqh.hasValue ||
          data.watchMedia.hasValue ||
          data.disease.hasValue ||
          data.deenWork.hasValue ||
          data.shrineBelief.hasValue ||
          data.islamicBooks.hasValue ||
          data.scholars.hasValue ||
          data.hobbies.hasValue ||
          data.specialKnowledge.hasValue ||
          data.selfDescription.hasValue) {
        showOptionalFields = true;
      }

      update();
    }
  }

  void updateSelectedFiqh(String? value) {
    selectedFiqh = value;
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
