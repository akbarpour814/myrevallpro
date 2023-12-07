//------/dart and flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

//------/packages
import 'package:sizer/sizer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as HTTP;
import 'package:connectivity_plus/connectivity_plus.dart';

//------/controller
import '/controller/custom_response.dart';
import '/controller/functions_for_checking_user_information_format.dart';
import '/controller/internet_connection.dart';
import '/controller/load_data_from_api.dart';
import '/controller/prepare_to_login_app.dart';
import '/controller/send_verification_code.dart';

//------/view/pages/login_pages
import '/view/pages/login_pages/splash_page.dart';

//------/view/view_models
import '/view/view_models/custom_snack_bar.dart';
import '/view/view_models/no_internet_connection.dart';
import '/view/view_models/persistent_bottom_navigation_bar.dart';

//------/main
import '/main.dart';

class PasswordRecoveryPage extends StatefulWidget {
  const PasswordRecoveryPage({Key? key}) : super(key: key);

  @override
  _PasswordRecoveryPageState createState() => _PasswordRecoveryPageState();
}

class _PasswordRecoveryPageState extends State<PasswordRecoveryPage>
    with InternetConnection, LoadDataFromAPI, SendVerificationCode {
  late TextEditingController _phoneNumberController;
  String? _phoneNumberError;
  late TextEditingController _newPasswordController;
  String? _newPasswordError;
  late TextEditingController _repeatNewPasswordController;
  String? _repeatNewPasswordError;
  late bool _obscureText;

  late bool _receiveRecoveryCodeClick;
  late bool _sendRecoveryCodeClick;

  @override
  void initState() {
    super.initState();

    _phoneNumberController = TextEditingController();
    _newPasswordController = TextEditingController();
    _repeatNewPasswordController = TextEditingController();
    _obscureText = true;

    _receiveRecoveryCodeClick = true;
    _sendRecoveryCodeClick = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('بازیابی رمز عبور'),
      automaticallyImplyLeading: false,
      leading: const Icon(
        Ionicons.key_outline,
      ),
      actions: [
        InkWell(
          child: const Padding(
            padding: EdgeInsets.all(18.0),
            child: Icon(
              Ionicons.chevron_back_outline,
            ),
          ),
          onTap: () {
            if (timer != null) {
              timer!.cancel();
            }

            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget _body() {
    if (connectionStatus == ConnectivityResult.none) {
      return const Center(
        child: NoInternetConnection(),
      );
    } else {
      return Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 5.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5.0.h),
                  child: _permissionToObscureText(),
                ),
                _phoneNumber(),
                codeTextField(),
                //_recoveryCode(),
                _newPassword(),
                _repeatNewPassword(),
                _receiveRecoveryCodeButton(),
                _sendRecoveryCodeButton(),
                resendCodeButton(_phoneNumberController.text),
              ],
            ),
          ),
        ),
      );
    }
  }

  Visibility _permissionToObscureText() {
    return Visibility(
      visible: !sendCode,
      child: Row(
        children: [
          Flexible(
            child: Checkbox(
              onChanged: (bool? value) {
                setState(() {
                  _obscureText = _obscureText ? false : true;
                });
              },
              value: _obscureText,
              activeColor:
                  _obscureText ? Theme.of(context).primaryColor : Colors.grey,
            ),
          ),
          Flexible(
            child: RichText(
              text: TextSpan(
                text: _obscureText ? 'عدم نمایش رمز' : 'نمایش رمز',
                style: TextStyle(
                  color: _obscureText
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                  fontFamily: fontFamily,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Visibility _phoneNumber() {
    return Visibility(
      visible: sendCode,
      child: Padding(
        padding: EdgeInsets.only(bottom: 0.5.h),
        child: TextField(
          controller: _phoneNumberController,
          keyboardType: TextInputType.phone,
          maxLength: 11,
          decoration: InputDecoration(
            helperText: 'تلفن همراه',
            hintText: 'لطفاً شماره تلفن همراه خود را وارد کنید.',
            errorText: _phoneNumberError,
            suffixIcon: const Icon(Ionicons.phone_portrait_outline),
          ),
          onChanged: (String text) {
            setState(() {
              _phoneNumberError =
                  UserInformationFormatCheck.checkPhoneNumberFormat(
                _phoneNumberController,
                null,
              );
            });
          },
        ),
      ),
    );
  }

  Visibility _receiveRecoveryCodeButton() {
    return Visibility(
      visible: sendCode && !resendCodePermission,
      child: Padding(
        padding: EdgeInsets.only(top: 5.0.h),
        child: Center(
          child: SizedBox(
            width: 100.0.w - (2 * 5.0.w),
            child: ElevatedButton.icon(
              onPressed: () {
                if(_receiveRecoveryCodeClick) {
                  _receiveRecoveryCode();
                }
              },
              label: Text(_receiveRecoveryCodeClick ? 'دریافت کد تأیید' : 'لطفاًشکیبا باشید.'),
              icon: const Icon(Ionicons.checkmark_outline),
            ),
          ),
        ),
      ),
    );
  }

  void _receiveRecoveryCode() async {
    _phoneNumberError = UserInformationFormatCheck.checkPhoneNumberFormat(
      _phoneNumberController,
      'لطفاً شماره تلفن همراه خود را وارد کنید.',
    );

    if (_phoneNumberError == null) {
      setState(() {
        _receiveRecoveryCodeClick = false;
      });

      customDio = await Dio().post(
        '${domain}forgot/step1',
        data: {'mobile': _phoneNumberController.text},
      );

      if (customDio.statusCode == 200) {
        setState(() {
          sendCode = false;

          startTimer();
        });
      }
    }
  }

  Visibility _newPassword() {
    return Visibility(
      visible: !sendCode,
      child: Padding(
        padding: EdgeInsets.only(bottom: 0.5.h),
        child: TextField(
          obscureText: _obscureText,
          controller: _newPasswordController,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            helperText: 'رمز عبور جدید',
            hintText: 'لطفاً رمز عبور جدید را وارد کنید.',
            errorText: _newPasswordError,
            suffixIcon: const Icon(Ionicons.key),
          ),
          onChanged: (String text) {
            setState(() {
              _newPasswordError =
                  UserInformationFormatCheck.checkPasswordFormat(
                _newPasswordController,
                null,
              );
            });
          },
        ),
      ),
    );
  }

  Visibility _repeatNewPassword() {
    return Visibility(
      visible: !sendCode,
      child: Padding(
        padding: EdgeInsets.only(bottom: 0.5.h),
        child: TextField(
          obscureText: _obscureText,
          controller: _repeatNewPasswordController,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            helperText: 'تکرار رمز عبور جدید',
            hintText: 'لطفاً رمز عبور جدید را تکرار کنید.',
            errorText: _repeatNewPasswordError,
            suffixIcon: const Icon(Ionicons.refresh_outline),
          ),
          onChanged: (String text) {
            setState(() {
              _repeatNewPasswordError =
                  UserInformationFormatCheck.checkPasswordFormat(
                _repeatNewPasswordController,
                null,
              );
            });
          },
        ),
      ),
    );
  }

  Visibility _sendRecoveryCodeButton() {
    return Visibility(
      visible: !sendCode,
      child: Padding(
        padding: EdgeInsets.only(top: 5.0.h),
        child: Center(
          child: SizedBox(
            width: 100.0.w - (2 * 5.0.w),
            child: ElevatedButton.icon(
              onPressed: () {
                if(_sendRecoveryCodeClick) {
                  _sendRecoveryCodeOperation();
                }
              },
              label: Text(_sendRecoveryCodeClick ? 'ارسال کد تأیید' : 'لطفاًشکیبا باشید.'),
              icon: const Icon(Ionicons.checkmark_outline),
            ),
          ),
        ),
      ),
    );
  }

  void _sendRecoveryCodeOperation() async {
    codeError =
    codeController.text.isEmpty ? 'لطفاً کد تأیید را وارد کنید.' : null;
    _newPasswordError = UserInformationFormatCheck.checkPasswordFormat(
      _newPasswordController,
      'لطفاً رمز عبور جدید را وارد کنید.',
    );
    _repeatNewPasswordError = UserInformationFormatCheck.checkPasswordFormat(
      _repeatNewPasswordController,
      'لطفاً رمز عبور جدید را تکرار کنید.',
    );

    if ((codeError == null) &&
        (_newPasswordError == null) &&
        (_repeatNewPasswordError == null)) {
      setState(() {
        _sendRecoveryCodeClick = false;
      });

      var client = HTTP.Client();

      try {
        HTTP.Response response = await client.post(
          Uri.parse('${domain}forgot/step2'),
          body: {
            'mobile': _phoneNumberController.text,
            'code': codeController.text,
            'password': _newPasswordController.text,
            'password_confirmation': _repeatNewPasswordController.text,
          },
        );
        if (response.statusCode == 200) {
          customResponse = CustomResponse.fromJson(
              jsonDecode(utf8.decode(response.bodyBytes))
              as Map<String, dynamic>);

          Response<dynamic> _customDio = await Dio().post(
            '${domain}login',
            data: {
              'username': _phoneNumberController.text,
              'password': _newPasswordController.text
            },
          );

          if (_customDio.statusCode == 200) {
            CustomResponse _customResponse =
            CustomResponse.fromJson(_customDio.data);

            tokenLogin.$ = _customResponse.data['token'];
            await sharedPreferences.setString(
                'tokenLogin', _customResponse.data['token']);
            await sharedPreferences.setBool('firstLogin', false);

            headers = {
              'Authorization': 'Bearer ${tokenLogin.of(context)}',
              'Accept': 'application/json',
              'client': 'api'
            };

            prepareToLoginApp();

            setState(() {
              ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(
                  context,
                  Ionicons.checkmark_done_outline,
                  'به کاغذ صوتی خوش آمدید.',
                  2,
                ),
              );

              Future.delayed(const Duration(microseconds: 2500), () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const PersistentBottomNavigationBar(),
                  ),
                );
              });

              codeController = TextEditingController();
              _phoneNumberController = TextEditingController();
              _newPasswordController = TextEditingController();
              _repeatNewPasswordController = TextEditingController();
            });
          }
        } else {
          setState(() {
            codeError = 'کد وارد شده صحیح نمی باشد.';

            _sendRecoveryCodeClick = true;
          });
        }
      } catch (e) {
        setState(() {
          codeError = 'کد وارد شده صحیح نمی باشد.';

          _sendRecoveryCodeClick = true;
        });
      } finally {
        client.close();
      }
    }
  }
}
