//------/dart and flutter packages
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:internet_file/internet_file.dart';
import 'package:kaghaze_souti/view/pages/profile_page/cart_page.dart';
import 'package:path_provider/path_provider.dart';

//------/packages
import 'package:sizer/sizer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:just_audio/just_audio.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

//------/controller
import '/controller/custom_dio.dart';
import '/controller/custom_response.dart';
import '/controller/internet_connection.dart';
import '/controller/load_data_from_api.dart';

//------/model
import '/model/book.dart';
import '/model/book_introduction.dart';

//------/view/view_models
import '/view/view_models/books_list_view.dart';
import '/view/view_models/books_page.dart';
import '/view/view_models/custom_circular_progress_indicator.dart';
import '/view/view_models/custom_snack_bar.dart';
import '/view/view_models/display_of_details.dart';
import '/view/view_models/no_internet_connection.dart';
import '/view/view_models/epub_reader_page.dart';
import '/view/view_models/property.dart';
import '/view/view_models/show_stars.dart';

//------/main
import '/main.dart';

// ignore: must_be_immutable
class BookIntroductionPage extends StatefulWidget {
  late BookIntroduction book;

  BookIntroductionPage({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  _BookIntroductionPageState createState() => _BookIntroductionPageState();
}

class _BookIntroductionPageState extends State<BookIntroductionPage>
    with
        TickerProviderStateMixin,
        InternetConnection,
        LoadDataFromAPI,
        DisplayOfDetails {
  late Book _book;

  late TabController _tabController;
  late int _tabIndex;

  late TextEditingController _commentController;
  String? _commentError;
  late int _numberOfStarsForComment;
  late List<bool> _starsForComment;
  late bool _availableInBookCart;

  late bool _commentRegistrationClick;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    _tabIndex = 0;

    _commentController = TextEditingController();
    _numberOfStarsForComment = 0;
    _starsForComment = List<bool>.generate(5, (index) => false);

    _commentRegistrationClick = true;
  }

  Future _initBook() async {
    customDio = await CustomDio.dio.post('books/${widget.book.slug}');

    if (customDio.statusCode == 200) {
      customResponse = CustomResponse.fromJson(customDio.data);

      setState(() {
        _book = Book.fromJson(customResponse.data);

        _availableInBookCart = bookCartSlug.contains(_book.slug);

        displayOfDetails = List<bool>.generate(
          _book.reviews.length,
          (index) => false,
        );

        dataIsLoading = false;
      });
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
      title: Text(widget.book.name),
      leading: InkWell(
        child: Icon(
          Ionicons.bookmark_outline,
          color: markedBooksId.contains(widget.book.id)
              ? Colors.pinkAccent
              : Colors.white,
        ),
        onTap: () {
          if ((!dataIsLoading) &&
              (connectionStatus != ConnectivityResult.none)) {
            setState(() {
              _setMarkedBooks();

              if (markedBooksId.contains(widget.book.id)) {
                markedBooksId.remove(widget.book.id);
              } else {
                markedBooksId.add(widget.book.id);
              }
            });
          }
        },
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

  void _setMarkedBooks() async {
    await CustomDio.dio.post(
      'dashboard/users/wish',
      data: {'book_id': _book.id},
    );
  }

  Widget _body() {
    if (dataIsLoading) {
      return FutureBuilder(
        future: _initBook(),
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
      return RefreshIndicator(
        onRefresh: () {
          setState(() {
            dataIsLoading = true;
          });

          return _initBook();
        },
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 5.0.w,
              ),
              child: Column(
                children: [
                  _bookCover(),
                  _bookPricesAndVotes(),
                  _cartButton(),
                  _addToLibraryButton(),
                  _goToCartPageButton(),
                  _tabsTopic(),
                  _tab(_tabIndex),
                ],
              ),
            ),
            _relatedBooks(),
            _otherPublisherBooks(),
            _userComments(),
          ],
        ),
      );
    }
  }

  Stack _bookCover() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
            shape: BoxShape.rectangle,
          ),
          width: 70.0.w,
          height: 70.0.w,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
            child: FadeInImage.assetNetwork(
              placeholder: defaultBookCover,
              image: _book.bookCoverPath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Visibility(
          visible: _book.type == 1,
          child: Positioned(
            left: 2.5.w,
            bottom: 2.5.w,
            child: !demoOfBookIsPlaying.of(context) ||
                    (demoInPlayId != _book.id)
                ? FloatingActionButton(
                    child: const Icon(Ionicons.play_outline),
                    onPressed: () {
                      setState(() {
                        demoOfBookIsPlaying.$ = true;
                        demoInPlayId = _book.id;
                        demoPlayer.setUrl(_book.demo);

                        audioPlayerHandler.stop();
                      });
                    },
                  )
                : StreamBuilder<PlayerState>(
                    stream: demoPlayer.playerStateStream,
                    builder: (context, snapshot) {
                      final playerState = snapshot.data;
                      final processingState = playerState?.processingState;
                      final playing = playerState?.playing;

                      if ((processingState == ProcessingState.loading) ||
                          (processingState == ProcessingState.buffering)) {
                        return const FloatingActionButton(
                          onPressed: null,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      } else if (playing != true) {
                        return FloatingActionButton(
                          child: const Icon(Ionicons.play_outline),
                          onPressed: demoPlayer.play,
                        );
                      } else if (processingState == ProcessingState.completed) {
                        demoOfBookIsPlaying.$ = false;
                        demoInPlayId = -1;
                        demoPlayer.stop();

                        return FloatingActionButton(
                          child: const Icon(Ionicons.play_outline),
                          onPressed: demoPlayer.play,
                        );
                      } else {
                        return FloatingActionButton(
                          child: const Icon(Ionicons.pause_outline),
                          onPressed: demoPlayer.pause,
                        );
                      }
                    },
                  ),
          ),
        ),
        Visibility(
          visible: _book.type != 1,
          child: Positioned(
            left: 2.5.w,
            bottom: 2.5.w,
            child: FloatingActionButton(
              child: const Icon(Ionicons.document_text_outline),
              onPressed: () {
                if (_book.type == 2) {
                  launch(_book.demo);

                  // Navigator.of(context).push(
                  //   CupertinoPageRoute(
                  //     builder: (context) {
                  //       return PdfReaderPage(path: _book.demo);
                  //     },
                  //   ),
                  // );
                } else {
                  // Navigator.of(context).push(
                  //   CupertinoPageRoute(
                  //     builder: (context) {
                  //       return EpubReaderPage(path: _book.demo);
                  //     },
                  //   ),
                  // );
                  _initEpub(_book.demo);
                }
              },
            ),
          ),
        ),
      ],
    );
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

