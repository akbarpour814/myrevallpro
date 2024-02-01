import 'dart:async';
import 'dart:io';
import 'package:customer_club/configs/gen/assets.gen.dart';
import 'package:customer_club/configs/color_palette.dart';
import 'package:customer_club/core/utils/custom_modals.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/core/utils/my_icons.dart';
import 'package:customer_club/core/widgets/my_loading.dart';
import 'package:customer_club/features/login/presentation/blocs/scan_user_card/scan_user_card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanUserCardScreen extends StatefulWidget {
  final void Function() onScan;
  const ScanUserCardScreen({super.key, required this.onScan});

  @override
  State<ScanUserCardScreen> createState() => _ScanUserCardScreenState();
}

class _ScanUserCardScreenState extends State<ScanUserCardScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Timer? _timer;
  bool _tick = false;
  bool _first = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
        _tick = !_tick;
        setState(() {});
      });
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(child: SvgPicture.string(MyIcons.scan)),
        title: const Text(
          'اسکن کارت مشتری',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: ColorPalette.primaryColor,
      ),
      body: BlocProvider(
        create: (context) => ScanUserCardBloc(),
        child: BlocConsumer<ScanUserCardBloc, ScanUserCardState>(
          listener: (context, state) {
            if (state is ScanUserCardSuccess) {
              CustomModal.showSuccess(context, 'اسکن کارت با موفقیت انجام شد');
              widget.onScan();
            }
          },
          builder: (context, state) {
            return SafeArea(
                child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.resources.qrCodeScan.svg(width: 40.w(context)),
                    6.h(context).hsb(),
                    Text(
                      'کارت مورد نظر خود را اسکن کنید',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    24.hsb(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Builder(builder: (context) {
                        return SizedBox(
                          width: 60.w(context),
                          height: 60.w(context),
                          child: state is ScanUserCardLoading
                              ? MyLoading()
                              : Stack(
                                  children: [
                                    QRView(
                                      key: qrKey,
                                      onQRViewCreated:
                                          (QRViewController controller) {
                                        this.controller = controller;
                                        controller.scannedDataStream
                                            .listen((scanData) {
                                          if (scanData.code.isNotNullOrEmpty &&
                                              state is! ScanUserCardLoading &&
                                              DateTime.now().second.isOdd) {
                                            if (!_first) {
                                              _first = true;
                                              BlocProvider.of<ScanUserCardBloc>(
                                                      context)
                                                  .add(ScanUserCardStartEvent(
                                                      qr: scanData.code!));
                                            }
                                          }
                                        });
                                      },
                                    ),
                                    Positioned.fill(
                                        child: Center(
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 150),
                                        width: 50.w(context),
                                        color: ColorPalette.primaryColor,
                                        height: _tick ? 1 : 0,
                                      ),
                                    )),
                                    Positioned(
                                        top: 8,
                                        left: 8,
                                        right: 8,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              color: ColorPalette.primaryColor,
                                              width: 2,
                                              height: 40,
                                            ),
                                            Container(
                                              color: ColorPalette.primaryColor,
                                              width: 2,
                                              height: 40,
                                            ),
                                          ],
                                        )),
                                    Positioned(
                                        top: 8,
                                        left: 8,
                                        right: 8,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              color: ColorPalette.primaryColor,
                                              width: 40,
                                              height: 2,
                                            ),
                                            Container(
                                              color: ColorPalette.primaryColor,
                                              width: 40,
                                              height: 2,
                                            ),
                                          ],
                                        )),
                                    Positioned(
                                        top: 8,
                                        left: 8,
                                        right: 8,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              color: ColorPalette.primaryColor,
                                              width: 2,
                                              height: 40,
                                            ),
                                            Container(
                                              color: ColorPalette.primaryColor,
                                              width: 2,
                                              height: 40,
                                            ),
                                          ],
                                        )),
                                    Positioned(
                                        bottom: 8,
                                        left: 8,
                                        right: 8,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              color: ColorPalette.primaryColor,
                                              width: 40,
                                              height: 2,
                                            ),
                                            Container(
                                              color: ColorPalette.primaryColor,
                                              width: 40,
                                              height: 2,
                                            ),
                                          ],
                                        )),
                                    Positioned(
                                        bottom: 8,
                                        left: 8,
                                        right: 8,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              color: ColorPalette.primaryColor,
                                              width: 2,
                                              height: 40,
                                            ),
                                            Container(
                                              color: ColorPalette.primaryColor,
                                              width: 2,
                                              height: 40,
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}
