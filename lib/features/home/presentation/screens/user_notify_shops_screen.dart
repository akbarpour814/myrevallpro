import 'package:customer_club/configs/color_palette.dart';
import 'package:customer_club/core/utils/my_icons.dart';
import 'package:customer_club/core/widgets/my_loading.dart';
import 'package:customer_club/features/home/presentation/blocs/get_user_notify_shops/get_user_notify_shops_bloc.dart';
import 'package:customer_club/features/home/presentation/screens/main_screen.dart';
import 'package:customer_club/features/home/presentation/widgets/vertical_shop_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class UserNotifyShopsScreen extends StatefulWidget {
  const UserNotifyShopsScreen({super.key});

  @override
  State<UserNotifyShopsScreen> createState() => _UserNotifyShopsScreenState();
}

class _UserNotifyShopsScreenState extends State<UserNotifyShopsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserNotifyShopsBloc()
        ..add(
          GetUserNotifyShopsStartEvent(),
        ),
      child: BlocBuilder<GetUserNotifyShopsBloc, GetUserNotifyShopsState>(
          builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            leading: Center(
              child: SvgPicture.string(
                MyIcons.message,
              ),
            ),
            title: Text(
              'نظرسنجی های انجام نشده',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: ColorPalette.primaryColor,
          ),
          body: SafeArea(
            child: state is GetUserNotifyShopsLoaded &&
                    state.shopsList.isNotEmpty
                ? ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(
                        top: 4, bottom: 80, left: 6, right: 6),
                    children: state.shopsList
                        .map((e) => VerticalShopItem(
                              e,
                              goSurveyTab: true,
                              onCommentAdd: () {
                                Navigator.pop(
                                    MainScreen.scaffoldKey.currentContext!);
                                Navigator.pop(context);
                                BlocProvider.of<GetUserNotifyShopsBloc>(context)
                                    .add(
                                  GetUserNotifyShopsStartEvent(),
                                );
                              },
                            ))
                        .toList(),
                  )
                : state is GetUserNotifyShopsLoaded && state.shopsList.isEmpty
                    ? const Center(
                        child: Text('فروشگاهی یافت نشده است!'),
                      )
                    : state is GetUserNotifyShopsLoading
                        ? MyLoading()
                        : const Center(),
          ),
        );
      }),
    );
  }
}