  Padding _bookPricesAndVotes() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: 70.0.w,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShowStars(
                  numberOfStars: _book.numberOfStars,
                ),
                Text(
                  '${_book.numberOfVotes.toString()} رای',
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
            Text(
              libraryId.contains(_book.id) ? 'موجود در کتابخانه' : _book.price,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }

  Visibility _cartButton() {
    return Visibility(
      visible:
          (!libraryId.contains(_book.id)) && (!_book.price.contains('رایگان')),
      child: SizedBox(
        width: 100.0.w - (2 * 5.0.w),
        height: 5.5.h,
        child: ElevatedButton.icon(
          onPressed: () {
            _setBookCart();
          },
          label: Text(
              _availableInBookCart ? 'حذف از سبد خرید' : 'افزودن به سبد خرید'),
          icon: Icon(
            _availableInBookCart
                ? Ionicons.bag_remove_outline
                : Ionicons.bag_add_outline,
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(5.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _setBookCart() async {
    setState(() {
      if (_availableInBookCart) {
        bookCartSlug.remove(_book.slug);

        _availableInBookCart = false;
      } else {
        bookCartSlug.add(_book.slug);

        _availableInBookCart = true;
      }
    });

    await sharedPreferences.setStringList('bookCartSlug', bookCartSlug);
  }

  Visibility _goToCartPageButton() {
    return Visibility(
      visible: _availableInBookCart,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: SizedBox(
          width: 100.0.w - (2 * 5.0.w),
          height: 5.5.h,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) {
                    return CartPage();
                  },
                ),
              );
            },
            label: Text('رفتن به سبد خرید'),
            icon: Icon(
              Ionicons.bag_outline,
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Visibility _addToLibraryButton() {
    return Visibility(
      visible:
          (!libraryId.contains(_book.id)) && (_book.price.contains('رایگان')),
      child: SizedBox(
        width: 100.0.w - (2 * 5.0.w),
        height: 5.5.h,
        child: ElevatedButton.icon(
          onPressed: () {
            _addToLibrary();
          },
          label: const Text('افزودن به کتابخانه'),
          icon: const Icon(Ionicons.library_outline),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(5.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _addToLibrary() async {
    customDio = await CustomDio.dio.post(
      'dashboard/free/add',
      data: {'id': _book.id},
    );

    if (customDio.statusCode == 200) {
      customResponse = CustomResponse.fromJson(customDio.data);

      setState(() {
        libraryId.add(_book.id);

        dataIsLoading = true;
      });
    }
  }

  Padding _tabsTopic() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        borderRadius: libraryId.contains(_book.id)
            ? const BorderRadius.vertical(top: Radius.circular(5.0))
            : null,
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            controller: _tabController,
            indicatorWeight: 3.0,
            tabs: const <Tab>[
              Tab(
                text: 'مشخصات',
              ),
              Tab(
                text: 'درباره کتاب',
              ),
              Tab(
                text: 'نظرات',
              ),
            ],
            onTap: (index) {
              setState(() {
                _tabIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _tab(int index) {
    OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
      ),
      borderRadius: BorderRadius.circular(5.0),
    );

    Container _bookIntroduction = Container(
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(5.0)),
      ),
      child: Column(
        children: [
          Visibility(
            visible: _book.name.isNotEmpty,
            child: Property(
              property: 'نام',
              value: _book.name,
              valueInTheEnd: false,
              lastProperty: false,
            ),
          ),
          Visibility(
            visible:
                (_book.category.isNotEmpty) && (_book.subcategory.isNotEmpty),
            child: Property(
              property: 'دسته',
              value: '${_book.category} - ${_book.subcategory}',
              valueInTheEnd: false,
              lastProperty: false,
            ),
          ),
          Visibility(
            visible: _book.author.isNotEmpty,
            child: Property(
              property: 'نویسنده',
              value: _book.author,
              valueInTheEnd: false,
              lastProperty: false,
            ),
          ),
          Visibility(
            visible: _book.announcer.isNotEmpty && _book.type == 1,
            child: Property(
              property: 'گوینده',
              value: _book.announcer,
              valueInTheEnd: false,
              lastProperty: false,
            ),
          ),
          Visibility(
            visible: _book.fileSize != '0.0',
            child: Property(
              property: 'حجم دانلود',
              value: _book.fileSize.toString(),
              valueInTheEnd: false,
              lastProperty: false,
            ),
          ),
          Visibility(
            visible: _book.publisherOfPrintedVersion.isNotEmpty,
            child: Property(
              property: 'ناشر چاپی',
              value: _book.publisherOfPrintedVersion,
              valueInTheEnd: false,
              lastProperty: false,
            ),
          ),
          Visibility(
            visible: _book.printedVersionYear != 0,
            child: Property(
              property: 'سال انتشار چاچی',
              value: _book.printedVersionYear.toString(),
              valueInTheEnd: false,
              lastProperty: false,
            ),
          ),
          Visibility(
            visible:
                _book.publisherOfAudioVersion.isNotEmpty && _book.type == 1,
            child: Property(
              property: 'ناشر صوتی',
              value: _book.publisherOfAudioVersion,
              valueInTheEnd: false,
              lastProperty: false,
            ),
          ),
          Visibility(
            visible: _book.audioVersionYear != 0 && _book.type == 1,
            child: Property(
              property: 'سال انتشار صوت',
              value: _book.audioVersionYear.toString(),
              valueInTheEnd: false,
              lastProperty: false,
            ),
          ),
          Visibility(
            visible: _book.numberOfChapters != 0,
            child: Property(
              property: 'تعداد فصل',
              value: _book.numberOfChapters.toString(),
              valueInTheEnd: false,
              lastProperty: false,
            ),
          ),
          Visibility(
            visible: _book.numberOfPages.isNotEmpty,
            child: Property(
              property: 'تعداد صفحات',
              value: _book.numberOfPages.toString(),
              valueInTheEnd: false,
              lastProperty: false,
            ),
          ),
          Visibility(
            visible: _book.duration.isNotEmpty,
            child: Property(
              property: 'زمان پخش یا مطالعه',
              value: _book.duration,
              valueInTheEnd: false,
              lastProperty: false,
            ),
          ),
          Visibility(
            visible: _book.price.isNotEmpty,
            child: Property(
              property: 'مبلغ',
              value: _book.price,
              valueInTheEnd: false,
              lastProperty: true,
            ),
          ),
        ],
      ),
    );
    Container _aboutBook = Container(
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(5.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _book.aboutBook,
            textAlign: TextAlign.justify,
          ),
          Center(
            child: Divider(
              height: 10.0.h,
            ),
          ),
          Center(
            child: Text(
              'قسمتی از کتاب ${_book.name}',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 2.5.h,
          ),
          Text(
            _book.partOfTheBook,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
    Visibility _comments = Visibility(
      visible: !_book.reviewed,
      child: Container(
        padding: const EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(5.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'نظر شما:',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<InkWell>.generate(
                  5,
                  (index) => InkWell(
                    onTap: () {
                      setState(() {
                        if (_starsForComment[index]) {
                          _starsForComment[index] = false;

                          _numberOfStarsForComment--;
                        } else {
                          _starsForComment[index] = true;

                          _numberOfStarsForComment++;
                        }
                      });
                    },
                    child: Icon(
                      Icons.star,
                      size: 25.0.sp,
                      color: _starsForComment[index]
                          ? Colors.amber
                          : Colors.amber.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  errorText: _commentError,
                  hintText: 'لطفاً نظر خود را بنویسید.',
                  border: _outlineInputBorder,
                  focusedBorder: _outlineInputBorder,
                  disabledBorder: _outlineInputBorder,
                  enabledBorder: _outlineInputBorder,
                  errorBorder: _outlineInputBorder,
                  focusedErrorBorder: _outlineInputBorder,
                ),
                maxLines: 8,
                cursorColor: Theme.of(context).dividerColor.withOpacity(0.6),
                cursorWidth: 1.0,
                onChanged: (String text) {
                  setState(() {
                    if (_commentController.text.isEmpty) {
                      _commentError = null;
                    } else if (_commentController.text.length < 3) {
                      _commentError = 'نظر شما باید بیش از حرف داشته باشد.';
                    } else {
                      _commentError = null;
                    }
                  });
                },
              ),
            ),
            Center(
              child: Center(
                child: SizedBox(
                  width: 100.0.w - (2 * 18.0) - (2 * 5.0.w),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        if ((_commentController.text.isEmpty) &&
                            (_numberOfStarsForComment == 0)) {
                          _commentError =
                              'لطفاً نظر خود را به همراه رأی بنویسید.';
                        } else if (_commentController.text.isEmpty) {
                          _commentError = 'لطفاً نظر خود را بنویسید.';
                        } else if (_commentController.text.length < 3) {
                          _commentError = 'نظر شما باید بیش از حرف داشته باشد.';
                        } else if (_numberOfStarsForComment == 0) {
                          _commentError = 'لطفاً رأی هم بدهید.';
                        } else {
                          _commentError = null;

                          if (_commentRegistrationClick) {
                            _commentRegistration();
                          }
                        }
                      });
                    },
                    label: Text(
                      _commentRegistrationClick
                          ? 'ثبت نظر'
                          : 'لطفاً شکیبا باشید.',
                    ),
                    icon: const Icon(Ionicons.checkmark_outline),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    late final List<Widget> _tabs = [
      _bookIntroduction,
      _aboutBook,
      _comments,
    ];

    return _tabs[index];
  }

  void _commentRegistration() async {
    setState(() {
      _commentRegistrationClick = false;
    });

    customDio = await CustomDio.dio.post(
      'dashboard/books/${_book.slug}/review',
      data: {
        'comment': _commentController.text,
        'rate': _numberOfStarsForComment,
      },
    );

    if (customDio.statusCode == 200) {
      setState(() {
        _commentController = TextEditingController();
        _numberOfStarsForComment = 0;
        _starsForComment = List<bool>.generate(5, (index) => false);
        dataIsLoading = true;
        _tabIndex = 2;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          context,
          Ionicons.checkmark_done_outline,
          'نظر شما با موفقیت ثبت شد.',
          4,
        ),
      );
    } else {
      setState(() {
        _commentRegistrationClick = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          context,
          Ionicons.refresh_outline,
          'لطفاً دوباره امتحان کنید.',
          4,
        ),
      );
    }
  }

  Visibility _otherPublisherBooks() {
    return Visibility(
      visible: (_book.otherBooksByThePublisher.isNotEmpty) && (_tabIndex != 2),
      child: _otherBooks(
        'کتاب های دیگر ناشر',
        _book.otherBooksByThePublisher,
      ),
    );
  }

  Visibility _relatedBooks() {
    return Visibility(
      visible: (_book.relatedBooks.isNotEmpty) && (_tabIndex != 2),
      child: _otherBooks(
        'کتاب های مرتبط',
        _book.relatedBooks,
      ),
    );
  }

  Padding _otherBooks(String title, List<BookIntroduction> books) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) {
                              return BooksPage(
                                title:
                                    '$title${title.contains('مرتبط') ? ' با' : ''} کتاب ${_book.name}',
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
                  ],
                ),
                Divider(
                  height: 4.0.h,
                ),
              ],
            ),
          ),
          BooksListView(books: books)
        ],
      ),
    );
  }

  Visibility _userComments() {
    return Visibility(
      visible: (_book.reviews.isNotEmpty) && (_tabIndex == 2),
      child: Padding(
        padding: EdgeInsets.only(
          left: 5.0.w,
          top: 0.0,
          right: 5.0.w,
          bottom: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'نظرات کاربران',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            Divider(
              height: 4.0.h,
            ),
            Column(
              children: List.generate(
                _book.reviews.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    top: 0.0,
                    bottom: index == _book.reviews.length - 1 ? 0.0 : 8.0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 18.0,
                      top: 18.0,
                      right: 18.0,
                      bottom: 8.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_book.reviews[index].id == userId
                                ? 'نظر شما'
                                : _book.reviews[index].name),
                            ShowStars(
                              numberOfStars: _book.reviews[index].numberOfStars,
                            ),
                          ],
                        ),
                        Visibility(
                          visible: displayOfDetails[index],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Divider(
                                height: 24.0,
                              ),
                              Text(
                                '- ${_book.reviews[index].review}',
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 24.0,
                        ),
                        InkWell(
                          onTap: () => display(index),
                          child: Icon(
                            displayOfDetails[index]
                                ? Icons.expand_less
                                : Icons.expand_more,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
