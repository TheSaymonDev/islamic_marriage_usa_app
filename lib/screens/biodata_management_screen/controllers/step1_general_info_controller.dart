import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_const_functions.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_logger.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/api_service.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/models/step1_general_info_request.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/models/step1_general_info_response.dart';

class Step1GeneralInfoController extends GetxController {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  String? selectedBioDataType;
  String? selectedMaritalStatus;
  String? selectedComplexion;
  String? selectedHeight;
  String? selectedWeight;
  String? selectedBloodGroup;
  String? selectedState;
  DateTime? selectedDob;

  final postalCodeController = TextEditingController();
  final dateOfBirthController = TextEditingController();

  final bioDataTypeOptions = [
    "Male's Biodata",
    "Female's Biodata",
  ];

  final maritalStatusOptions = [
    'Unmarried',
    'Married',
    'Divorced',
    'Widow',
    'Widower',
  ];

  final complexionOptions = [
    'Black',
    'Brown',
    'Light Brown',
    'Fair',
    'Very Fair',
  ];

  final heightOptions = [
    'Less than 4 feet',
    '4 ft 0 inch',
    '4 ft 1 inch',
    '4 ft 2 inch',
    '4 ft 3 inch',
    '4 ft 4 inch',
    '4 ft 5 inch',
    '4 ft 6 inch',
    '4 ft 7 inch',
    '4 ft 8 inch',
    '4 ft 9 inch',
    '4 ft 10 inch',
    '4 ft 11 inch',
    '5 ft 0 inch',
    '5 ft 1 inch',
    '5 ft 2 inch',
    '5 ft 3 inch',
    '5 ft 4 inch',
    '5 ft 5 inch',
    '5 ft 6 inch',
    '5 ft 7 inch',
    '5 ft 8 inch',
    '5 ft 9 inch',
    '5 ft 10 inch',
    '5 ft 11 inch',
    '6 ft 0 inch',
    '6 ft 1 inch',
    '6 ft 2 inch',
    '6 ft 3 inch',
    '6 ft 4 inch',
    '6 ft 5 inch',
    '6 ft 6 inch',
    '6 ft 7 inch',
    '6 ft 8 inch',
    '6 ft 9 inch',
    '6 ft 10 inch',
    '6 ft 11 inch',
    '7 ft 0 inch',
    'More than 7 feet',
  ];

  final weightOptions = [
    'Less Than 30 kg',
    '30 kg',
    '31 kg',
    '32 kg',
    '33 kg',
    '34 kg',
    '35 kg',
    '36 kg',
    '37 kg',
    '38 kg',
    '39 kg',
    '40 kg',
    '41 kg',
    '42 kg',
    '43 kg',
    '44 kg',
    '45 kg',
    '46 kg',
    '47 kg',
    '48 kg',
    '49 kg',
    '50 kg',
    '51 kg',
    '52 kg',
    '53 kg',
    '54 kg',
    '55 kg',
    '56 kg',
    '57 kg',
    '58 kg',
    '59 kg',
    '60 kg',
    '61 kg',
    '62 kg',
    '63 kg',
    '64 kg',
    '65 kg',
    '66 kg',
    '67 kg',
    '68 kg',
    '69 kg',
    '70 kg',
    '71 kg',
    '72 kg',
    '73 kg',
    '74 kg',
    '75 kg',
    '76 kg',
    '77 kg',
    '78 kg',
    '79 kg',
    '80 kg',
    '81 kg',
    '82 kg',
    '83 kg',
    '84 kg',
    '85 kg',
    '86 kg',
    '87 kg',
    '88 kg',
    '89 kg',
    '90 kg',
    '91 kg',
    '92 kg',
    '93 kg',
    '94 kg',
    '95 kg',
    '96 kg',
    '97 kg',
    '98 kg',
    '99 kg',
    '100 kg',
    '101 kg',
    '102 kg',
    '103 kg',
    '104 kg',
    '105 kg',
    '106 kg',
    '107 kg',
    '108 kg',
    '109 kg',
    '110 kg',
    '111 kg',
    '112 kg',
    '113 kg',
    '114 kg',
    '115 kg',
    '116 kg',
    '117 kg',
    '118 kg',
    '119 kg',
    '120 kg',
    'More Than 120 kg',
  ];

  final bloodGroupOptions = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
    'Don\'t know',
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

  Step1GeneralInfoResponse? generalInfoData;

  @override
  void onInit() {
    super.onInit();
    fetchGeneralInfo();
  }

  @override
  void onClose() {
    dateOfBirthController.dispose();
    postalCodeController.dispose();
    super.onClose();
  }

  Future<bool> upsertGeneralInfo() async {
    _setLoading(true);

    try {
      final data = Step1GeneralInfoRequest(
        step: 1,
        data: Data(
          biodataType: selectedBioDataType ?? '',
          maritalStatus: selectedMaritalStatus ?? '',
          dateOfBirth: selectedDob.toString(),
          complexion: selectedComplexion ?? '',
          height: selectedHeight ?? '',
          weight: selectedWeight ?? '',
          bloodGroup: selectedBloodGroup ?? '',
          state: selectedState ?? '',
          postalCode: postalCodeController.text,
        ),
      );
      AppLogger.logInfo('Request Body: ${data.toJson()}');
      final response = await ApiService().post(
          url: AppUrls.upsertBiodataUrl,
          data: data,
          headers: AppUrls.getHeaderWithToken);

      if (response.success) {
        AppConstFunctions.customSuccessMessage(
            message: 'General Info Saved Successfully');
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'General Info Save Failed';
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

  Future<void> fetchGeneralInfo() async {
    try {
      final response = await ApiService().get(
        url: '${AppUrls.getBiodataByStepUrl}/1',
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success && response.data != null) {
        generalInfoData = Step1GeneralInfoResponse.fromJson(response.data!);
        _populateFormFields(generalInfoData!);
      } else {
        final errorMessage =
            response.message['message'] ?? 'General Info Read Failed';
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

  void _populateFormFields(Step1GeneralInfoResponse generalInfoData) {
    final data = generalInfoData.data;
    if (data != null) {
      selectedBioDataType = data.biodataType;
      selectedMaritalStatus = data.maritalStatus;
      selectedComplexion = data.complexion;
      selectedHeight = data.height;
      selectedWeight = data.weight;
      selectedBloodGroup = data.bloodGroup;
      selectedState = data.state;
      postalCodeController.text = data.postalCode ?? '';
      // Parse and format the date
      if (data.dateOfBirth != null && data.dateOfBirth!.isNotEmpty) {
        selectedDob = DateTime.parse(data.dateOfBirth!);
        dateOfBirthController.text =
            DateFormat('dd-MM-yyyy').format(selectedDob!);
      } else {
        dateOfBirthController.text = '';
      }
      update();
    }
  }

  void updateSelectedBioDataType(String? value) {
    selectedBioDataType = value;
    update();
  }

  void updateSelectedMaritalStatus(String? value) {
    selectedMaritalStatus = value;
    update();
  }

  void updateSelectedComplexion(String? value) {
    selectedComplexion = value;
    update();
  }

  void updateSelectedHeight(String? value) {
    selectedHeight = value;
    update();
  }

  void updateSelectedWeight(String? value) {
    selectedWeight = value;
    update();
  }

  void updateSelectedBloodGroup(String? value) {
    selectedBloodGroup = value;
    update();
  }

  void updateSelectedState(String? value) {
    selectedState = value;
    update();
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}
