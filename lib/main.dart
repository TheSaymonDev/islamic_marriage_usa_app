import 'package:flutter/material.dart';
import 'package:islamic_marriage_usa_app/app.dart';
import 'package:islamic_marriage_usa_app/config/routes/app_routes.dart';
import 'package:islamic_marriage_usa_app/data/services/connectivity_service.dart';
import 'package:islamic_marriage_usa_app/data/services/shared_preference_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService().init(); // Initialize SharedPreferences
  final hasInternet = await ConnectivityService.isConnected();
  final userId = SharedPreferencesService().getUserId();
  runApp(
    MyApp(
      initialRoute: hasInternet
          ? (userId.isNotEmpty
              ? AppRoutes.homeScreen
              : AppRoutes.onboardingScreen)
          : AppRoutes.noInternetScreen,
    ),
  );
}
