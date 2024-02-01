import 'package:animations/animations.dart';
import 'package:customer_club/core/models/shop_model.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/core/utils/my_navigator.dart';
import 'package:customer_club/features/home/presentation/widgets/star_widget.dart';
import 'package:flutter/material.dart';

class VerticalShopItem extends StatelessWidget {
  final bool goSurveyTab;
  final ShopModel item;
  final void Function()? onCommentAdd;
  const VerticalShopItem(
    this.item, {
    super.key,
    this.goSurveyTab = false,
    this.onCommentAdd,
  });

  @override
  Widget build(BuildContext context) {
    return OpenContainerWrapper(
        item: item,
        goSurveyTab: goSurveyTab,
        onCommentAdd: onCommentAdd,
        onClosed: (_) {},
        transitionType: ContainerTransitionType.fadeThrough,
        closedBuilder: (BuildContext _, VoidCallback openContainer) {
          return InkWellOverlay(
            openContainer: openContainer,
            child: Container(
              height: 56.w(context),
              width: double.infinity,
              margin: const EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(item.shopBg ?? '')),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                        right: 4, top: 8, bottom: 8, left: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.black.withOpacity(0.5),
                              Colors.black.withOpacity(0.1)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.name ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            StarWidget(star: (item.rating ?? 0))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
