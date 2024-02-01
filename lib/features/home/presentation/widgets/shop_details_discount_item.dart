import 'package:cached_network_image/cached_network_image.dart';
import 'package:customer_club/configs/color_palette.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/features/home/data/models/discount_model.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ShopDetailsDiscountItem extends StatelessWidget {
  final DiscountModel item;
  const ShopDetailsDiscountItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Colors.grey.shade100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: item.image ?? '',
                width: 24.w(context),
                height: 24.w(context),
              ),
              12.wsb(),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.hsb(),
                  Text(
                    (item.title ?? '').toString().toPersianDigit(),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  4.hsb(),
                  Text(
                    (item.description ?? '').toString().toPersianDigit(),
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  )
                ],
              )),
              SizedBox(
                height: 24.w(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: ColorPalette.primaryColor,
                          borderRadius: BorderRadius.circular(4)),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Text(
                        '${item.offerPercent ?? '0'}%'.toPersianDigit(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
