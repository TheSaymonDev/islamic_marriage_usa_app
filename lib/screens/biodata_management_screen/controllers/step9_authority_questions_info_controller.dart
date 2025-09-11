import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_logger.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/models/step9_authority_questions_info_request.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/models/step9_authority_questions_info_response.dart';

class Step9AuthorityQuestionsController extends GetxController {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  String? parentsKnowledge;
  String? informationTruthfulness;
  String? agreementToTerms;

  final yesNoOptions = ['Yes', 'No'];

  Step9AuthorityQuestionsInfoResponse? authorityQuestionsInfoData;

  @override
  void onInit() {
    super.onInit();
    fetchAuthorityQuestionsInfo();
  }

  Future<bool> upsertAuthorityQuestionsInfo() async {
    // Validate that all questions are answered
    if (parentsKnowledge == null ||
        informationTruthfulness == null ||
        agreementToTerms == null) {
      AppConstFunctions.customErrorMessage(
          message: 'Please answer all the authority questions');
      return false;
    }

    // Validate that all answers are "Yes"
    if (parentsKnowledge != 'Yes' ||
        informationTruthfulness != 'Yes' ||
        agreementToTerms != 'Yes') {
      AppConstFunctions.customErrorMessage(
          message:
              'All authority questions must be answered with "Yes" to proceed');
      return false;
    }

    _setLoading(true);

    try {
      final data = Step9AuthorityQuestionsInfoRequest(
          step: 9,
          data: Data(
            agreeResponsibility: agreementToTerms!,
            allInfoTrue: informationTruthfulness!,
            parentsKnow: parentsKnowledge!,
          ));
      AppLogger.logInfo('Request Body: ${data.toJson()}');
      final response = await ApiService().post(
          url: AppUrls.upsertBiodataUrl,
          data: data,
          headers: AppUrls.getHeaderWithToken);

      if (response.success) {
        AppConstFunctions.customSuccessMessage(
            message: 'Authority Questions Saved Successfully');
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Authority Questions Save Failed';
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

  Future<void> fetchAuthorityQuestionsInfo() async {
    try {
      final response = await ApiService().get(
        url: '${AppUrls.getBiodataByStepUrl}/9',
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success && response.data != null) {
        authorityQuestionsInfoData =
            Step9AuthorityQuestionsInfoResponse.fromJson(response.data!);
        _populateFormFields(authorityQuestionsInfoData!);
      } else {
        final errorMessage =
            response.message['message'] ?? 'Authority Questions Read Failed';
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
      Step9AuthorityQuestionsInfoResponse authorityQuestionsInfoData) {
    final data = authorityQuestionsInfoData.data;
    if (data != null) {
      parentsKnowledge = data.parentsKnow;
      informationTruthfulness = data.allInfoTrue;
      agreementToTerms = data.agreeResponsibility;
      update();
    }
  }

  void updateParentsKnowledge(String? value) {
    parentsKnowledge = value;
    update();
  }

  void updateInformationTruthfulness(String? value) {
    informationTruthfulness = value;
    update();
  }

  void updateAgreementToTerms(String? value) {
    agreementToTerms = value;
    update();
  }

  // Validation method to check if all questions are answered with "Yes"
  bool validateAuthorityQuestions() {
    return parentsKnowledge == 'Yes' &&
        informationTruthfulness == 'Yes' &&
        agreementToTerms == 'Yes';
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}
