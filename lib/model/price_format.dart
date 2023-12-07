//------/packages
import 'package:persian_number_utility/persian_number_utility.dart';

class PriceFormat {
  static String priceFormat({required int price, required bool isFree}) {
    if ((isFree) && (price == 0)) {
      return 'رایگان';
    } else if ((!isFree) && (price == 0)) {
      return 'بدون تخفیف';
    } else {
      return '${price.toString().seRagham()} تومان';
    }
  }
}
