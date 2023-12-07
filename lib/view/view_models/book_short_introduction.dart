//------/dart and flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//------/packages
import 'package:sizer/sizer.dart';

//------/model
import '/model/book_introduction.dart';

//------/view/pages/search_page
import '/view/pages/search_page/search_page.dart';

//------/view/view_models
import '/view/view_models/book_introduction_page.dart';
import '/view/view_models/show_stars.dart';

//------/main
import '/main.dart';

// ignore: must_be_immutable
class BookShortIntroduction extends StatefulWidget {
  late BookIntroduction book;
  late SearchTopic? searchTopic;
  late String? searchKey;

  BookShortIntroduction({
    Key? key,
    required this.book,
    this.searchTopic,
    this.searchKey,
  }) : super(key: key);

  @override
  _BookShortIntroductionState createState() => _BookShortIntroductionState();
}

class _BookShortIntroductionState extends State<BookShortIntroduction> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) {
              return BookIntroductionPage(
                book: widget.book,
              );
            },
          ),
        );
      },
      child: Card(
        color: Colors.transparent,
        elevation: 0.0,
        shape: Theme.of(context).cardTheme.shape,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _bookCover(),
            ),
            Expanded(
              child: SizedBox(
                height: 13.0.h,
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _bookName(),
                      _numberOfVotes(context),
                    ],
                  ),
                  subtitle: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _author(context),
                          _numberOfStars(context),
                        ],
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _publisherOfPrintedVersion(context),
                          _price(context),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _bookCover() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
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
          image: widget.book.bookCoverPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Flexible _bookName() {
    String _name = widget.book.name;
    String _searchKey = widget.searchKey ?? '';
    int start = _name.indexOf(_searchKey);
    int end = _name.indexOf(_searchKey) + _searchKey.length;

    if (widget.searchTopic == SearchTopic.name) {
      return Flexible(
        child: Text.rich(
          TextSpan(text: '', children: <InlineSpan>[
            TextSpan(
              text: _name.substring(0, start),
            ),
            TextSpan(
                text: _name.substring(start, end),
                style: const TextStyle(color: Colors.pinkAccent)),
            TextSpan(
              text: _name.substring(end, _name.length),
            ),
          ]),
          overflow:
              _searchKey.isEmpty ? TextOverflow.ellipsis : TextOverflow.visible,
        ),
      );
    } else {
      return Flexible(
        child: Text(
          widget.book.name,
          style: const TextStyle(overflow: TextOverflow.ellipsis),
        ),
      );
    }
  }

  Flexible _numberOfVotes(BuildContext context) {
    return Flexible(
      child: Text(
        '${widget.book.numberOfVotes.toString()} رای',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }

  Flexible _author(BuildContext context) {
    String _author = widget.book.author;
    String _searchKey = widget.searchKey ?? '';
    int start = _author.indexOf(_searchKey);
    int end = _author.indexOf(_searchKey) + _searchKey.length;

    if (widget.searchTopic == SearchTopic.author) {
      return Flexible(
        child: Text.rich(
          TextSpan(text: '', children: <InlineSpan>[
            TextSpan(
              text: _author.substring(0, start),
            ),
            TextSpan(
                text: _author.substring(start, end),
                style: const TextStyle(color: Colors.pinkAccent)),
            TextSpan(
              text: _author.substring(end, _author.length),
            ),
          ]),
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(overflow: TextOverflow.ellipsis),
          overflow:
              _searchKey.isEmpty ? TextOverflow.ellipsis : TextOverflow.visible,
        ),
      );
    } else {
      return Flexible(
        child: Text(
          widget.book.author,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(overflow: TextOverflow.ellipsis),
        ),
      );
    }
  }

  Flexible _numberOfStars(BuildContext context) {
    return Flexible(
      child: ShowStars(
        numberOfStars: widget.book.numberOfStars,
      ),
    );
  }

  Flexible _publisherOfPrintedVersion(BuildContext context) {
    String _publisherOfPrintedVersion = widget.book.publisherOfPrintedVersion;
    String _searchKey = widget.searchKey ?? '';
    int start = _publisherOfPrintedVersion.indexOf(_searchKey);
    int end =
        _publisherOfPrintedVersion.indexOf(_searchKey) + _searchKey.length;

    if (widget.searchTopic == SearchTopic.publisherOfPrintedVersion) {
      return Flexible(
        child: Text.rich(
          TextSpan(text: '', children: <InlineSpan>[
            TextSpan(
              text: _publisherOfPrintedVersion.substring(0, start),
            ),
            TextSpan(
                text: _publisherOfPrintedVersion.substring(start, end),
                style: const TextStyle(color: Colors.pinkAccent)),
            TextSpan(
              text: _publisherOfPrintedVersion.substring(
                  end, _publisherOfPrintedVersion.length),
            ),
          ]),
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(overflow: TextOverflow.ellipsis),
          overflow:
              _searchKey.isEmpty ? TextOverflow.ellipsis : TextOverflow.visible,
        ),
      );
    } else {
      return Flexible(
        child: Text(
          widget.book.publisherOfPrintedVersion,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(overflow: TextOverflow.ellipsis),
        ),
      );
    }
  }

  Flexible _price(BuildContext context) {
    return Flexible(
      child: Text(
        widget.book.price,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
