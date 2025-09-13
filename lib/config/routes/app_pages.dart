import 'package:get/get.dart';
import 'package:islamic_marriage_usa_app/config/routes/app_routes.dart';
import 'package:islamic_marriage_usa_app/screens/about_us_screen/about_us_screen.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_details_screen/bindings/biodata_details_binding.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_details_screen/biodata_details_screen.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/bindings/biodata_management_binding.dart';
import 'package:islamic_marriage_usa_app/screens/biodata_management_screen/biodata_management_screen.dart';
import 'package:islamic_marriage_usa_app/screens/email_verification_screen/bindings/email_verification_binding.dart';
import 'package:islamic_marriage_usa_app/screens/email_verification_screen/email_verification_screen.dart';
import 'package:islamic_marriage_usa_app/screens/explore_screen/bindings/explore_binding.dart';
import 'package:islamic_marriage_usa_app/screens/favourite_biodata_screen/bindings/favourite_biodata_binding.dart';
import 'package:islamic_marriage_usa_app/screens/favourite_biodata_screen/favourite_biodata_screen.dart';
import 'package:islamic_marriage_usa_app/screens/forgot_otp_verification_screen/bindings/forgot_otp_verification_binding.dart';
import 'package:islamic_marriage_usa_app/screens/forgot_otp_verification_screen/forgot_otp_verification_screen.dart';
import 'package:islamic_marriage_usa_app/screens/help_center_screen/bindings/help_center_binding.dart';
import 'package:islamic_marriage_usa_app/screens/help_center_screen/help_center_screen.dart';
import 'package:islamic_marriage_usa_app/screens/home_screen/bindings/home_binding.dart';
import 'package:islamic_marriage_usa_app/screens/home_screen/home_screen.dart';
import 'package:islamic_marriage_usa_app/screens/log_in_screen/bindings/log_in_binding.dart';
import 'package:islamic_marriage_usa_app/screens/log_in_screen/log_in_screen.dart';
import 'package:islamic_marriage_usa_app/screens/my_biodata_screen/bindings/my_biodata_binding.dart';
import 'package:islamic_marriage_usa_app/screens/my_biodata_screen/my_biodata_screen.dart';
import 'package:islamic_marriage_usa_app/screens/no_internet_screen/bindings/no_internet_binding.dart';
import 'package:islamic_marriage_usa_app/screens/no_internet_screen/no_internet_screen.dart';
import 'package:islamic_marriage_usa_app/screens/onboarding_screen/bindings/onboarding_binding.dart';
import 'package:islamic_marriage_usa_app/screens/onboarding_screen/onboarding_screen.dart';
import 'package:islamic_marriage_usa_app/screens/otp_verification_screen/bindings/otp_verification_binding.dart';
import 'package:islamic_marriage_usa_app/screens/otp_verification_screen/otp_verification_screen.dart';
import 'package:islamic_marriage_usa_app/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:islamic_marriage_usa_app/screens/profile_screen/bindings/profile_binding.dart';
import 'package:islamic_marriage_usa_app/screens/purchases_screen/purchases_screen.dart';
import 'package:islamic_marriage_usa_app/screens/registration_screen/bindings/registration_binding.dart';
import 'package:islamic_marriage_usa_app/screens/registration_screen/registration_screen.dart';
import 'package:islamic_marriage_usa_app/screens/reset_password_screen/bindings/reset_password_binding.dart';
import 'package:islamic_marriage_usa_app/screens/reset_password_screen/reset_password_screen.dart';
import 'package:islamic_marriage_usa_app/screens/update_profile_screen/update_profile_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.noInternetScreen,
      page: () => NoInternetScreen(),
      binding: NoInternetBinding(),
    ),
    GetPage(
      name: AppRoutes.onboardingScreen,
      page: () => OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.logInScreen,
      page: () => LogInScreen(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: AppRoutes.registrationScreen,
      page: () => RegistrationScreen(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: AppRoutes.emailVerificationScreen,
      page: () => EmailVerificationScreen(),
      binding: EmailVerificationBinding(),
    ),
    GetPage(
      name: AppRoutes.otpVerificationScreen,
      page: () => OtpVerificationScreen(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotOtpVerificationScreen,
      page: () => ForgotOtpVerificationScreen(),
      binding: ForgotOtpVerificationBinding(),
    ),
    GetPage(
      name: AppRoutes.resetPasswordScreen,
      page: () => ResetPasswordScreen(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
        ProfileBinding(),
        ExploreBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.biodataDetailsScreen,
      page: () => BiodataDetailsScreen(),
      binding: BiodataDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.biodataManagementScreen,
      page: () => BiodataManagementScreen(),
      binding: BiodataManagementBinding(),
    ),
    GetPage(
      name: AppRoutes.myBiodataScreen,
      page: () => MyBiodataScreen(),
      binding: MyBiodataBinding(),
    ),
    GetPage(
      name: AppRoutes.favouriteBiodataScreen,
      page: () => FavouriteBiodataScreen(),
      binding: FavouriteBiodataBinding(),
    ),
    GetPage(
      name: AppRoutes.helpCenterScreen,
      page: () => HelpCenterScreen(),
      binding: HelpCenterBinding(),
    ),
    GetPage(
      name: AppRoutes.privacyPolicyScreen,
      page: () => PrivacyPolicyScreen(),
    ),
    GetPage(
      name: AppRoutes.aboutUsScreen,
      page: () => AboutUsScreen(),
    ),
    GetPage(
      name: AppRoutes.purchaseScreen,
      page: () => PurchaseScreen(),
    ),
    GetPage(
      name: AppRoutes.updateProfileScreen,
      page: () => UpdateProfileScreen(),
    )
  ];
}
