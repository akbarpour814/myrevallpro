import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/core/utils/my_navigator.dart';
import 'package:customer_club/core/models/shop_details_model/shop_gallery_model.dart';
import 'package:customer_club/features/home/presentation/screens/image_full_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShopGalleryRowItem extends StatelessWidget {
  final List<ShopGalleryModel> rowListItem;
  final int index;
  const ShopGalleryRowItem(
      {super.key, required this.rowListItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return index.isEven
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: rowListItem
                .map((e) => Expanded(
                      child: SizedBox(
                        height: 31.w(context),
                        child: _imageItem(e),
                      ),
                    ))
                .toList(),
          )
        : Directionality(
            textDirection:
                (index + 1) % 4 == 0 ? TextDirection.ltr : TextDirection.rtl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 60.w(context),
                      child: Column(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 31.w(context),
                              child: _imageItem(rowListItem.first),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 31.w(context),
                              child: rowListItem.length > 1
                                  ? _imageItem(rowListItem[1])
                                  : Center(),
                            ),
                          )
                        ],
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 60.w(context),
                      child: rowListItem.length > 2
                          ? _imageItem(rowListItem[2])
                          : Center(),
                    ))
              ],
            ),
          );
  }

  Widget _imageItem(ShopGalleryModel e) {
    return _OpenContainerWrapper(
        item: e,
        onClosed: (_) {},
        transitionType: ContainerTransitionType.fadeThrough,
        closedBuilder: (BuildContext _, VoidCallback openContainer) {
          return InkWellOverlay(
            openContainer: openContainer,
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: e.image ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        });
  }
}

class _OpenContainerWrapper extends StatelessWidget {
  const _OpenContainerWrapper({
    required this.closedBuilder,
    required this.transitionType,
    required this.onClosed,
    required this.item,
  });

  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final ClosedCallback<bool?> onClosed;
  final ShopGalleryModel item;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return ImageFullScreen(
          item: item,
        );
      },
      onClosed: onClosed,
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}
