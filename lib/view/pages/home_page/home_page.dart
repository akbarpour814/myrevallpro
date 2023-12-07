//------/dart and flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//------/packages
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ionicons/ionicons.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

//------/controller
import '/controller/custom_dio.dart';
import '/controller/custom_response.dart';
import '/controller/internet_connection.dart';
import '/controller/load_data_from_api.dart';

//------/model
import '/model/book_introduction.dart';
import '/model/home_page_category_data.dart';

//------/view/view_models
import '/view/view_models/books_list_view.dart';
import '/view/view_models/books_page.dart';
import '/view/view_models/custom_circular_progress_indicator.dart';
import '/view/view_models/no_internet_connection.dart';

//------/main
import '/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with InternetConnection, LoadDataFromAPI {
  late List<HomePageCategoryData> _homePageCategoriesData;

  @override
  void initState() {
    super.initState();

    _homePageCategoriesData = [];
  }

  Future _initHomePageCategoriesData() async {
    customDio = await CustomDio.dio.post('home');

    if (customDio.statusCode == 200) {
      _homePageCategoriesData.clear();

      customResponse = CustomResponse.fromJson(customDio.data);

      _homePageCategoriesData.add(
        HomePageCategoryData.fromJson(
          'کتاب های صوتی',
          (customResponse.data['books'])['کتاب-صوتی'],
        ),
      );

      _homePageCategoriesData.add(
        HomePageCategoryData.fromJson(
          'نامه های صوتی',
          (customResponse.data['books'])['نامه-صوتی'],
        ),
      );

      _homePageCategoriesData.add(
        HomePageCategoryData.fromJson(
          'کتاب های الکترونیکی',
          (customResponse.data['books'])['کتاب-الکترونیکی'],
        ),
      );

      _homePageCategoriesData.add(
        HomePageCategoryData.fromJson(
          'پادکست ها',
          (customResponse.data['books'])['پادکست'],
        ),
      );

      _homePageCategoriesData.add(
        HomePageCategoryData.fromJson(
          'کتاب های کودک و نوجوان',
          (customResponse.data['books'])['کتاب-کودک-و-نوجوان'],
        ),
      );
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
      title: const Text('خانه'),
      leading: const Icon(
        Ionicons.home_outline,
      ),
    );
  }

  Widget _body() {
    return FutureBuilder(
      future: _initHomePageCategoriesData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
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
      onRefresh: _initHomePageCategoriesData,
      child: ListView(
        children: List<HomePageCategoryView>.generate(
          _homePageCategoriesData.length,
          (index) => HomePageCategoryView(
            homePageCategoryData: _homePageCategoriesData[index],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class HomePageCategoryView extends StatefulWidget {
  late HomePageCategoryData homePageCategoryData;

  HomePageCategoryView({
    Key? key,
    required this.homePageCategoryData,
  }) : super(key: key);

  @override
  _HomePageCategoryViewState createState() => _HomePageCategoryViewState();
}

class _HomePageCategoryViewState extends State<HomePageCategoryView> {
  final PageController _smoothPageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _upperPart(),
        _latestBooksPart(),
        _bestSellingBooksPart(),
        SizedBox(
          height: 2.0.h,
        ),
      ],
    );
  }

  Stack _upperPart() {
    return Stack(
      children: [
        SizedBox(
          height: 18.0.h,
          child: PageView.builder(
            controller: _smoothPageController,
            itemCount: widget.homePageCategoryData.banners.length,
            itemBuilder: (context, index) => Container(
              color: Theme.of(context).primaryColor,
              width: 100.0.w,
              height: 18.0.h,
              child: FadeInImage.assetNetwork(
                placeholder: defaultBanner,
                image: widget.homePageCategoryData.banners[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Center(
          child: Visibility(
            visible: widget.homePageCategoryData.banners.length > 1,
            child: SizedBox(
              width: 100.0.w,
              height: 18.0.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: _smoothPageController,
                    count: widget.homePageCategoryData.banners.length,
                    effect: JumpingDotEffect(
                      activeDotColor: Theme.of(context).primaryColor,
                      dotColor: Colors.white54,
                    ),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column _latestBooksPart() {
    return _latestAndBestSellingBooks(
      'تازه ترین',
      widget.homePageCategoryData.latestBooks,
    );
  }

  Column _bestSellingBooksPart() {
    return _latestAndBestSellingBooks(
      'پر فروش ترین',
      widget.homePageCategoryData.bestSellingBooks,
    );
  }

  Column _latestAndBestSellingBooks(
      String title, List<BookIntroduction> books) {
    return Column(
      children: [
        Card(
          color: Colors.transparent,
          elevation: 0.0,
          shape: const Border(),
          child: ListTile(
            title: Text(
              '$title ${widget.homePageCategoryData.bookCategoryName}',
              style: TextStyle(color: Theme.of(context).primaryColor),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            trailing: OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) {
                      return BooksPage(
                        title:
                            '$title ${widget.homePageCategoryData.bookCategoryName}',
                        books: books,
                      );
                    },
                  ),
                );
              },
              child: const Text(
                'نمایش همه',
              ),
            ),
          ),
        ),
        BooksListView(
          books: books,
        ),
      ],
    );
  }
}
