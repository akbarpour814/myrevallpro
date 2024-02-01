import 'package:customer_club/core/widgets/my_loading.dart';
import 'package:customer_club/core/models/shop_details_model/shop_gallery_model.dart';
import 'package:customer_club/features/home/presentation/blocs/get_shop_details/get_shop_details_bloc.dart';
import 'package:customer_club/features/home/presentation/widgets/shop_gallery_row_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopDetailsGallery extends StatefulWidget {
  final int shopId;
  final List<List<ShopGalleryModel>> shopRowList;
  const ShopDetailsGallery(
      {super.key, required this.shopId, required this.shopRowList});

  @override
  State<ShopDetailsGallery> createState() => _ShopDetailsGalleryState();
}

class _ShopDetailsGalleryState extends State<ShopDetailsGallery> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4, left: 4, right: 4),
      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      child: BlocConsumer<GetShopDetailsBloc, GetShopDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  'گالری تصاویر',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Divider(),
              Expanded(
                child: state is GetShopDetailsLoading
                    ? MyLoading()
                    : state is GetShopDetailsLoaded &&
                            (state.shopAllDetailsModel.shop?.shopGallery ?? [])
                                .isNotEmpty
                        ? SingleChildScrollView(
                            padding: EdgeInsets.only(bottom: 80),
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                  widget.shopRowList.length,
                                  (index) => ShopGalleryRowItem(
                                        rowListItem: widget.shopRowList[index],
                                        index: index,
                                      )),
                            ),
                          )
                        : const Center(
                            child: Text('موردی یافت نشد!'),
                          ),
              ),
            ],
          );
        },
      ),
    );
  }
}
