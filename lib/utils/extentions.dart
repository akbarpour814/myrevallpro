import 'package:flutter/material.dart';
import 'package:revallpro/data/model/base_response_model.dart';

extension BaseResponseParser on BaseResponseModel? {
  bool get validate {
    return (this != null && this!.data != null && this!.message == null);
  }

  bool get validateWithoutData {
    return (this != null && (this!.isSuccess ?? false));
  }

  String get getErrorMessage => this != null
      ? (this!.message ?? 'Something went wrong.')
      : 'Something went wrong.';
}

extension StringNullChecker on String? {
  bool get isNotNullOrEmpty =>
      this != null && this != 'Null' && this != 'null' && this!.isNotEmpty;
}

extension NumberParsing on num {
  double w(BuildContext context) =>
      this * MediaQueryData.fromView(View.of(context)).size.width / 100;

  double h(BuildContext context) =>
      this * MediaQueryData.fromView(View.of(context)).size.height / 100;

  Widget wsb({Widget? child}) => SizedBox(
        width: toDouble(),
        child: child,
      );

  Widget hsb({Widget? child}) => SizedBox(
        height: toDouble(),
        child: child,
      );
  Widget whsb({Widget? child}) => SizedBox(
        width: toDouble(),
        height: toDouble(),
        child: child,
      );
}

extension passwordCheck on String {
  bool get hasUpperCase => RegExp(r'[A-Z]+').hasMatch(this);
  bool get hasLowerCase => RegExp(r'[a-z]+').hasMatch(this);
  bool get hasNumber => RegExp(r'\d').hasMatch(this);
  bool get hasNonWords => RegExp(r'[\W_]+')
      .hasMatch(this); // Matches anything other than a letter or digit.
}
