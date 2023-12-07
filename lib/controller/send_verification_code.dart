//------/dart and flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:async';

//------/packages
import 'package:sizer/sizer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:dio/dio.dart';

//------/view/pages/login_pages
import '/view/pages/login_pages/registration_page.dart';
import '/view/pages/login_pages/splash_page.dart';

//------/view/view_models
import '/view/view_models/custom_snack_bar.dart';

//------/main
import '/main.dart';

mixin SendVerificationCode<T extends StatefulWidget> on State<T> {
  late TextEditingController codeController;
  String? codeError;
  late int numberOfSend;
  late bool sendCode;
  Timer? timer;
  late Duration duration;
  late bool resendCodePermission;

  late bool resendCodeClick;

  @override
  void initState() {
    super.initState();

    codeController = TextEditingController();
    numberOfSend = 0;
    sendCode = true;
    duration = Duration(seconds: resendSms);
    resendCodePermission = false;

    resendCodeClick = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => timer!.cancel());
  }

  void resetTimer() {
    stopTimer();

    setState(() => duration = Duration(seconds: resendSms));
  }

  void setCountDown() {
    final int reduceSecondsBy = 1;

    try {
      setState(() {
        final int seconds = duration.inSeconds - reduceSecondsBy;

        if (seconds < 0) {
          timer!.cancel();

          resendCodeClick = true;

          codeError = null;

          numberOfSend++;

          sendCode = true;

          if ((numberOfSend >= 1) && (numberOfSend < 5)) {
            resendCodePermission = true;
          } else {
            resendCodePermission = false;
            login = false;

            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(
                context,
                Ionicons.refresh_outline,
                'بعد از اجرای دوباره برنامه امتحان کنید.',
                2,
              ),
            );

            Future.delayed(const Duration(microseconds: 2500), () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) => const SplashPage(),
                ),
              );
            });
          }
        } else {
          duration = Duration(seconds: seconds);
        }
      });
    } catch (e) {}
  }

  String remainder() {
    return'${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}';
  }

  Visibility codeTextField() {
    return Visibility(
      visible: !sendCode,
      child: Padding(
        padding: EdgeInsets.only(bottom: 0.5.h),
        child: TextField(
          controller: codeController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            helperText: '${remainder()} ثانیه تا دریافت مجدد کد',
            hintText: 'لطفاً کد تأیید را وارد کنید.',
            errorText: codeError,
            suffixIcon: Icon(Ionicons.code_working_outline),
          ),
          onChanged: (String text) {
            setState(() {
              codeError = null;
            });
          },
        ),
      ),
    );
  }

  Visibility resendCodeButton(String phoneNumber) {
    return Visibility(
      visible: resendCodePermission && sendCode && (numberOfSend < 5),
      child: Padding(
        padding: EdgeInsets.only(top: 5.0.h),
        child: Center(
          child: SizedBox(
            width: 100.0.w - (2 * 5.0.w),
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  codeController = TextEditingController();
                });

                if(resendCodeClick) {
                  resendCode(phoneNumber);
                }
              },
              label: Text(resendCodeClick ? 'دریافت مجدد کد تأیید' : 'لطفاً شکیبا باشید.'),
              icon: const Icon(Ionicons.checkmark_outline),
            ),
          ),
        ),
      ),
    );
  }

  void resendCode(String phoneNumber) async {
    setState(() {
      resendCodeClick = false;
    });

    Response<dynamic> customDio = await Dio().post(
      '${domain}register/resend',
      data: {'mobile': phoneNumber},
    );

    if (customDio.statusCode == 200) {
      setState(() {
        sendCode = false;

        resetTimer();
        startTimer();
      });
    }
  }
}
