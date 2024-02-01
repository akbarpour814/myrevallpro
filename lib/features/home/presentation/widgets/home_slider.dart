import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:customer_club/configs/color_palette.dart';
import 'package:customer_club/core/utils/custom_page_route.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/features/home/data/models/slider_model.dart';
import 'package:customer_club/features/home/presentation/screens/shop_details_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSlider extends StatefulWidget {
  final List<SliderModel> sliderItems;
  const HomeSlider(this.sliderItems, {super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1.2,
                  aspectRatio: 1.8,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _index = index;
                    });
                  },
                  autoPlayInterval: const Duration(seconds: 8)),
              items: widget.sliderItems
                  .map(
                    (e) => InkWell(
                      onTap: () {
                        if (e.link.isNotNullOrEmpty) {
                          if (e.link!.contains('http')) {
                            launchUrl(Uri.parse(e.link!),
                                mode: LaunchMode.externalApplication,
                                webOnlyWindowName: '_self');
                          } else {
                            Navigator.push(
                                context,
                                CustomPageRoute2(
                                    builder: (_) => ShopDetailsScreen(
                                        shopId: int.parse(e.link!),
                                        imageUrl: e.image ?? '')));
                          }
                        }
                      },
                      child: CachedNetworkImage(
                        imageUrl: e.image ?? '',
                        fit: BoxFit.fill,
                        width: 100.w(context),
                        progressIndicatorBuilder: (_, __, ___) =>
                            CupertinoActivityIndicator(
                          color: ColorPalette.primaryColor,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DotsIndicator(
                    dotsCount: widget.sliderItems.length,
                    axis: Axis.horizontal,
                    position: _index,
                    decorator: DotsDecorator(
                        activeColor: ColorPalette.primaryColor,
                        spacing: const EdgeInsets.fromLTRB(2, 8, 2, 8),
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
