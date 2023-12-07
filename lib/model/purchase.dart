//------/dart and flutter packages
import 'package:flutter/material.dart';

//------/model
import '/model/book_introduction.dart';
import '/model/date_time_format.dart';
import '/model/price_format.dart';

class Purchase {
  late int id;
  late String couponDiscount;
  late String totalPrice;
  late String finalPrice;
  late int finalPriceInt;
  late String date;
  late PurchaseStatus status;
  late List<BookIntroduction> books;

  Purchase.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    couponDiscount = PriceFormat.priceFormat(
        price: json['coupon_discount'] ?? 0, isFree: false);
    totalPrice =
        PriceFormat.priceFormat(price: json['total_price'] ?? 0, isFree: true);
    finalPrice =
        PriceFormat.priceFormat(price: json['final_price'] ?? 0, isFree: true);
    finalPriceInt = json['final_price'] ?? 0;
    date = DateTimeFormat.dateTimeFormat(date: json['created_at']);

    String statusTemp = json['real_status'];
    status = statusTemp == 'پرداخت شده'
        ? PurchaseStatus.bought
        : PurchaseStatus.waiting;

    books = [];
    for (Map<String, dynamic> bookIntroduction in json['items']) {
      books.add(BookIntroduction.fromJson(bookIntroduction['book']));
    }
  }
}

enum PurchaseStatus { bought, waiting, cancelled }

extension PurchaseStatusExtension on PurchaseStatus {
  static const Map<PurchaseStatus, String> statusOfPurchases = {
    PurchaseStatus.bought: 'پرداخت شده',
    PurchaseStatus.waiting: 'پرداخت نشده',
    PurchaseStatus.cancelled: 'لغو خرید',
  };

  static const Map<PurchaseStatus, Color> statusColorOfPurchase = {
    PurchaseStatus.bought: Colors.lightGreen,
    PurchaseStatus.waiting: Colors.grey,
    PurchaseStatus.cancelled: Colors.redAccent,
  };

  String? get title => statusOfPurchases[this];

  Color? get color => statusColorOfPurchase[this];
}
