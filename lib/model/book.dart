//------/model
import '/model/book_introduction.dart';
import '/model/text_format.dart';

//------/main
import '/main.dart';

class Book {
  late int id;
  late int type;
  late String slug;
  late String name;
  late String category;
  late String subcategory;
  late String author;
  late String announcer;
  late String fileSize;
  late String publisherOfPrintedVersion;
  late int printedVersionYear;
  late String publisherOfAudioVersion;
  late int audioVersionYear;
  late int numberOfChapters;
  late String numberOfPages;
  late String duration;
  late String price;
  late bool marked;
  late int numberOfVotes;
  late int numberOfStars;
  late String aboutBook;
  late String partOfTheBook;
  late List<Review> reviews;
  late bool reviewed;
  late String demo;
  late String bookCoverPath;
  late List<BookIntroduction> otherBooksByThePublisher;
  late List<BookIntroduction> relatedBooks;

  Book.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> product = json['product'];

    id = product['id'] ?? -1;
    print(product['id']);
    print("product['id']");

    type = product['type'] ?? -1;
    print(product['type']);
    print("product['type']");

    slug = product['slug'] ?? '';
    print(product['slug']);
    print("product['slug']");

    name = product['title'] ?? '';
    print(product['title']);
    print("product['title']");

    category =
        product['category'] == null ? '' : (product['category'])['name'] ?? '';
    print(product['category']);
    print("product['category']");

    subcategory = product['parent_category'] == null
        ? ''
        : (product['parent_category'])['name'] ?? '';
    print(product['parent_category']);
    print("product['parent_category']");

    author = product['author'] == null ? '' : (product['author'])['name'] ?? '';
    print(product['author']);
    print("product['author']");

    announcer =
        product['narrator'] == null ? '' : (product['narrator'])['name'] ?? '';
    print(product['narrator']);
    print("product['narrator']");

    /////////////////////
    fileSize = (product['download_volume'] ?? 0.0).toString();
    print(product['download_volume']);
    print("product['download_volume']");
    //////////////////////

    publisherOfPrintedVersion = product['publisher'] == null
        ? ''
        : (product['publisher'])['name'] ?? '';
    print(product['publisher']);
    print("product['publisher']");

    printedVersionYear = product['publish_year'] ?? 0;
    print(product['publish_year']);
    print("product['publish_year']");

    publisherOfAudioVersion = product['audio_publisher'] == null
        ? ''
        : (product['audio_publisher'])['name'] ?? '';
    print(product['audio_publisher']);
    print("product['audio_publisher']");

    audioVersionYear = product['audio_publish_year'] ?? 0;
    print(product['audio_publish_year']);
    print("product['audio_publish_year']");

    ///////////////////
    numberOfChapters = product['orders_count'] ?? 0;
    print(product['orders_count']);
    print("product['orders_count']");

    numberOfPages = product['page_count'] ?? '';
    print(product['page_count']);
    print("product['page_count']");

    duration = product['duration'] ?? '';
    print(product['duration']);
    print("product['duration']");
    //////////////////////

    //price = PriceFormat.priceFormat(price: int.parse(product['price'] ?? '0'), isFree: true);
    price = product['cast_price'] ?? '';
    print(product['cast_price']);
    print("product['cast_price']");

    //////////////////////////
    marked = markedBooksId.contains(product['id']);

    numberOfVotes = product['vote'] ?? 0;
    print(product['vote']);
    print("product['vote']");

    numberOfStars = double.parse(product['rating'] ?? 0.0).toInt();
    print(product['rating']);
    print("product['rating']");

    aboutBook = product['description'] ?? '';
    print(product['description']);
    print("product['description']");

    aboutBook = TextFormat.textFormat(text: aboutBook);

    partOfTheBook = product['summery'] ?? '';
    print(product['summery']);
    print("product['summery']");
    partOfTheBook = TextFormat.textFormat(text: partOfTheBook);

    /////////////////////////

    reviews = [];
    reviewed = false;
    setReviews(json['reviews'] ?? []);
    print(json['reviews']);
    print("json['reviews']");

    int myReviewIndex = reviews.indexWhere((element) => element.id == userId);

    if (myReviewIndex >= 0) {
      reviewed = true;

      Review myReview = reviews[myReviewIndex];

      reviews.removeAt(myReviewIndex);

      reviews.insert(0, myReview);
    }

    demo = '${storage}books/${product['demo'] ?? ''}';
    print(product['demo']);
    print("product['demo']");

    bookCoverPath = product['image'] == null
        ? defaultBookCover
        : '${storage}books/${product['image']}';
    print(product['image']);
    print("product['image']");

    /////////////////////////////////////////////////////////
    otherBooksByThePublisher = [];
    setOtherBooksByThePublisher(json['more_from_publisher'] ?? []);
    /////////////////////////////////////////////////////////

    relatedBooks = [];
    setRelatedBooks(json['similar'] ?? []);
    print(json['similar']);
    print("json['similar']");
  }

  void setReviews(List<dynamic> reviewsAsMap) {
    for (Map<String, dynamic> review in reviewsAsMap) {
      reviews.add(Review.fromJson(review));
    }
  }

  void setRelatedBooks(List<dynamic> relatedBooksAsMap) {
    for (Map<String, dynamic> book in relatedBooksAsMap) {
      relatedBooks.add(BookIntroduction.fromJson(book));
    }
  }

  void setOtherBooksByThePublisher(
      List<dynamic> otherBooksByThePublisherAsMap) {
    for (Map<String, dynamic> book in otherBooksByThePublisherAsMap) {
      otherBooksByThePublisher.add(BookIntroduction.fromJson(book));
    }
  }
}

class Review {
  late int id;
  late String name;
  late String review;
  late int numberOfStars;

  Review.fromJson(Map<String, dynamic> json) {
    id = (json['User'])['id'];
    name = (json['User'])['name'];
    review = json['review'];
    numberOfStars = json['rating'];
  }
}

class Part {
  late String name;
  late String time;
  late String path;

  Part.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    time = json['timer'];
    path = '${storage}book-files/${json['url']}';
  }
}
