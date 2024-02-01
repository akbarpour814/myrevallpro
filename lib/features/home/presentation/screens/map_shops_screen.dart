import 'package:carousel_slider/carousel_slider.dart';
import 'package:customer_club/configs/gen/assets.gen.dart';
import 'package:customer_club/configs/color_palette.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/core/utils/my_icons.dart';
import 'package:customer_club/core/widgets/my_loading.dart';
import 'package:customer_club/features/home/presentation/blocs/get_shops_location/get_shops_location_bloc.dart';
import 'package:customer_club/features/home/presentation/widgets/map_shop_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_svg/svg.dart';

class MapShopsScreen extends StatefulWidget {
  const MapShopsScreen({super.key});

  @override
  State<MapShopsScreen> createState() => _MapShopsScreenState();
}

class _MapShopsScreenState extends State<MapShopsScreen>
    with TickerProviderStateMixin {
  double _centerLat = 0;
  double _centerLng = 0;
  int _index = 0;
  late MapController _controller;
  final CarouselController _carouselController = CarouselController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = GetShopsLocationBloc();
        bloc.add(GetShopsLocationStartEvent());
        return bloc;
      },
      child: BlocConsumer<GetShopsLocationBloc, GetShopsLocationState>(
        buildWhen: (previous, current) => previous != current,
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) async {
          if (state is GetShopsLocationLoaded) {
            double lat = 0;
            double lng = 0;
            for (var element in state.shopList) {
              lat += double.parse(element.lat ?? '0');
              lng += double.parse(element.lng ?? '0');
            }
            _centerLat = lat / state.shopList.length;
            _centerLng = lng / state.shopList.length;
            _controller = MapController.withPosition(
              initPosition: GeoPoint(
                latitude: _centerLat,
                longitude: _centerLng,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: Center(child: SvgPicture.string(MyIcons.locationWhite)),
              centerTitle: true,
              title: const Text(
                'نقشه',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: ColorPalette.primaryColor,
            ),
            body: SafeArea(
                child: state is GetShopsLocationLoaded &&
                        state.shopList.isNotEmpty
                    ? Stack(
                        children: [
                          OSMFlutter(
                              controller: _controller,
                              onGeoPointClicked: (loc) async {
                                _carouselController.animateToPage(state.shopList
                                    .indexOf(state.shopList.firstWhere(
                                        (element) =>
                                            element.lat ==
                                                loc.latitude.toString() &&
                                            element.lng ==
                                                loc.longitude.toString())));
                              },
                              onMapIsReady: (value) async {
                                final loc = GeoPoint(
                                    latitude: double.parse(
                                        state.shopList.first.lat ?? '0'),
                                    longitude: double.parse(
                                        state.shopList.first.lng ?? '0'));
                                await _showTooltip(state, loc);
                              },
                              osmOption: OSMOption(
                                  staticPoints: state.shopList
                                      .map((e) => StaticPositionGeoPoint(
                                              e.id.toString(),
                                              MarkerIcon(
                                                assetMarker: AssetMarker(
                                                    scaleAssetImage: 2,
                                                    image: AssetImage(Assets
                                                        .resources.pin.path)),
                                              ),
                                              [
                                                GeoPoint(
                                                    latitude: double.parse(
                                                        e.lat ?? '0'),
                                                    longitude: double.parse(
                                                        e.lng ?? '0'))
                                              ]))
                                      .toList(),
                                  zoomOption: const ZoomOption(initZoom: 11))),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 110,
                                margin: const EdgeInsets.only(bottom: 80),
                                width: 100.w(context),
                                child: CarouselSlider(
                                  carouselController: _carouselController,
                                  options: CarouselOptions(
                                    enableInfiniteScroll: false,
                                    viewportFraction: 0.9,
                                    onPageChanged: (index, reason) async {
                                      setState(() {
                                        _index = index;
                                      });
                                      final loc = GeoPoint(
                                          latitude: double.parse(
                                              state.shopList[_index].lat ??
                                                  '0'),
                                          longitude: double.parse(
                                              state.shopList[_index].lng ??
                                                  '0'));

                                      _controller.changeLocation(loc);
                                      _showTooltip(state, loc);
                                    },
                                  ),
                                  items: state.shopList
                                      .map((e) => MapShopItemWidegt(item: e))
                                      .toList(),
                                ),
                              ))
                        ],
                      )
                    : state is GetShopsLocationLoading
                        ? MyLoading()
                        : const Center(
                            child: Text('فروشگاهی یافت نشده است.'),
                          )),
          );
        },
      ),
    );
  }

  Future<void> _showTooltip(
    GetShopsLocationLoaded state,
    GeoPoint? loc,
  ) async {
    await _controller.removeMarkers(state.shopList
        .map((e) => GeoPoint(
            latitude: double.parse(e.lat ?? '0'),
            longitude: double.parse(e.lng ?? '0')))
        .toList());
    if (loc != null) {
      await _controller.addMarker(loc,
          markerIcon: MarkerIcon(
            iconWidget: Padding(
              padding: const EdgeInsets.only(bottom: 96),
              child: Stack(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    margin: const EdgeInsets.only(bottom: 28),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      state.shopList
                              .firstWhere((element) =>
                                  loc.latitude.toString() ==
                                      element.lat.toString() &&
                                  loc.longitude.toString() == element.lng)
                              .name ??
                          '',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                          size: 50,
                        ),
                      ))
                ],
              ),
            ),
          ));
    }
  }
}
