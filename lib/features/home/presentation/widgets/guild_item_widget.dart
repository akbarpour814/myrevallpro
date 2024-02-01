import 'package:cached_network_image/cached_network_image.dart';
import 'package:customer_club/configs/color_palette.dart';
import 'package:customer_club/core/models/guild_model.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/core/utils/my_navigator.dart';
import 'package:customer_club/features/home/presentation/screens/guild_details_screen.dart';
import 'package:flutter/material.dart';

class GuildItemWidget extends StatelessWidget {
  final GuildModel item;
  const GuildItemWidget(
    this.item, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Color(int.parse(
              '0xff${(item.bgColor ?? ColorPalette.primaryColorHex).replaceAll('#', '')}'))),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        margin: EdgeInsets.zero,
        child: InkWell(
          onTap: () {
            MyNavigator.push(context, GuildDetailsScreen(item: item));
          },
          splashColor: ColorPalette.primaryColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CachedNetworkImage(
                imageUrl: item.icon ?? '',
                width: 20.w(context),
              ),
              Text(
                item.name ?? '',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 3.5.w(context),
                    height: 0.1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
