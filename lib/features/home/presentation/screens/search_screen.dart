import 'package:customer_club/configs/color_palette.dart';
import 'package:customer_club/configs/gen/assets.gen.dart';
import 'package:customer_club/core/utils/my_icons.dart';
import 'package:customer_club/core/utils/my_navigator.dart';
import 'package:customer_club/core/widgets/my_icon_button.dart';
import 'package:customer_club/core/widgets/my_loading.dart';
import 'package:customer_club/features/home/presentation/blocs/search/search_bloc.dart';
import 'package:customer_club/features/home/presentation/screens/scan_shop_screen.dart';
import 'package:customer_club/features/home/presentation/widgets/vertical_shop_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: TextField(
              controller: _searchController,
              onChanged: (_) {
                setState(() {});
              },
              onSubmitted: (_) {
                BlocProvider.of<SearchBloc>(context).add(
                    SearchWithQueryEvent(query: _searchController.text.trim()));
              },
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'جستجو در فروشگاه ها',
                  suffixIcon: MyIconButton(
                      onTap: () {
                        if (_searchController.text.isNotEmpty) {
                          _searchController.clear();
                          setState(() {});
                          BlocProvider.of<SearchBloc>(context)
                              .add(SearchClearEvent());
                        }
                      },
                      padding: EdgeInsets.zero,
                      child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, anim) =>
                              RotationTransition(
                                turns: child.key == const ValueKey('icon1')
                                    ? Tween<double>(begin: 1, end: 1)
                                        .animate(anim)
                                    : Tween<double>(begin: 0.75, end: 1)
                                        .animate(anim),
                                child:
                                    FadeTransition(opacity: anim, child: child),
                              ),
                          child: _searchController.text.isEmpty
                              ? Icon(CupertinoIcons.search,
                                  size: 24, key: const ValueKey('icon1'))
                              : Icon(
                                  Icons.close,
                                  size: 24,
                                  key: const ValueKey('icon2'),
                                )))),
            ),
            actions: [
              MyIconButton(
                  onTap: () => MyNavigator.push(context, ScanShopScreen(
                        onScan: (qr) {
                          Navigator.pop(context);
                          _searchController.clear();
                          setState(() {});
                          BlocProvider.of<SearchBloc>(context)
                              .add(SearchWithQREvent(QR: qr));
                        },
                      )),
                  padding: EdgeInsets.only(left: 12),
                  child: SvgPicture.string(MyIcons.scan))
            ],
            backgroundColor: ColorPalette.primaryColor,
          ),
          body: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return state is SearchInitial
                  ? Center(child: Assets.resources.searchShape.svg())
                  : state is SearchLoaded && state.shopList.isNotEmpty
                      ? ListView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(
                              top: 4, bottom: 80, left: 6, right: 6),
                          children: state.shopList
                              .map((e) => VerticalShopItem(e))
                              .toList(),
                        )
                      : state is SearchLoading
                          ? MyLoading()
                          : Center(
                              child: Text('فروشگاهی یافت نشد!'),
                            );
            },
          ),
        );
      }),
    );
  }
}
