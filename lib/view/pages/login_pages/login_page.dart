//------/dart and flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//------/packages
import 'package:sizer/sizer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:url_launcher/url_launcher.dart';

//------/controller
import '/controller/functions_for_checking_user_information_format.dart';
import '/controller/internet_connection.dart';
import '/controller/load_data_from_api.dart';
import '/controller/prepare_to_login_app.dart';
import '/controller/send_verification_code.dart';

//------/view/pages/login_pages
import '/view/pages/login_pages/password_recovery_page.dart';
import '/view/pages/login_pages/registration_page.dart';
import '/view/pages/login_pages/splash_page.dart';

//------/view/view_models
import '/view/view_models/custom_snack_bar.dart';
import '/view/view_models/no_internet_connection.dart';
import '/view/view_models/persistent_bottom_navigation_bar.dart';

//------/main
import '/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with
        TickerProviderStateMixin,
        InternetConnection,
        LoadDataFromAPI,
        SendVerificationCode {
  late TextEditingController _phoneNumberController;
  String? _phoneNumberError;
  late TextEditingController _passwordController;
  String? _passwordError;
  late bool _loginPermission;
  late bool _obscureText;

  late bool _informationConfirmClick;
  late bool _sendCodeClick;

  @override
  void initState() {
    super.initState();

    _phoneNumberController = TextEditingController();
    _passwordController = TextEditingController();
    _loginPermission = false;
    _obscureText = true;

    _informationConfirmClick = true;
    _sendCodeClick = true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body(),
      ),
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _appTitle(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical:
                        resendCodePermission && sendCode && (numberOfSend < 5)
                            ? 0.0
                            : 5.0.h,
                  ),
                  child: Column(
                    children: [
                      _phoneNumberTextField(),
                      _password(),
                      codeTextField(),
                    ],
                  ),
                ),
                _informationConfirmButton(),
                _sendCodeButton(),
                resendCodeButton(_phoneNumberController.text),
                Container(
                  margin: EdgeInsets.only(top: 15.0.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _forgotPasswordButton(),
                      _registrationButton(),
                      _privacyPolicy(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Padding _appTitle() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0.h),
      child: Center(
        child: Text(
          'ورود به کاغذ صوتی',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }

  Padding _phoneNumberTextField() {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.5.h),
      child: TextField(
        readOnly: _loginPermission,
        controller: _phoneNumberController,
        keyboardType: TextInputType.phone,
        maxLength: 11,
        decoration: InputDecoration(
          helperText: 'تلفن همراه',
          hintText: 'لطفاً شماره تلفن همراه خود را وارد کنید.',
          errorText: _phoneNumberError,
          suffixIcon: Icon(Ionicons.phone_portrait_outline),
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
    );
  }

  TextField _password() {
    return TextField(
      readOnly: _loginPermission,
      obscureText: _obscureText,
      controller: _passwordController,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        helperText: 'رمز عبور',
        hintText: 'لطفاً رمز عبور را وارد کنید.',
        errorText: _passwordError,
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              _obscureText = _obscureText ? false : true;
            });
          },
          child: Icon(
              _obscureText ? Ionicons.eye_off_outline : Ionicons.eye_outline),
        ),
      ),
      onChanged: (String text) {
        setState(() {
          _passwordError = UserInformationFormatCheck.checkPasswordFormat(
            _passwordController,
            null,
          );
        });
      },
    );
  }

  Visibility _informationConfirmButton() {
    return Visibility(
      visible: sendCode && !resendCodePermission && !_loginPermission,
      child: SizedBox(
        width: 100.0.w - (2 * 5.0.w),
        child: ElevatedButton.icon(
          onPressed: () {
            if(_informationConfirmClick) {
              _informationConfirm();
            }
          },
          label: Text(_informationConfirmClick ? 'بررسی اطلاعات برای ورود' : 'لطفاً شکیبا باشید.'),
          icon: const Icon(Ionicons.checkmark_outline),
        ),
      ),
    );
  }

  void _informationConfirm() async {
    _phoneNumberError = UserInformationFormatCheck.checkPhoneNumberFormat(
      _phoneNumberController,
      'لطفاً شماره تلفن همراه خود را وارد کنید.',
    );
    _passwordError = UserInformationFormatCheck.checkPasswordFormat(
      _passwordController,
      'لطفاً رمز عبور را وارد کنید.',
    );

    if ((_phoneNumberError == null) && (_passwordError == null)) {
      setState(() {
        _informationConfirmClick = false;
      });

      try {
        customDio = await Dio().post(
          '${domain}login',
          data: {
            'username': _phoneNumberController.text,
            'password': _passwordController.text
          },
        );

        if (customDio.statusCode == 200) {
          if (customDio.data['data']['status'] == 0) {
            setState(() {
              sendCode = false;
              _loginPermission = true;

              startTimer();
            });
          } else {
            _login(customDio.data);
          }
        }
      } catch (e) {
        setState(() {
          _phoneNumberError = 'کاربری با شماره تلفن همراه وارد شده یافت نشد.';
          _passwordError = 'رمز عبور وارد شده درست نمی باشد.';

          _loginPermission = false;
          _informationConfirmClick = true;
        });
      }
    }
  }

  SizedBox _forgotPasswordButton() {
    return SizedBox(
      width: 50.0.w,
      child: TextButton(
        onPressed: () {
          if (!_loginPermission) {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) {
                  return const PasswordRecoveryPage();
                },
              ),
            );
          }
        },
        child: Text(
          'رمز عبورم را فراموش کرده ام.',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Theme.of(context).primaryColor),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  SizedBox _registrationButton() {
    return SizedBox(
      width: 50.0.w,
      child: TextButton(
        onPressed: () {
          if (!_loginPermission) {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) {
                  return const RegistrationPage();
                },
              ),
            );
          }
        },
        child: Text(
          'ثبت نام نکرده ام.',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Theme.of(context).primaryColor),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  SizedBox _privacyPolicy() {
    return SizedBox(
      width: 50.0.w,
      child: TextButton(
        onPressed: () {
          if (!_loginPermission) {
            launch('https://kaghazsoti.com/privacy.html');
          }
        },
        child: Text(
          'سیاست حفظ حریم خصوصی',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Theme.of(context).primaryColor),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Visibility _sendCodeButton() {
    return Visibility(
      visible: !sendCode,
      child: Center(
        child: SizedBox(
          width: 100.0.w - (2 * 5.0.w),
          child: ElevatedButton.icon(
            onPressed: () {
              if(_sendCodeClick) {
                _sendCodeOperation();
              }
            },
            label: Text(_sendCodeClick ? 'ارسال کد تأیید' : 'لطفاً شکیبا باشید.'),
            icon: const Icon(Ionicons.checkmark_outline),
          ),
        ),
      ),
    );
  }

  void _sendCodeOperation() async {
    try {
      setState(() {
        _sendCodeClick = false;
      });

      Response<dynamic> _customDio = await Dio().post(
        '${domain}register/register_confirmation_step_2',
        data: {
          'mobile': _phoneNumberController.text,
          'code': codeController.text,
        },
      );

      if (_customDio.statusCode == 200) {
        _login(_customDio.data);
      }
    } catch (e) {
      setState(() {
        codeError = 'کد وارد شده صحیح نمی باشد.';

        _sendCodeClick = true;
      });
    }
  }

  void _login(Map data) async {
    if (data['success']) {
      _phoneNumberError = null;
      _passwordError = null;

      await sharedPreferences.setString('tokenLogin', data['data']['token']);
      await sharedPreferences.setBool('firstLogin', false);
      setState(() {
        sendCode = true;
        _loginPermission = true;

        _phoneNumberController = TextEditingController();
        _passwordController = TextEditingController();

        tokenLogin.$ = data['data']['token'];

        headers = {
          'Authorization': 'Bearer ${tokenLogin.of(context)}',
          'Accept': 'application/json',
          'client': 'api'
        };
      });

      prepareToLoginApp();

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
    } else {
      setState(() {
        _phoneNumberError = 'کاربری با شماره تلفن همراه وارد شده یافت نشد.';
        _passwordError = 'رمز عبور وارد شده درست نمی باشد.';

        _loginPermission = false;
        _informationConfirmClick = true;
      });
    }
  }
}
