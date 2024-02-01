import 'package:cached_network_image/cached_network_image.dart';
import 'package:customer_club/configs/color_palette.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/core/utils/my_icons.dart';
import 'package:customer_club/core/models/shop_details_model/shop_gallery_model.dart';
import 'package:customer_club/features/home/presentation/blocs/get_discount_list/get_discount_list_bloc.dart';
import 'package:customer_club/features/home/presentation/blocs/get_shop_details/get_shop_details_bloc.dart';
import 'package:customer_club/features/home/presentation/blocs/get_shop_location/get_shop_location_bloc.dart';
import 'package:customer_club/features/home/presentation/blocs/get_shop_rating/get_shop_rating_bloc.dart';
import 'package:customer_club/features/home/presentation/widgets/shop_details_comments.dart';
import 'package:customer_club/features/home/presentation/widgets/shop_details_discount_list.dart';
import 'package:customer_club/features/home/presentation/widgets/shop_details_gallery.dart';
import 'package:customer_club/features/home/presentation/widgets/shop_details_info.dart';
import 'package:customer_club/features/home/presentation/widgets/star_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_svg/svg.dart';

class ShopDetailsScreen extends StatefulWidget {
  final bool goSurveyTab;
  final int shopId;
  final String imageUrl;
  final void Function()? onCommentAdd;
  const ShopDetailsScreen(
      {super.key,
      required this.shopId,
      required this.imageUrl,
      this.goSurveyTab = false,
      this.onCommentAdd});

  @override
  State<ShopDetailsScreen> createState() => _ShopDetailsScreenState();
}

class _ShopDetailsScreenState extends State<ShopDetailsScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  final List<List<ShopGalleryModel>> _shopRowList = [];
  MapController? _mapController;
  AnimationController? _bsController;

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _bsController = BottomSheet.createAnimationController(this);
    _bsController?.duration = const Duration(milliseconds: 600);
    _tabController = TabController(length: 4, vsync: this);
    _tabController?.addListener(() {
      setState(() {});
    });
    if (widget.goSurveyTab) {
      Future.delayed(Duration(milliseconds: 500))
          .then((value) => _tabController?.animateTo(2));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: ColorPalette.primaryColor,
      ),
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GetShopDetailsBloc()
                ..add(GetShopDetailsStartEvent(shopId: widget.shopId)),
            ),
            BlocProvider(
              create: (context) => GetDiscountListBloc()
                ..add(GetDiscountListStartEvent(shopId: widget.shopId)),
            ),
            BlocProvider(
              create: (context) => GetShopLocationBloc()
                ..add(GetShopLocationStartEvent(shopId: widget.shopId)),
            ),
            BlocProvider(
              create: (context) => GetShopRatingBloc()
                ..add(GetShopRatingStartEvent(shopId: widget.shopId)),
            ),
          ],
          child: BlocConsumer<GetShopDetailsBloc, GetShopDetailsState>(
            listener: (context, state) {
              if (state is GetShopDetailsLoaded &&
                  (state.shopAllDetailsModel.shop?.shopGallery ?? [])
                      .isNotEmpty) {
                for (var element
                    in state.shopAllDetailsModel.shop!.shopGallery!) {
                  if (_shopRowList.isEmpty || _shopRowList.last.length == 3) {
                    _shopRowList.add([element]);
                  } else {
                    _shopRowList.last.add(element);
                  }
                }
                setState(() {});
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: CachedNetworkImage(
                          width: 100.w(context),
                          height: 30.h(context),
                          imageUrl: widget.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 100.w(context),
                          padding: EdgeInsets.fromLTRB(16, 40, 16, 12),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black,
                                  Colors.black.withOpacity(0.7),
                                  Colors.black.withOpacity(0.0)
                                ]),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if ((state is GetShopDetailsLoaded)) ...[
                                Text(
                                  state.shopAllDetailsModel.shop?.name ??
                                      'نام فروشگاه',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    StarWidget(
                                        size: 20,
                                        star: state.shopAllDetailsModel.shop
                                                ?.rating ??
                                            0),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: ColorPalette.primaryColor),
                                      padding: EdgeInsets.all(6),
                                      child: Text(
                                        'تخفیف دهنده',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    )
                                  ],
                                )
                              ]
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      _tabBar(),
                      Expanded(
                          child: Container(
                        color: ColorPalette.primaryColor,
                        child: TabBarView(
                            controller: _tabController,
                            physics: BouncingScrollPhysics(),
                            children: [
                              ShopDetailsInfo(shopId: widget.shopId),
                              ShopDetailsGallery(
                                  shopId: widget.shopId,
                                  shopRowList: _shopRowList),
                              ShopDetailsComments(
                                  shopId: widget.shopId,
                                  onCommentAdd: widget.onCommentAdd,
                                  canAddComment: widget.goSurveyTab ||
                                      (state is GetShopDetailsLoaded &&
                                          (state.shopAllDetailsModel.shop
                                                  ?.setRating ??
                                              false))),
                              ShopDetailsDiscountList(shopId: widget.shopId)
                            ]),
                      ))
                    ],
                  ))
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  _tabBar() {
    return Container(
      color: Colors.black,
      height: 40,
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
            color: ColorPalette.primaryColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(6))),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: ColorPalette.primaryColor,
        onTap: (index) {
          setState(() {});
        },
        tabs: [
          Tab(child: SvgPicture.string(MyIcons.store)),
          Tab(child: SvgPicture.string(MyIcons.eye)),
          Tab(child: SvgPicture.string(MyIcons.message)),
          Tab(child: SvgPicture.string(MyIcons.discount)),
        ],
      ),
    );
  }
}
