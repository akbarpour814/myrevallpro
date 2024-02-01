import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:customer_club/core/models/shop_model.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/core/utils/my_navigator.dart';
import 'package:flutter/material.dart';

class GridShopItem extends StatefulWidget {
  final ShopModel item;
  const GridShopItem(
    this.item, {
    super.key,
  });

  @override
  State<GridShopItem> createState() => _GridShopItemState();
}

class _GridShopItemState extends State<GridShopItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OpenContainerWrapper(
      item: widget.item,
      onClosed: (_) {},
      transitionType: ContainerTransitionType.fadeThrough,
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return InkWellOverlay(
          openContainer: openContainer,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: [
                CachedNetworkImage(imageUrl: widget.item.shopBg ?? ''),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 30,
                      padding: const EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          gradient: LinearGradient(
                              colors: [
                                Colors.black,
                                Colors.black.withOpacity(0.0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.item.name ?? '',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 3.w(context),
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
