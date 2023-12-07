//------/dart and flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//------/packages
import 'package:sizer/sizer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

//------/controller
import '/controller/custom_response.dart';
import '/controller/custom_dio.dart';
import '/controller/internet_connection.dart';
import '/controller/load_data_from_api.dart';

//------/model
import '/model/book_introduction.dart';

//------/view/audio_player_models
import '/view/audio_player_models/audiobook_player_page.dart';

//------/view/view_models
import '/view/view_models/custom_circular_progress_indicator.dart';
import '/view/view_models/custom_smart_refresher.dart';
import '/view/view_models/no_internet_connection.dart';
import '/view/pages/library_page/book_sections_page.dart';

//------/main
import '/main.dart';

bool dataIsLoadingGlobal = true;

class MyLibraryPage extends StatefulWidget {
  static const routeName = '/myLibraryPage';

  const MyLibraryPage({Key? key}) : super(key: key);

  @override
  _MyLibraryPageState createState() => _MyLibraryPageState();
}

class _MyLibraryPageState extends State<MyLibraryPage>
    with InternetConnection, LoadDataFromAPI, Refresher {
  late List<BookIntroduction> _myBooks;
  late List<BookIntroduction> _myBooksTemp;

  @override
  void initState() {
    super.initState();

    _myBooks = [];
    _myBooksTemp = [];
  }

  Future _initMyBooks() async {
    customDio = await CustomDio.dio.get(
      'dashboard/my_books',
      queryParameters: {'page': currentPage},
    );

    if (customDio.statusCode == 200) {
      Map<String, dynamic> data = customDio.data;

      lastPage = data['last_page'];

      if (currentPage == 1) {
        _myBooksTemp.clear();
      }

      for (Map<String, dynamic> bookIntroduction in data['data']) {
        _myBooksTemp.add(BookIntroduction.fromJson(bookIntroduction));
      }

      setState(() {
        refresh = false;
        loading = false;

        _myBooks.clear();
        _myBooks.addAll(_myBooksTemp);

        dataIsLoading = false;
        dataIsLoadingGlobal = false;
      });
    }

    return customDio;
  }

  //bool _secondTime = false;

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
      title: const Text('کتابخانه من'),
      leading: const Icon(
        Ionicons.library_outline,
      ),
    );
  }

  Widget _body() {
    if (dataIsLoadingGlobal) {
      return FutureBuilder(
        future: _initMyBooks(),
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
        dataIsLoadingGlobal = true;
      });

      return const Center(
        child: NoInternetConnection(),
      );
    } else {
      if (_myBooks.isEmpty) {
        return const Center(
          child: Text('کتابی در کتابخانه شما موجود نمی باشد.'),
        );
      } else {
        return CustomSmartRefresher(
          refreshController: refreshController,
          onRefresh: () => onRefresh(() => _initMyBooks()),
          onLoading: () => onLoading(() => _initMyBooks()),
          list: List<InkWell>.generate(
            _myBooks.length,
            (index) => _myBook(_myBooks[index]),
          ),
          listType: 'کتاب',
          refresh: refresh,
          loading: loading,
          lastPage: lastPage,
          currentPage: currentPage,
          dataIsLoading: dataIsLoadingGlobal,
        );
      }
    }
  }

  InkWell _myBook(BookIntroduction book) {
    return InkWell(
      onTap: () {
        if (book.type == 1) {
          if (book.id != previousAudiobookInPlayId) {

            audioPlayerHandler.onTaskRemoved();

            demoOfBookIsPlaying.$ = false;
            demoInPlayId = -1;
            demoPlayer.stop();

            audioPlayerHandler.stop();
            mediaItems.clear();

            audioPlayerHandler.stop();

            audiobookInPlay = book;
            audiobookInPlayId = book.id;
          }

          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) {
                return AudiobookPlayerPage(audiobook: book);
              },
            ),
          );
        } else {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) {
                return BookSectionsPage(book: book);
              },
            ),
          );
        }
      },
      child: Card(
        color: Colors.transparent,
        elevation: 0.0,
        shape: Theme.of(context).cardTheme.shape,
        child: Row(
          children: [
            _bookCover(book),
            _bookShortInformation(book),
          ],
        ),
      ),
    );
  }

  Padding _bookCover(BookIntroduction book) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          shape: BoxShape.rectangle,
        ),
        width: 25.0.w,
        height: 13.0.h,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          child: FadeInImage.assetNetwork(
            placeholder: defaultBookCover,
            image: book.bookCoverPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Expanded _bookShortInformation(BookIntroduction book) {
    return Expanded(
      child: ListTile(
        title: Text(
          book.name,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          book.author,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Visibility(
          visible: book.price == 'رایگان',
          child: _removeFreeBookButton(book),
        ),
      ),
    );
  }

  InkWell _removeFreeBookButton(BookIntroduction book) {
    return InkWell(
      onTap: () {
        _removeFreeBook(book);
      },
      child: Icon(Ionicons.trash_outline),
    );
  }

  void _removeFreeBook(BookIntroduction book) async {
    customDio = await CustomDio.dio.post(
      'dashboard/free/remove',
      data: {'id': book.id},
    );

    if (customDio.statusCode == 200) {
      customResponse = CustomResponse.fromJson(customDio.data);

      setState(() {
        libraryId.remove(book.id);

        dataIsLoadingGlobal = true;
      });
    }
  }
}

// // ignore: must_be_immutable
// class MyBook extends StatefulWidget {
//   late BookIntroduction book;
//
//   MyBook({
//     Key? key,
//     required this.book,
//   }) : super(key: key);
//
//   @override
//   _MyBookState createState() => _MyBookState();
// }
//
// class _MyBookState extends State<MyBook> with LoadDataFromAPI {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         if(widget.book.type == 1) {
//           if (widget.book.id != previousAudiobookInPlayId) {
//             audioPlayerHandler.onTaskRemoved();
//             audioPlayerHandler.seek(Duration(microseconds: 0));
//
//             demoOfBookIsPlaying.$ = false;
//             demoInPlayId = -1;
//             demoPlayer.stop();
//             audioPlayerHandler.stop();
//
//             mediaItems.clear();
//
//             audioPlayerHandler.updateQueue([]);
//             audiobookInPlay = widget.book;
//             audiobookInPlayId = widget.book.id;
//           }
//
//           Navigator.of(context).push(
//             CupertinoPageRoute(
//               builder: (context) {
//                 return AudiobookPlayerPage(audiobook: widget.book);
//               },
//             ),
//           );
//         } else {
//           Navigator.of(context).push(
//             CupertinoPageRoute(
//               builder: (context) {
//                 return BookSectionsPage(book: widget.book);
//               },
//             ),
//           );
//         }
//       },
//       child: Card(
//         color: Colors.transparent,
//         elevation: 0.0,
//         shape: Theme.of(context).cardTheme.shape,
//         child: Row(
//           children: [
//             _bookCover(),
//             _bookShortInformation(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Padding _bookCover() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(color: Theme.of(context).primaryColor),
//           borderRadius: const BorderRadius.all(
//             Radius.circular(5.0),
//           ),
//           shape: BoxShape.rectangle,
//         ),
//         width: 25.0.w,
//         height: 13.0.h,
//         child: ClipRRect(
//           borderRadius: const BorderRadius.all(
//             Radius.circular(5.0),
//           ),
//           child: FadeInImage.assetNetwork(
//             placeholder: defaultBookCover,
//             image: widget.book.bookCoverPath,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Expanded _bookShortInformation() {
//     return Expanded(
//       child: ListTile(
//         title: Text(
//           widget.book.name,
//           overflow: TextOverflow.ellipsis,
//         ),
//         subtitle: Text(
//           widget.book.author,
//           overflow: TextOverflow.ellipsis,
//         ),
//         trailing: Visibility(
//           visible: widget.book.price == 'رایگان',
//           child: _removeFreeBookButton(),
//         ),
//       ),
//     );
//   }
//
//   InkWell _removeFreeBookButton() {
//     return InkWell(
//       onTap: () {
//         _removeFreeBook();
//       },
//       child: Icon(Ionicons.trash_outline),
//     );
//   }
//
//   void _removeFreeBook() async {
//     customDio = await CustomDio.dio.post(
//       'dashboard/free/remove',
//       data: {'id': widget.book.id},
//     );
//
//     if (customDio.statusCode == 200) {
//       customResponse = CustomResponse.fromJson(customDio.data);
//
//       setState(() {
//         libraryId.remove(widget.book.id);
//
//         dataIsLoadingGlobal = true;
//       });
//     }
//   }
// }
