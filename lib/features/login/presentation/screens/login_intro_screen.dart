import 'package:cached_network_image/cached_network_image.dart';
import 'package:customer_club/configs/color_palette.dart';
import 'package:customer_club/core/utils/const.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/core/utils/my_icons.dart';
import 'package:customer_club/core/utils/my_navigator.dart';
import 'package:customer_club/features/login/presentation/screens/login_with_qr_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginIntroScreen extends StatefulWidget {
  const LoginIntroScreen({super.key});

  @override
  State<LoginIntroScreen> createState() => _LoginIntroScreenState();
}

class _LoginIntroScreenState extends State<LoginIntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(child: SvgPicture.string(MyIcons.profileWhite)),
        title: const Text(
          'حساب کاربری',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: ColorPalette.primaryColor,
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(bottom: 80),
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CachedNetworkImage(
                  imageUrl: appConfig.appLogo ?? '', width: 40.w(context)),
              Column(
                children: [
                  Text(
                    'برای ورود یا عضویت، ${appConfig.appNameFa ?? ''} خود را ثبت کنید',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  24.hsb(),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              ColorPalette.primaryColor)),
                      onPressed: () =>
                          MyNavigator.push(context, LoginWithQrScreen()),
                      child: Text('ثبت کارت')),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'توجه!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      6.hsb(),
                      Text(
                        appConfig.appBuyCard ?? '',
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        launchUrl(
                            Uri.parse(appConfig.appBuyCardRequestLink ?? ''),
                            mode: LaunchMode.externalApplication,
                            webOnlyWindowName: '_self');
                      },
                      child: Text(
                        'خرید کارت',
                        style: TextStyle(
                            color: ColorPalette.primaryColor,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
