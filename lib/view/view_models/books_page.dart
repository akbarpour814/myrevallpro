//------/dart and flutter packages
import 'package:flutter/material.dart';

//------/packages
import 'package:ionicons/ionicons.dart';

//------/model
import '/model/book_introduction.dart';

//------/view/view_models
import '/view/view_models/book_short_introduction.dart';

//------/main
import '/main.dart';

// ignore: must_be_immutable
class BooksPage extends StatefulWidget {
  late String title;
  late List<BookIntroduction> books;

  BooksPage({
    Key? key,
    required this.title,
    required this.books,
  }) : super(key: key);

  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
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
      title: Text(widget.title),
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

  SingleChildScrollView _body() {
    return SingleChildScrollView(
      child: Column(
        children: List<BookShortIntroduction>.generate(
          widget.books.length,
          (index) => BookShortIntroduction(
            book: widget.books[index],
          ),
        ),
      ),
    );
  }
}
