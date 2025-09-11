import 'package:islamic_marriage_usa_app/data/services/shared_preference_service.dart';

class AppUrls {
  static const appLogoPng = 'assets/images/app_logo.png';
  static const companyLogo = 'assets/images/company_logo.jpg';
  static const demoProfile = 'assets/images/demo_profile.jpg';
  static const maleIcon = 'assets/images/male_icon.png';
  static const femaleIcon = 'assets/images/female_icon.png';
  static const placeHolderPng = 'assets/images/placeholder.png';
  static const kaziOfficePng = 'assets/images/kazi_office.png';
  static const noInternetPng = 'assets/images/no_internet.png';

  static const _baseUrl =
      "https://islamic-marriage-us-server.vercel.app/api/v1";
  static const Map<String, String> requestHeader = {
    "Content-Type": "application/json"
  };

  static Map<String, String> get getHeaderWithToken {
    String token = SharedPreferencesService().getToken();
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
  }

  static const logInUrl = '$_baseUrl/user/login/mobile';
  static const registrationUrl = '$_baseUrl/user/register';
  static const emailVerificationUrl = '$_baseUrl/user/forgot-password';
  static const otpVerificationUrl = '$_baseUrl/user/verify-otp';
  static const forgotOtpVerificationUrl = '$_baseUrl/user/verify-forgot-otp';
  static const resetPasswordUrl = '$_baseUrl/user/reset-password';
  static const upsertBiodataUrl = '$_baseUrl/biodata/create-biodata';
  static const getBiodataByStepUrl = '$_baseUrl/biodata/my-biodata';
  static const submitBiodataUrl = '$_baseUrl/biodata/complete';
  static const getMyBiodataUrl = '$_baseUrl/biodata/my-biodata';
  static const getAllBiodataUrl = '$_baseUrl/biodata';
  static const deleteBiodataUrl = '$_baseUrl/biodata/my-biodata';
  static const addToFavouriteUrl = '$_baseUrl/favorite-biodata/add';
  static const removeFromFavourite = '$_baseUrl/favorite-biodata/remove';
  static const getFavouriteBiodataUrl =
      '$_baseUrl/favorite-biodata/my-favorites';
  static const getCurrentUserUrl = '$_baseUrl/user/get-user';
}
