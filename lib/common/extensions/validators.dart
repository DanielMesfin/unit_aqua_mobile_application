import 'package:get/get.dart';

import '../../helpers/utils.dart';

extension Validator on String {
  String? get validateEmail {
    if (!GetUtils.isEmail(trim())) {
      return "invalid email address";
    } else {
      return null;
    }
  }

  String? get validatePhoneNumber {
    if (length > 9 || length < 9) {
      return Get.context != null
          ? "invalid phone number"
          : "Provide valid phone number";
    }

    if (!GetUtils.isPhoneNumber(trim())) {
      return Get.context != null
          ? "invalid phone number"
          : "Provide valid phone number";
    }
    if (startsWith("9")) {
      return null;
    } else if (startsWith("7")) {
      return null;
    } else {
      return Get.context != null
          ? "invalid phone number"
          : "Provide valid phone number";
    }
  }

  String? get validatePassword {
    if (!GetUtils.isLengthGreaterOrEqual(this, 8)) {
      return "invalid password";
    } else {
      return null;
    }
  }

  String? validatePasswordMatch(password) {
    if (this != password) {
      return "both password must much";
    } else {
      return null;
    }
  }

  String? validateField({required String fieldName}) {
    final errorMessage = "cannot be empty";
    if (isEmpty) {
      return Utils.concatenateString([fieldName, errorMessage]);
    }
    return null;
  }

  String? validatePhoneField({required String fieldName}) {
    final errorMessage = "cannot be empty";
    if (isEmpty) {
      return Utils.concatenateString([fieldName, errorMessage]);
    }
    if (trim().length < 10) {
      return Utils.concatenateString(
          [fieldName, "Phone number should be at least 10 digits long"]);
    }
    return null;
  }

  String? validatePinField({required String fieldName, required String value}) {
    final errorMessage = "cannot be empty";

    // Check if the value is empty
    if (value.isEmpty) {
      return Utils.concatenateString([fieldName, errorMessage]);
    }

    // Check if the value is greater than 6 and less than 8 characters
    if (value.length < 6 || value.length > 8) {
      return Utils.concatenateString(
          [fieldName, " should be between 6 and 8 characters long"]);
    }

    return null; // No validation errors
  }
}
