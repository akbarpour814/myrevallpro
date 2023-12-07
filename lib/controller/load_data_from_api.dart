//------/dart and flutter packages
import 'package:flutter/material.dart';

//------/packages
import 'package:dio/dio.dart';

//------/controller
import '/controller/custom_response.dart';

mixin LoadDataFromAPI<T extends StatefulWidget> on State<T> {
  late Response<dynamic> customDio;
  late CustomResponse customResponse;
  late bool dataIsLoading;

  @override
  void initState() {
    super.initState();

    dataIsLoading = true;
  }
}
