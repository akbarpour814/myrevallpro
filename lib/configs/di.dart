import 'dart:developer';
import 'package:customer_club/configs/gen/di/di.config.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/core/utils/value_notifires.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  getIt.registerSingleton<Dio>(
    createApiClient(),
  );

  getIt.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage(
    iOptions: IOSOptions(),
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  ));

  getIt.init();
}

Dio createApiClient() {
  Dio dio = Dio(BaseOptions(
      baseUrl: 'https://royacard.royaweb.com/app_data/',
      validateStatus: (status) => true,
      connectTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60)));
  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (e, handler) {
        log("error: ${e.toString()}\n");
        handler.reject(e);
      },
      onRequest: (request, handler) {
        try {
          log(
            'Request=> ${request.baseUrl}${request.path}'
            '\n'
            'Body=> ${request.data}'
            '\n'
            'Params=> ${request.queryParameters}'
            '\n',
          );
          if (tokenNotifire.value.isNotNullOrEmpty) {
            request.headers['Authorization'] = 'Bearer ${tokenNotifire.value}';
          }
          handler.next(request);
        } catch (e) {
          print(e);
        }
      },
      onResponse: (e, handler) async {
        if (e.statusCode == 401) {
          await getIt<FlutterSecureStorage>().deleteAll();
          tokenNotifire.value = null;
        }
        log(
          'Response=> ${e.realUri} '
          '\n'
          'StatusCode=> ${e.statusCode} '
          '\n'
          'Data=> ${e.data}',
        );
        handler.resolve(e);
      },
    ),
  );

  return dio;
}
