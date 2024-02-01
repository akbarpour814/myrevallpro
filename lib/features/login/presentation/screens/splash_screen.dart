import 'dart:developer';
import 'dart:io';

import 'package:customer_club/configs/gen/assets.gen.dart';
import 'package:customer_club/configs/color_palette.dart';
import 'package:customer_club/configs/di.dart';
import 'package:customer_club/core/utils/const.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/core/utils/my_icons.dart';
import 'package:customer_club/core/utils/my_navigator.dart';
import 'package:customer_club/core/utils/value_notifires.dart';
import 'package:customer_club/core/widgets/my_loading.dart';
import 'package:customer_club/features/home/presentation/blocs/get_home_data/get_home_data_bloc.dart';
import 'package:customer_club/features/home/presentation/screens/main_screen.dart';
import 'package:customer_club/features/login/presentation/blocs/get_app_config/get_app_config_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _version = '';

  @override
  void dispose() {
    if (Platform.isAndroid)
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // getIt<FlutterSecureStorage>().deleteAll();
    if (Platform.isAndroid)
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      PackageInfo.fromPlatform().then((value) {
        setState(() {
          _version = value.version;
        });
      });
    });
    getIt<FlutterSecureStorage>().read(key: 'token').then((value) {
      if (value.isNotNullOrEmpty) {
        log(value!);
        tokenNotifire.value = value;
      }
    });
  }

  Future<void> _checkVersion() async {
    {
      if (appConfig.appVersionCompile.isNotNullOrEmpty) {
        //from device
        final pVersion1 = int.parse(_version.split('.').first);
        final pVersion2 = int.parse(_version.split('.')[1]);
        final pVersion3 = int.parse(_version.split('.').last);
        //from service
        final sVersion1 =
            int.parse(appConfig.appVersionCompile!.split('.').first);
        final sVersion2 = int.parse(appConfig.appVersionCompile!.split('.')[1]);
        final sVersion3 =
            int.parse(appConfig.appVersionCompile!.split('.').last);

        if ((pVersion1 < sVersion1) ||
            (pVersion1 == sVersion1 && pVersion2 < sVersion2) ||
            (pVersion1 == sVersion1 &&
                pVersion2 == sVersion2 &&
                pVersion3 < sVersion3)) {
          _updatePopUp();
        } else {
          BlocProvider.of<GetHomeDataBloc>(context)
              .add(GetHomeDataStartEvent());
        }
      }
    }
  }

  void _updatePopUp() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Center(
          child: Text(
            'دریافت نسخه جدید',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        contentPadding: EdgeInsets.all(8),
        content: PopScope(
          canPop: false,
          child: StatefulBuilder(builder: (context, ss) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                height: 370,
                width: 76.w(context),
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(children: [
                  SvgPicture.string(
                    MyIcons.appUpdate,
                    height: 160,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text('نسخه ${appConfig.appVersionCompile ?? '1.0.0'}'),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                      'برای بهبود عملکرد و دریافت آخرین تغییرات برنامه ${appConfig.appNameFa ?? 'آریاکارت'} از گزینه زیر اقدام نمایید.',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Colors.red.shade700, height: 1.5)),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await launchUrl(
                          Uri.parse(Platform.isAndroid
                              ? appConfig.appDownloadAndroid!
                              : appConfig.appFownloadIos!),
                          mode: LaunchMode.externalApplication);
                    },
                    child: Text(
                      'بروزرسانی کن!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ]),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAppConfigBloc()..add(GetAppConfigStartEvent()),
      child: BlocListener<GetHomeDataBloc, GetHomeDataState>(
        listener: (context, getHomeDataState) {
          if (getHomeDataState is GetHomeDataLoaded) {
            MyNavigator.pushReplacement(
                context,
                MainScreen(
                  key: MainScreen.stateKey,
                ));
          }
        },
        child: BlocListener<GetAppConfigBloc, GetAppConfigState>(
          listener: (context, state) {
            if (state is GetAppConfigLoaded) {
              appConfig = state.configModel;
              if (state.configModel.colorMasterApp.isNotNullOrEmpty) {
                ColorPalette.primaryColor =
                    Color(int.parse('0xff${state.configModel.colorMasterApp}'));
                ColorPalette.primaryColorHex =
                    state.configModel.colorMasterApp!;
              }
              if (state.configModel.colorClientApp.isNotNullOrEmpty) {
                ColorPalette.secondryColor =
                    Color(int.parse('0xff${state.configModel.colorClientApp}'));
              }
              _checkVersion();
            }
          },
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Assets.resources.splash.provider(),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        80.hsb(),
                        const Text(
                          'خوش آمدید',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white),
                        ),
                        10.h(context).hsb(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.resources.logoWhite
                                .image(width: 50.w(context)),
                          ],
                        ),
                        6.h(context).hsb(),
                        SizedBox(
                            width: 65.w(context),
                            child: Text(
                              'معرفی فروشگاه های تخفیف دهنده اپلیکیشن آریا کارت'
                                  .toPersianDigit(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16, height: 2),
                            ))
                      ],
                    ),
                  ),
                  80.hsb(
                      child: const MyLoading(
                    color: Colors.white,
                    withText: false,
                  )),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'نسخه $_version'.toPersianDigit(),
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
