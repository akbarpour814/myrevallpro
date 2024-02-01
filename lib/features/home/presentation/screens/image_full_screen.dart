import 'package:cached_network_image/cached_network_image.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/core/models/shop_details_model/shop_gallery_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageFullScreen extends StatefulWidget {
  final ShopGalleryModel item;
  const ImageFullScreen({super.key, required this.item});

  @override
  State<ImageFullScreen> createState() => _ImageFullScreenState();
}

class _ImageFullScreenState extends State<ImageFullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl: widget.item.image ?? '',
                      width: 100.w(context),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text(
                    widget.item.name ?? '',
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
