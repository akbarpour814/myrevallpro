//------/model
import '/model/book_introduction.dart';

class HomePageCategoryData {
  late String bookCategoryName;
  late List<String> banners;
  late List<BookIntroduction> latestBooks;
  late List<BookIntroduction> bestSellingBooks;

  HomePageCategoryData.fromJson(
      this.bookCategoryName, Map<String, dynamic> json) {
    banners = [];
    banners.add(json['banner']);

    latestBooks = [];
    for (Map<String, dynamic> bookIntroduction in json['new']) {
      latestBooks.add(BookIntroduction.fromJson(bookIntroduction));
    }

    bestSellingBooks = [];
    for (Map<String, dynamic> bookIntroduction in json['sell']) {
      bestSellingBooks.add(BookIntroduction.fromJson(bookIntroduction));
    }
  }
}
