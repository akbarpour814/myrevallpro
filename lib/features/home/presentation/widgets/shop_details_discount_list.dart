import 'package:customer_club/configs/color_palette.dart';
import 'package:customer_club/core/utils/const.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/core/widgets/my_loading.dart';
import 'package:customer_club/features/home/presentation/blocs/get_discount_list/get_discount_list_bloc.dart';
import 'package:customer_club/features/home/presentation/widgets/shop_details_discount_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopDetailsDiscountList extends StatefulWidget {
  final int shopId;
  const ShopDetailsDiscountList({super.key, required this.shopId});

  @override
  State<ShopDetailsDiscountList> createState() =>
      _ShopDetailsDiscountListState();
}

class _ShopDetailsDiscountListState extends State<ShopDetailsDiscountList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4, left: 4, right: 4),
      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      child: BlocBuilder<GetDiscountListBloc, GetDiscountListState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  'کارت های تخفیفی',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              8.hsb(),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 8,
                      color: Colors.black,
                    ),
                    6.wsb(),
                    Text(
                      'قابل استاده از طریق کارت تخفیف ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      appConfig.appNameFa ?? '',
                      style: TextStyle(
                          color: ColorPalette.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Divider(),
              Expanded(
                  child: state is GetDiscountListLoaded &&
                          state.discountList.isNotEmpty
                      ? SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          padding:
                              EdgeInsets.only(bottom: 80, left: 8, right: 8),
                          child: Column(
                            children: state.discountList
                                .map((e) => ShopDetailsDiscountItem(item: e))
                                .toList(),
                          ),
                        )
                      : state is GetDiscountListLoading
                          ? MyLoading()
                          : Center(
                              child: Text('تخفیفی یافت نشد!'),
                            ))
            ],
          );
        },
      ),
    );
  }
}
