import 'package:flutter/foundation.dart';

class AppLogger {
  /// Log an error message (level: ERROR)
  static void logError(dynamic message) {
    if (kDebugMode) {
      print('⛔ ERROR: $message');
    }
  }

  /// Log an informational message (level: INFO)
  static void logInfo(dynamic message) {
    if (kDebugMode) {
      print('ℹ️INFO: $message');
    }
  }

  /// Log a debug message (level: DEBUG)
  static void logDebug(dynamic message) {
    if (kDebugMode) {
      print('🐛 DEBUG: $message');
    }
  }

  /// Log a warning message (level: WARNING)
  static void logWarning(dynamic message) {
    if (kDebugMode) {
      print('⚠️ WARNING: $message');
    }
  }

  /// Log network request details
  static void logRequest(String url, {dynamic data, Map<String, String>? headers}) {
    if (kDebugMode) {
      print('🌐 REQUEST: $url');
      if (data != null) print('📦 Data: $data');
      if (headers != null) print('📋 Headers: $headers');
    }
  }

  /// Log network response details
  static void logResponse(int statusCode, dynamic body) {
    if (kDebugMode) {
      print('📥 RESPONSE: Status $statusCode');
      print('📄 Body: $body');
    }
  }
}
