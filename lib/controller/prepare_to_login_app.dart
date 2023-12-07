//------/packages
import 'package:dio/dio.dart';

//------/controller
import '/controller/custom_dio.dart';
import '/controller/custom_response.dart';

//------/main
import '/main.dart';

void prepareToLoginApp() async {
  late Response<dynamic> customDio;
  late CustomResponse customResponse;

  customDio = await CustomDio.dio.get('dashboard/users/wish');
  if (customDio.statusCode == 200) {
    customResponse = CustomResponse.fromJson(customDio.data);

    if (customResponse.data.isNotEmpty) {
      int lastPage = customResponse.data['last_page'];

      for (Map<String, dynamic> bookIntroduction
          in customResponse.data['data']) {
        markedBooksId.add(bookIntroduction['id']);
      }

      for (int i = 2; i <= lastPage; ++i) {
        customDio = await CustomDio.dio.get(
          'dashboard/users/wish',
          queryParameters: {'page': i},
        );

        if (customDio.statusCode == 200) {
          customResponse = CustomResponse.fromJson(customDio.data);

          for (Map<String, dynamic> bookIntroduction
              in customResponse.data['data']) {
            markedBooksId.add(bookIntroduction['id']);
          }
        }
      }
    }
  }

  customDio = await CustomDio.dio.get('dashboard/my_books');
  if (customDio.statusCode == 200) {
    Map<String, dynamic> data = customDio.data;

    int lastPage = data['last_page'];

    for (Map<String, dynamic> bookIntroduction in data['data']) {
      libraryId.add(bookIntroduction['id']);
    }

    for (int i = 2; i <= lastPage; ++i) {
      customDio = await CustomDio.dio.get(
        'dashboard/my_books',
        queryParameters: {'page': i},
      );

      if (customDio.statusCode == 200) {
        data = customDio.data;

        for (Map<String, dynamic> bookIntroduction in data['data']) {
          libraryId.add(bookIntroduction['id']);
        }
      }
    }
  }

  customDio = await CustomDio.dio.get('user');
  if (customDio.statusCode == 200) {
    userId = customDio.data['id'];
  }
}
