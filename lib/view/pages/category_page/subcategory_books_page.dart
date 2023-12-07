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
import '/model/category.dart';

//------/view/view_models
import '/view/view_models/book_short_introduction.dart';
import '/view/view_models/custom_circular_progress_indicator.dart';
import '/view/view_models/custom_smart_refresher.dart';
import '/view/view_models/no_internet_connection.dart';

//------/main
import '/main.dart';

// ignore: must_be_immutable
class SubcategoryBooksPage extends StatefulWidget {
  late Subcategory subcategory;

  SubcategoryBooksPage({
    Key? key,
    required this.subcategory,
  }) : super(key: key);

  @override
  _SubcategoryBooksPageState createState() => _SubcategoryBooksPageState();
}

class _SubcategoryBooksPageState extends State<SubcategoryBooksPage>
    with InternetConnection, LoadDataFromAPI, Refresher {
  late List<BookIntroduction> _subcategoryBooks;
  late List<BookIntroduction> _subcategoryBooksTemp;

  @override
  void initState() {
    super.initState();

    _subcategoryBooks = [];
    _subcategoryBooksTemp = [];
  }

  Future _initSubcategoryBooks() async {
    customDio = await CustomDio.dio.post(
      'categories/${widget.subcategory.slug}',
      queryParameters: {'page': currentPage},
    );

    if (customDio.statusCode == 200) {
      customResponse = CustomResponse.fromJson(customDio.data);

      if(customResponse.data.isNotEmpty) {
        lastPage = customResponse.data['last_page'];

        if (currentPage == 1) {
          _subcategoryBooksTemp.clear();
        }

        for (Map<String, dynamic> book in customResponse.data['data']) {
          _subcategoryBooksTemp.add(BookIntroduction.fromJson(book));
        }

        setState(() {
          refresh = false;
          loading = false;

          _subcategoryBooks.clear();
          _subcategoryBooks.addAll(_subcategoryBooksTemp);

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
      title: Text(widget.subcategory.name),
      centerTitle: false,
      automaticallyImplyLeading: false,
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
        future: _initSubcategoryBooks(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return _innerBody();
          } else {
            return Center(
              child: CustomCircularProgressIndicator(),
            );
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
      if (_subcategoryBooks.isEmpty) {
        return const Center(
          child: Text('کتابی یافت نشد.'),
        );
      } else {
        return CustomSmartRefresher(
          refreshController: refreshController,
          onRefresh: () => onRefresh(() => _initSubcategoryBooks()),
          onLoading: () => onLoading(() => _initSubcategoryBooks()),
          list: List<BookShortIntroduction>.generate(
            _subcategoryBooks.length,
            (index) => BookShortIntroduction(
              book: _subcategoryBooks[index],
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