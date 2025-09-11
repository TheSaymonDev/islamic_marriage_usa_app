import 'package:flutter/material.dart';

class AppValidators {
  static String? emailValidator(value) {
    if (value!.isEmpty) {
      return 'Please enter your email address';
    }
    if (!RegExp(r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}')
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? passwordValidator(value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? confirmPasswordValidator(
      String? value, TextEditingController newPasswordController) {
    if (value!.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != newPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? passingYearValidator(String? value) {
    // Field is optional, so if empty or null, return null (no error)
    if (value == null || value.isEmpty) {
      return null;
    }

    // Check if it's a 4-digit number
    if (!RegExp(r'^\d{4}$').hasMatch(value)) {
      return 'Please enter a valid 4-digit year';
    }

    // Convert to integer and check if it's a reasonable year
    final year = int.tryParse(value);
    final currentYear = DateTime.now().year;

    if (year == null) {
      return 'Please enter a valid year';
    }

    // Assuming education years from 1950 to current year + 5 (for future graduates)
    if (year < 1950 || year > currentYear + 5) {
      return 'Please enter a year between 1950 and ${currentYear + 5}';
    }

    return null;
  }

}
