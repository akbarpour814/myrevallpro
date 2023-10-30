import 'package:revallpro/utils/assist.dart';
import 'package:revallpro/utils/extentions.dart';

String? passwordValidator(String? value, {String? mainValue}) {
  if (value == null || value.trim().isEmpty) {
    return 'Password is not valid!';
  } else if (value.length < 8) {
    return 'Password must contain at least 8 characters ';
  } else if (!value.hasLowerCase) {
    return 'Password must contain at least one lowercase letter';
  } else if (!value.hasUpperCase) {
    return 'Password must contain at least one uppercase letter';
  } else if (!value.hasNumber) {
    return 'Password must contain at least one number';
  } else if (!value.hasNonWords) {
    return 'Password must contain at least one symbol';
  } else if (mainValue.isNotNullOrEmpty && value != mainValue) {
    return 'The password does not match';
  } else {
    return null;
  }
}

String? generalValidator(String? value, String title) {
  if (value == null || value.trim().isEmpty) {
    return '$title is not valid!';
  }
  return null;
}

String? emailValidator(String? value) {
  if (value == null || value.trim().isEmpty || !isEmail(value)) {
    return 'Email is not valid!';
  }
  return null;
}
