import 'dart:io';

import 'package:customer_club/configs/color_palette.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';

extension HttpResponseValidator on Response? {
  bool validate({bool withoutData = false, bool checkError = false}) {
    try {
      return (this != null &&
          this!.statusCode == 200 &&
          (withoutData || this!.data != null) &&
          ((!checkError ||
              (this!.data != null &&
                  ((this!.data as Map<String, dynamic>)['status'] == true ||
                      (this!.data as Map<String, dynamic>)['success'] ==
                          true)))));
    } catch (e) {
      return false;
    }
  }

  String get getErrorMessage {
    if (this != null && this!.data != null) {
      return (this!.data as Map<String, dynamic>)['message'] ??
          'خطا در برقراری ارتباط با سرور';
    }
    return 'خطا در برقراری ارتباط با سرور';
  }
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

extension StringUtil on String? {
  bool get isNotNullOrEmpty =>
      this != null && this != 'Null' && this != 'null' && this!.isNotEmpty;
}

extension StringExtension on String {
  bool get hasUpperCase => RegExp(r'[A-Z]+').hasMatch(this);
  bool get hasLowerCase => RegExp(r'[a-z]+').hasMatch(this);
  bool get hasNumber => RegExp(r'\d').hasMatch(this);
  bool get hasNonWords => RegExp(r'[\W_]+').hasMatch(this);
  bool get isPersian =>
      this.isEmpty ||
      RegExp(r'^[ \u0618\u0619\u061A\u0621\u0623\u0624\u0622\u0626\u0627\u0628\u067E\u062A-\u062F\u0686\u0630-\u0639\u0641\u0642\u0644-\u0648\u064E\u064F\u0650\u0651\u0698\u063A\u06A9\u06AF\u06CC]+$')
          .hasMatch(this);
}

extension FileUtil on File {
  Future<File> compressImage() async {
    final dir = await getTemporaryDirectory();
    var result = await FlutterImageCompress.compressAndGetFile(absolute.path,
        '${dir.absolute.path}/${DateTime.now().toIso8601String()}.jpg',
        minWidth: 1000, minHeight: 800);
    return File(result!.path);
  }

  Future<File> cropImage() async {
    var croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'برش تصویر',
            toolbarColor: ColorPalette.primaryColor,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true),
      ],
    );
    return File(croppedFile!.path);
  }
}
