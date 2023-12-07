//------/dart and flutter packages
import 'package:flutter/material.dart';
import 'dart:async';

//------/packages
import 'package:ionicons/ionicons.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

//------/controller
import '/controller/custom_dio.dart';
import '/controller/custom_response.dart';
import '/controller/internet_connection.dart';
import '/controller/load_data_from_api.dart';

//------/model
import '/model/category.dart';

//------/view/pages/category_page
import '/view/pages/category_page/subcategories_page.dart';

//------/view/view_models
import '/view/view_models/category_name.dart';
import '/view/view_models/custom_circular_progress_indicator.dart';
import '/view/view_models/no_internet_connection.dart';

//------/main
import '/main.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with InternetConnection, LoadDataFromAPI {
  late List<Category> _categories;

  @override
  void initState() {
    super.initState();

    _categories = [];
  }

  Future _initCategories() async {
    customDio = await CustomDio.dio.post('categories');

    if (customDio.statusCode == 200) {
      _categories.clear();

      customResponse = CustomResponse.fromJson(customDio.data);

      Map<String, IconData> categoriesIcon = {
        'کتاب صوتی': Ionicons.musical_notes_outline,
        'نامه صوتی': Ionicons.mail_open_outline,
        'کتاب الکترونیکی': Ionicons.laptop_outline,
        'پادکست': Ionicons.volume_medium_outline,
        'کتاب کودک و نوجوان': Ionicons.happy_outline,
      };

      for (Map<String, dynamic> category in customResponse.data) {
        _categories.add(
          Category.fromJson(
            categoriesIcon[category['name']] ?? Ionicons.albums_outline,
            category,
          ),
        );
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
      title: const Text('دسته بندی'),
      leading: const Icon(
        Ionicons.albums_outline,
      ),
    );
  }

  FutureBuilder _body() {
    return FutureBuilder(
      future: _initCategories(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        } else {
          if (connectionStatus == ConnectivityResult.none) {
            return const Center(
              child: NoInternetConnection(),
            );
          } else {
            return _innerBody();
          }
        }
      },
    );
  }

  RefreshIndicator _innerBody() {
    return RefreshIndicator(
      onRefresh: _initCategories,
      child: ListView(
        children: List<CategoryName>.generate(
          _categories.length,
          (index) => CategoryName(
            iconData: _categories[index].iconData,
            title: _categories[index].name,
            lastCategory: false,
            page: SubcategoriesPage(
              iconData: _categories[index].iconData,
              title: _categories[index].name,
              subcategories: _categories[index].subcategories,
            ),
          ),
        ),
      ),
    );
  }
}
