import 'package:flutter/material.dart';

class AppValidators {
  static String? emailValidator(value) {
    if (value!.isEmpty) {
      return 'Please enter your email address.';
    }
    if (!RegExp(r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}')
        .hasMatch(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  static String? passwordValidator(value) {
    if (value!.isEmpty) {
      return 'Please enter a password.';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }
    return null;
  }

  static String? confirmPasswordValidator(
      String? value, TextEditingController newPasswordController) {
    if (value!.isEmpty) {
      return 'Please confirm your password.';
    }
    if (value != newPasswordController.text) {
      return 'Passwords do not match.';
    }
    return null;
  }

  static String? requiredValidator(value) {
    if (value!.isEmpty) {
      return 'Field is required';
    }
    return null;
  }
}
