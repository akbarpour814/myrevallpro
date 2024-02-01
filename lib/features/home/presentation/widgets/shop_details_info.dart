import 'package:customer_club/configs/gen/assets.gen.dart';
import 'package:customer_club/configs/color_palette.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/core/utils/my_icons.dart';
import 'package:customer_club/core/widgets/my_loading.dart';
import 'package:customer_club/features/home/presentation/blocs/get_shop_details/get_shop_details_bloc.dart';
import 'package:customer_club/features/home/presentation/blocs/get_shop_location/get_shop_location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopDetailsInfo extends StatefulWidget {
  final int shopId;
  const ShopDetailsInfo({super.key, required this.shopId});

  @override
  State<ShopDetailsInfo> createState() => _ShopDetailsInfoState();
}

class _ShopDetailsInfoState extends State<ShopDetailsInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4, left: 4, right: 4),
      padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      child: BlocBuilder<GetShopLocationBloc, GetShopLocationState>(
        builder: (context, locationState) {
          return BlocConsumer<GetShopDetailsBloc, GetShopDetailsState>(
            listener: (context, state) {
              if (state is GetShopDetailsLoaded) {
                if (state.shopAllDetailsModel.shop?.contentCat != null) {
                  state.shopAllDetailsModel.shop?.contentCat!.sort((a, b) =>
                      b.entries.first.key.compareTo(a.entries.first.key));
                }
              }
            },
            builder: (context, state) {
              return state is GetShopDetailsLoaded
                  ? SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 80),
                      child: Column(
                        children: [
                          if (state.shopAllDetailsModel.shop != null &&
                              state.shopAllDetailsModel.shop!.contentCat !=
                                  null &&
                              state.shopAllDetailsModel.shop!.contentCat!.any(
                                  (element) => element['slogan'] != null)) ...[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  (state.shopAllDetailsModel.shop?.contentCat
                                              ?.firstWhere((element) =>
                                                  element['slogan'] != null)
                                              .entries
                                              .first
                                              .value ??
                                          '')
                                      .toString()
                                      .toPersianDigit(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            16.hsb()
                          ],
                          if (state.shopAllDetailsModel.shop != null &&
                              state.shopAllDetailsModel.shop!.aboutUs
                                  .isNotNullOrEmpty) ...[
                            Text(
                              state.shopAllDetailsModel.shop!.aboutUs!
                                  .toString()
                                  .toPersianDigit(),
                              textAlign: TextAlign.justify,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            12.hsb()
                          ],
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (state.shopAllDetailsModel.shop!.manager
                                  .isNotNullOrEmpty)
                                _infoItem(MyIcons.boss, 'مدیریت',
                                    state.shopAllDetailsModel.shop!.manager!),
                              if (state.shopAllDetailsModel.shop!.manager
                                  .isNotNullOrEmpty)
                                _infoItem(
                                    MyIcons.clock,
                                    'ساعت کار',
                                    state.shopAllDetailsModel.shop!.worktime!
                                        .toString()
                                        .toPersianDigit()),
                              24.hsb(),
                              Row(
                                children: [
                                  SvgPicture.string(
                                    MyIcons.headset,
                                    width: 18,
                                  ),
                                  6.wsb(),
                                  Text(
                                    'تماس با ما',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              ...(state.shopAllDetailsModel.shop!.contentCat ??
                                      [])
                                  .where((element) =>
                                      element.keys.first != 'slogan')
                                  .map(
                                    (e) => Card(
                                      elevation: 0,
                                      color: Colors.transparent,
                                      surfaceTintColor: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          if (e['url'] != null) {
                                            launchUrl(Uri.parse(e['url']),
                                                mode: LaunchMode
                                                    .externalApplication,
                                                webOnlyWindowName: '_self');
                                          } else if (e['phone'] != null) {
                                            launchUrl(Uri.parse(
                                                'tel:${e.entries.first.value}'));
                                          } else if (e['website'] != null) {
                                            launchUrl(
                                                Uri.parse(e['website']
                                                        .toString()
                                                        .contains('http')
                                                    ? e['website']
                                                    : 'https://${e['website']}'),
                                                mode: LaunchMode
                                                    .externalApplication,
                                                webOnlyWindowName: '_self');
                                          }
                                        },
                                        child: Directionality(
                                          textDirection: e.entries.first.key
                                                  .toString()
                                                  .toLowerCase()
                                                  .contains('address')
                                              ? TextDirection.rtl
                                              : TextDirection.ltr,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8, left: 8, right: 8),
                                            child: Row(
                                              children: [
                                                _getIconFromKey(
                                                    e.entries.first.key),
                                                6.wsb(),
                                                Text(
                                                  e.entries.first.value
                                                      .toString()
                                                      .toPersianDigit(),
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                            ],
                          ),
                          24.hsb(),
                          if (locationState is GetShopLocationLoaded &&
                              locationState.shopModel.lat.isNotNullOrEmpty &&
                              locationState.shopModel.lng.isNotNullOrEmpty)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: InkWell(
                                onTap: () {
                                  MapsLauncher.launchCoordinates(
                                      double.parse(
                                          locationState.shopModel.lat ?? '0'),
                                      double.parse(
                                          locationState.shopModel.lng ?? '0'));
                                },
                                child: IgnorePointer(
                                  ignoring: true,
                                  child: SizedBox(
                                    width: 90.w(context),
                                    height: 50.w(context),
                                    child: OSMFlutter(
                                        controller: MapController(
                                            initPosition: GeoPoint(
                                                latitude: double.parse(
                                                    locationState
                                                            .shopModel.lat ??
                                                        '0'),
                                                longitude: double.parse(
                                                    locationState
                                                            .shopModel.lng ??
                                                        '0'))),
                                        osmOption: OSMOption(
                                            staticPoints: [
                                              StaticPositionGeoPoint(
                                                  widget.shopId.toString(),
                                                  MarkerIcon(
                                                    assetMarker: AssetMarker(
                                                        scaleAssetImage: 3,
                                                        image: AssetImage(Assets
                                                            .resources
                                                            .pin
                                                            .path)),
                                                  ),
                                                  [
                                                    GeoPoint(
                                                        latitude: double.parse(
                                                            locationState
                                                                    .shopModel
                                                                    .lat ??
                                                                '0'),
                                                        longitude: double.parse(
                                                            locationState
                                                                    .shopModel
                                                                    .lng ??
                                                                '0'))
                                                  ])
                                            ],
                                            zoomOption: const ZoomOption(
                                                initZoom: 14))),
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    )
                  : state is GetShopDetailsLoading
                      ? MyLoading()
                      : const Center();
            },
          );
        },
      ),
    );
  }

  Widget _infoItem(String icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.string(
                icon,
                width: 20,
              ),
              6.wsb(),
              Text(
                title,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, right: 8),
            child: Text(
              value,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getIconFromKey(String key) {
    switch (key) {
      case 'phone':
        return SvgPicture.string(
          MyIcons.mobile,
          width: 16,
        );
      case 'address':
        return SvgPicture.string(
          MyIcons.locationSelected,
          width: 16,
        );
      case 'instagram':
        return SvgPicture.string(
          MyIcons.instagram,
          width: 16,
        );
      case 'telegram':
        return SvgPicture.string(
          MyIcons.telegram,
          width: 16,
        );
      case 'whatsapp':
        return SvgPicture.string(
          MyIcons.whatsapp,
          width: 16,
        );
      case 'website':
        return SvgPicture.string(
          MyIcons.site,
          width: 16,
        );
      default:
        return Icon(
          Icons.circle,
          size: 16,
          color: ColorPalette.primaryColor,
        );
    }
  }
}
