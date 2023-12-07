//------/dart and flutter packages
import 'package:flutter/material.dart';

//------/packages
import 'package:persian_number_utility/persian_number_utility.dart';

class UserInformationFormatCheck {
  static String? checkFirstAndLastNameFormat(
      TextEditingController textEditingController, String? errorText) {
    String? _errorText;

    if (textEditingController.text.isEmpty && errorText != null) {
      _errorText = errorText;
    } else if ((textEditingController.text.isEmpty) ||
        ((textEditingController.text.length >= 3) &&
            (!textEditingController.text.contains('  ')))) {
      _errorText = null;
    } else if ((textEditingController.text.length < 3) ||
        (textEditingController.text.contains('  '))) {
      _errorText = 'لطفاً نام و نام خانوادگی معتبر وارد کنید.';
    }

    return _errorText;
  }

  static String? checkEmailFormat(
      TextEditingController textEditingController, String? errorText) {
    String? _errorText;
    bool _checkEmailFormat = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(textEditingController.text);

    if (textEditingController.text.isEmpty && errorText != null) {
      _errorText = errorText;
    } else if ((textEditingController.text.isEmpty) || (_checkEmailFormat)) {
      _errorText = null;
    } else if (!_checkEmailFormat) {
      _errorText = 'لطفاً ایمیل معتبر وارد کنید.';
    }

    return _errorText;
  }

  static String? checkPhoneNumberFormat(
      TextEditingController textEditingController, String? errorText) {
    String? _errorText;

    if (textEditingController.text.isEmpty && errorText != null) {
      _errorText = errorText;
    } else if ((textEditingController.text.isEmpty) ||
        (textEditingController.text.isValidIranianMobileNumber())) {
      _errorText = null;
    } else if (!textEditingController.text.isValidIranianMobileNumber()) {
      _errorText = 'لطفاً شماره تلفن همراه معتبر وارد کنید.';
    }

    return _errorText;
  }

  static String? checkPasswordFormat(
      TextEditingController textEditingController, String? errorText) {
    String? _errorText;

    if (textEditingController.text.isEmpty && errorText != null) {
      _errorText = errorText;
    } else if ((textEditingController.text.isEmpty) ||
        (textEditingController.text.length == 9)) {
      _errorText = null;
    } else if (textEditingController.text.length < 10) {
      _errorText = 'رمز عبور نباید کمتر از 9 کاراکتر باشد.';
    } else if (textEditingController.text.contains(' ')) {
      _errorText = 'رمز عبور نباید شامل جای خالی باشد.';
    }

    return _errorText;
  }
}
