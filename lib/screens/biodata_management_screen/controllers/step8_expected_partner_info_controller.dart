import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_extensions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_logger.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/models/step8_expected_partner_info_request.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/models/step8_expected_partner_info_response.dart';

class Step8ExpectedPartnerInfoController extends GetxController {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  // Age Range Properties
  RangeValues _ageRange = const RangeValues(18, 30);
  RangeValues get ageRange => _ageRange;

  int get expectedMinAge => _ageRange.start.toInt();
  int get expectedMaxAge => _ageRange.end.toInt();

  final expectedHeightController = TextEditingController();
  final expectedEducationController = TextEditingController();
  final expectedOccupationController = TextEditingController();
  final financialConditionController = TextEditingController();
  final expectedQualitiesController = TextEditingController();
  final expectedEthnicityController = TextEditingController();
  final expectedLegalityController = TextEditingController();

  List<String> selectedComplexions = [];
  List<String> selectedStates = [];
  List<String> selectedMaritalStatuses = [];

  bool showOptionalFields = false;

  final complexionOptions = [
    'Black',
    'Brown',
    'Light Brown',
    'Fair',
    'Very Fair',
  ];
  final stateOptions = [
    'Alabama',
    'Alaska',
    'Arizona',
    'Arkansas',
    'California',
    'Colorado',
    'Connecticut',
    'Delaware',
    'Florida',
    'Georgia',
    'Hawaii',
    'Idaho',
    'Illinois',
    'Indiana',
    'Iowa',
    'Kansas',
    'Kentucky',
    'Louisiana',
    'Maine',
    'Maryland',
    'Massachusetts',
    'Michigan',
    'Minnesota',
    'Mississippi',
    'Missouri',
    'Montana',
    'Nebraska',
    'Nevada',
    'New Hampshire',
    'New Jersey',
    'New Mexico',
    'New York',
    'North Carolina',
    'North Dakota',
    'Ohio',
    'Oklahoma',
    'Oregon',
    'Pennsylvania',
    'Rhode Island',
    'South Carolina',
    'South Dakota',
    'Tennessee',
    'Texas',
    'Utah',
    'Vermont',
    'Virginia',
    'Washington',
    'West Virginia',
    'Wisconsin',
    'Wyoming',
    'No Preference'
  ];
  final maritalStatusOptions = [
    'Unmarried',
    'Married',
    'Divorced',
    'Widow',
    'Widower',
  ];

  Step8ExpectedPartnerInfoResponse? expectedPartnerInfoData;

  @override
  void onInit() {
    super.onInit();
    fetchExpectedPartnerInfo();
  }

  @override
  void onClose() {
    financialConditionController.dispose();
    expectedQualitiesController.dispose();
    expectedEthnicityController.dispose();
    expectedLegalityController.dispose();
    super.onClose();
  }

  Future<bool> upsertExpectedPartnerInfo() async {
    _setLoading(true);

    try {
      final data = Step8ExpectedPartnerInfoRequest(
        step: 8,
        data: Data(
          expectedAgeRange: [expectedMinAge, expectedMaxAge],
          expectedComplexion: selectedComplexions,
          expectedMaritalStatus: selectedMaritalStatuses,
          expectedState: selectedStates,
          expectedEducation: expectedEducationController.text,
          expectedEthnicity: expectedEthnicityController.text,
          expectedFinancialCondition: financialConditionController.text,
          expectedHeight: expectedHeightController.text,
          expectedLegality: expectedLegalityController.text,
          expectedOccupation: expectedOccupationController.text,
          expectedPartnerAttributes: expectedQualitiesController.text,
        ),
      );
      AppLogger.logInfo('Request Body: ${data.toJson()}');
      final response = await ApiService().post(
          url: AppUrls.upsertBiodataUrl,
          data: data,
          headers: AppUrls.getHeaderWithToken);

      if (response.success) {
        AppConstFunctions.customSuccessMessage(
            message: 'Expected Partner Info Saved Successfully');
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Expected Partner Info Save Failed';
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

  Future<void> fetchExpectedPartnerInfo() async {
    try {
      final response = await ApiService().get(
        url: '${AppUrls.getBiodataByStepUrl}/8',
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success && response.data != null) {
        expectedPartnerInfoData =
            Step8ExpectedPartnerInfoResponse.fromJson(response.data!);
        _populateFormFields(expectedPartnerInfoData!);
      } else {
        final errorMessage =
            response.message['message'] ?? 'Expected Partner Info Read Failed';
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
      Step8ExpectedPartnerInfoResponse expectedPartnerInfoData) {
    final data = expectedPartnerInfoData.data;
    if (data != null) {
      // Age range
      if (data.expectedAgeRange != null && data.expectedAgeRange!.length == 2) {
        _ageRange = RangeValues(data.expectedAgeRange![0].toDouble(),
            data.expectedAgeRange![1].toDouble());
      }

      // Optional fields
      expectedHeightController.text = data.expectedHeight ?? '';
      expectedEducationController.text = data.expectedEducation ?? '';
      expectedOccupationController.text = data.expectedOccupation ?? '';
      financialConditionController.text = data.expectedFinancialCondition ?? '';
      expectedQualitiesController.text = data.expectedPartnerAttributes ?? '';
      expectedEthnicityController.text = data.expectedEthnicity ?? '';
      expectedLegalityController.text = data.expectedLegality ?? ''; // Fixed this line

      // Handle expectedMaritalStatus array
      if (data.expectedComplexion != null) {
        selectedComplexions = List<String>.from(data.expectedComplexion!);
      }
      if (data.expectedMaritalStatus != null) {
        selectedMaritalStatuses =
        List<String>.from(data.expectedMaritalStatus!);
      }
      if (data.expectedState != null) {
        selectedStates = List<String>.from(data.expectedState!);
      }

      // Show optional fields section if any optional field has data
      if (data.expectedComplexion?.isNotEmpty == true ||
          data.expectedMaritalStatus?.isNotEmpty == true ||
          data.expectedState?.isNotEmpty == true ||
          data.expectedHeight.hasValue ||
          data.expectedEducation.hasValue ||
          data.expectedOccupation.hasValue ||
          data.expectedFinancialCondition.hasValue ||
          data.expectedPartnerAttributes.hasValue ||
          data.expectedEthnicity.hasValue ||
          data.expectedLegality.hasValue) {
        showOptionalFields = true;
      }

      update(); // Make sure to call update() at the end
    }
  }

  void updateAgeRange(RangeValues newRange) {
    _ageRange = newRange;
    update();
  }

  void updateSelectedMaritalStatuses(List<String> values) {
    selectedMaritalStatuses = values;
    update();
  }

  void updateSelectedComplexion(List<String> values) {
    selectedComplexions = values;
    update();
  }

  void updateSelectedState(List<String> values) {
    selectedStates = values;
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
