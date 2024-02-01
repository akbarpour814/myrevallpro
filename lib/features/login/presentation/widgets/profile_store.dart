import 'package:customer_club/core/models/shop_details_model/shop_detail_model.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/core/utils/my_icons.dart';
import 'package:customer_club/core/utils/my_navigator.dart';
import 'package:customer_club/core/widgets/my_icon_button.dart';
import 'package:customer_club/features/home/presentation/widgets/star_widget.dart';
import 'package:customer_club/features/login/presentation/screens/scan_user_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileStore extends StatelessWidget {
  final void Function() onScan;
  final ShopDetailModel shop;
  final bool canScanQr;
  const ProfileStore(
      {super.key,
      required this.shop,
      required this.canScanQr,
      required this.onScan});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('فروشگاه شما'),
        8.hsb(),
        Container(
          height: 80,
          margin: EdgeInsets.only(bottom: 40),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade200),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.horizontal(right: Radius.circular(8)),
                    image: DecorationImage(
                        image: NetworkImage(shop.shopImg ?? ''))),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          shop.name ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        if (canScanQr)
                          MyIconButton(
                              onTap: () => MyNavigator.push(
                                  context, ScanUserCardScreen(onScan: onScan)),
                              child: SvgPicture.string(
                                MyIcons.scanBlack,
                                width: 20,
                              ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        StarWidget(
                          star: (shop.rating ?? 0),
                          secondColor: true,
                          size: 20,
                        )
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ],
    );
  }
}
