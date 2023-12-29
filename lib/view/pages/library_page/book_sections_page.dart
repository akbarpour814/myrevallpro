//------/dart and flutter packages
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_file/internet_file.dart';

//------/packages
import 'package:ionicons/ionicons.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

//------/controller
import '/controller/custom_dio.dart';
import '/controller/internet_connection.dart';
import '/controller/load_data_from_api.dart';

// //------/model
import '/model/book_introduction.dart';

//------/view/view_models
import '/view/view_models/custom_circular_progress_indicator.dart';
import '/view/view_models/no_internet_connection.dart';

//------/main
import '/main.dart';

// ignore: must_be_immutable
class BookSectionsPage extends StatefulWidget {
  late BookIntroduction book;

  BookSectionsPage({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  _BookSectionsPageState createState() => _BookSectionsPageState();
}

class _BookSectionsPageState extends State<BookSectionsPage>
    with InternetConnection, LoadDataFromAPI {
  late List<Card> _sections;

  @override
  void initState() {
    super.initState();

    _sections = [];
  }

  Future _initSections() async {
    customDio =
        await CustomDio.dio.post('dashboard/books/${widget.book.slug}/audio');

    if ((customDio.statusCode == 200) && (dataIsLoading)) {
      for (Map<String, dynamic> data in customDio.data['data']) {
        _sections.add(
          Card(
            elevation: 0.0,
            shape: Theme.of(context).cardTheme.shape,
            color: null,
            child: ListTile(
              title: Text(
                data['name'],
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              onTap: () {
                if (widget.book.type == 2) {
                  launch('${storage}ebook/${data['url']}');
                } else {
                  // Navigator.of(context).push(
                  //   CupertinoPageRoute(
                  //     builder: (context) {
                  //       return EpubReaderPage(
                  //           path: '${storage}ebook/${data['url']}');
                  //     },
                  //   ),
                  // );
                _initEpub('${storage}ebook/${data['url']}');
                }
              },
            ),
          ),
        );
      }

      dataIsLoading = false;
    }

    return customDio;
  }

  Future _initEpub(String path) async {
    Uint8List _data = await InternetFile.get(path);

    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File file = File(tempPath + '105.epub');
    await file.writeAsBytes(_data);

    VocsyEpub.setConfig(
      themeColor: Theme.of(context).primaryColor,
      identifier: "iosBook",
      scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
      allowSharing: true,
      enableTts: true,
      nightMode: false,
    );

    VocsyEpub.open(
      file.path,
    );
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
      title: Text(widget.book.name),
      automaticallyImplyLeading: false,
      leading: const Icon(
        Ionicons.library_outline,
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
        future: _initSections(),
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
      return SingleChildScrollView(
        child: Column(
          children: _sections,
        ),
      );
    }
  }
}
