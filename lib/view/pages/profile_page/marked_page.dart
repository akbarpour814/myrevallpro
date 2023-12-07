//------/dart and flutter packages
import 'package:flutter/material.dart';

//------/packages
import 'package:ionicons/ionicons.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

//------/controller
import '/controller/custom_dio.dart';
import '/controller/custom_response.dart';
import '/controller/internet_connection.dart';
import '/controller/load_data_from_api.dart';

//------/model
import '/model/book_introduction.dart';

//------/view/view_models
import '/view/view_models/book_short_introduction.dart';
import '/view/view_models/custom_circular_progress_indicator.dart';
import '/view/view_models/custom_smart_refresher.dart';
import '/view/view_models/no_internet_connection.dart';

//------/main
import '/main.dart';

class MarkedPage extends StatefulWidget {
  const MarkedPage({Key? key}) : super(key: key);

  @override
  _MarkedPageState createState() => _MarkedPageState();
}

class _MarkedPageState extends State<MarkedPage>
    with InternetConnection, LoadDataFromAPI, Refresher {
  late List<BookIntroduction> _markedBooks;
  late List<BookIntroduction> _markedBooksTemp;

  @override
  void initState() {
    super.initState();

    _markedBooks = [];
    _markedBooksTemp = [];
  }

  Future _initMarkedBooks() async {
    customDio = await CustomDio.dio.get(
      'dashboard/users/wish',
      queryParameters: {'page': currentPage},
    );

    if (customDio.statusCode == 200) {
      customResponse = CustomResponse.fromJson(customDio.data);

      if (customResponse.data.isNotEmpty) {
        lastPage = customResponse.data['last_page'];

        if (currentPage == 1) {
          _markedBooksTemp.clear();
        }

        for (Map<String, dynamic> book in customResponse.data['data']) {
          _markedBooksTemp.add(BookIntroduction.fromJson(book));
        }

        setState(() {
          refresh = false;
          loading = false;

          _markedBooks.clear();
          _markedBooks.addAll(_markedBooksTemp);

          dataIsLoading = false;
        });
      }
    }

    return customDio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: playerBottomNavigationBar,
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('نشان شده ها'),
      automaticallyImplyLeading: false,
      leading: const Icon(
        Ionicons.bookmark_outline,
      ),
      actions: [
        InkWell(
          child: const Padding(
            padding: EdgeInsets.all(18.0),
            child: Icon(
              Ionicons.chevron_back_outline,
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget _body() {
    if (dataIsLoading) {
      return FutureBuilder(
        future: _initMarkedBooks(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return _innerBody();
          } else {
            return const Center(child: CustomCircularProgressIndicator());
          }
        },
      );
    } else {
      return _innerBody();
    }
  }

  Widget _innerBody() {
    if (connectionStatus == ConnectivityResult.none) {
      setState(() {
        dataIsLoading = true;
      });

      return const Center(
        child: NoInternetConnection(),
      );
    } else {
      if (_markedBooks.isEmpty) {
        return const Center(
          child: Text('شما تا کنون کتابی را نشان نکرده اید.'),
        );
      } else {
        return CustomSmartRefresher(
          refreshController: refreshController,
          onRefresh: () => onRefresh(() => _initMarkedBooks()),
          onLoading: () => onLoading(() => _initMarkedBooks()),
          list: List<BookShortIntroduction>.generate(
            _markedBooks.length,
            (index) => BookShortIntroduction(
              book: _markedBooks[index],
            ),
          ),
          listType: 'کتاب',
          refresh: refresh,
          loading: loading,
          lastPage: lastPage,
          currentPage: currentPage,
          dataIsLoading: dataIsLoading,
        );
      }
    }
  }
}
