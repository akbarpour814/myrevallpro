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

late bool login;

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>
    with InternetConnection, LoadDataFromAPI, SendVerificationCode {
  late TextEditingController _firstAndLastNameController;
  String? _firstAndLastNameError;
  late TextEditingController _phoneNumberController;
  String? _phoneNumberError;
  late TextEditingController _passwordController;
  String? _passwordError;
  late TextEditingController _repeatPasswordController;
  String? _repeatPasswordError;
  late bool _registeredInformation;
  late bool _obscureText;

  late bool _informationRegistrationClick;
  late bool _sendCodeClick;

  @override
  void initState() {
    super.initState();

    _firstAndLastNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _passwordController = TextEditingController();
    _repeatPasswordController = TextEditingController();
    _registeredInformation = false;
    _obscureText = true;
    login = true;

    _informationRegistrationClick = true;
    _sendCodeClick = true;
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
      title: const Text('ثبت نام'),
      automaticallyImplyLeading: false,
      leading: const Icon(
        Ionicons.log_in_outline,
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
            padding: EdgeInsets.symmetric(horizontal: 5.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5.0.h),
                  child: _permissionToObscureText(),
                ),
                _firstAndLastName(),
                _phoneNumber(),
                _password(),
                _repeatPassword(),
                _informationRegistrationButton(),
                codeTextField(),
                _sendCodeButton(),
                resendCodeButton(_phoneNumberController.text),
              ],
            ),
          ),
        ),
      );
    }
  }

  Row _permissionToObscureText() {
    return Row(
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
                color:
                    _obscureText ? Theme.of(context).primaryColor : Colors.grey,
                fontFamily: fontFamily,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding _firstAndLastName() {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.5.h),
      child: TextField(
        readOnly: _registeredInformation,
        controller: _firstAndLastNameController,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          helperText: 'نام و نام خانوادگی',
          hintText: 'لطفاً نام و نام خانوادگی خود را وارد کنید.',
          errorText: _firstAndLastNameError,
          suffixIcon: const Icon(Ionicons.person_outline),
        ),
        onChanged: (String text) {
          setState(() {
            _firstAndLastNameError =
                UserInformationFormatCheck.checkFirstAndLastNameFormat(
                    _firstAndLastNameController, null);
          });
        },
      ),
    );
  }

  Padding _phoneNumber() {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.5.h),
      child: TextField(
        readOnly: _registeredInformation,
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
                    _phoneNumberController, null);
          });
        },
      ),
    );
  }

  Padding _password() {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.5.h),
      child: TextField(
        readOnly: _registeredInformation,
        obscureText: _obscureText,
        controller: _passwordController,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          helperText: 'رمز عبور',
          hintText: 'لطفاً رمز عبور را وارد کنید.',
          errorText: _passwordError,
          suffixIcon: const Icon(Ionicons.key),
        ),
        onChanged: (String text) {
          setState(() {
            _passwordError = UserInformationFormatCheck.checkPasswordFormat(
                _passwordController, null);
          });
        },
      ),
    );
  }

  Padding _repeatPassword() {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.5.h),
      child: TextField(
        readOnly: _registeredInformation,
        obscureText: _obscureText,
        controller: _repeatPasswordController,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          helperText: 'تکرار رمز عبور',
          hintText: 'لطفاً رمز عبور را تکرار کنید.',
          errorText: _repeatPasswordError,
          suffixIcon: const Icon(Ionicons.refresh_outline),
        ),
        onChanged: (String text) {
          setState(() {
            _repeatPasswordError =
                UserInformationFormatCheck.checkPasswordFormat(
                    _repeatPasswordController, null);
          });
        },
      ),
    );
  }

  Visibility _informationRegistrationButton() {
    return Visibility(
      visible: sendCode && !resendCodePermission && login,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0.h),
        child: SizedBox(
          width: 100.0.w - (2 * 5.0.w),
          child: ElevatedButton.icon(
            onPressed: () {
              setState(() {
                if (_passwordController.text !=
                    _repeatPasswordController.text) {
                  _repeatPasswordError = 'لطفاً رمز عبور جدید را تکرار کنید.';
                } else {
                  if(_informationRegistrationClick) {
                    _informationRegistration();
                  }
                }
              });
            },
            label: Text(_informationRegistrationClick ? 'ثبت اطلاعات' : 'لطفاً شکیبا باشید.'),
            icon: const Icon(Ionicons.checkmark_outline),
          ),
        ),
      ),
    );
  }

  void _informationRegistration() async {
    _firstAndLastNameError =
        UserInformationFormatCheck.checkFirstAndLastNameFormat(
      _firstAndLastNameController,
      'لطفاً نام و نام خوانوادگی خود را وارد کنید.',
    );
    _phoneNumberError = UserInformationFormatCheck.checkPhoneNumberFormat(
      _phoneNumberController,
      'لطفاً شماره تلفن همراه خود را وارد کنید.',
    );
    _passwordError = UserInformationFormatCheck.checkPasswordFormat(
      _passwordController,
      'لطفاً رمز عبور را وارد کنید.',
    );
    _repeatPasswordError = UserInformationFormatCheck.checkPasswordFormat(
      _repeatPasswordController,
      'لطفاً رمز عبور را تکرار کنید.',
    );

    if ((_firstAndLastNameError == null) &&
        (_phoneNumberError == null) &&
        (_passwordError == null) &&
        (_repeatPasswordError == null)) {
      setState(() {
        _informationRegistrationClick = false;
      });

      var client = HTTP.Client();

      try {
        HTTP.Response response = await client.post(
          Uri.parse('${domain}register'),
          body: {
            'name': _firstAndLastNameController.text,
            'username': _phoneNumberController.text,
            'password': _passwordController.text,
            'password_confirmation': _repeatPasswordController.text
          },
        );

        Map<String, dynamic> _data =
            jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

        if (response.statusCode == 200) {
          setState(() {
            sendCode = false;
            _registeredInformation = true;

            startTimer();
          });
        } else {
          setState(() {
            if ((_data['message'])['username'] != null) {
              _phoneNumberError =
                  'حساب کاربری با شماره تلفن وارد شده وجود دارد.';

              _informationRegistrationClick = true;
            }
          });
        }
      } finally {
        client.close();
      }
    }
  }

  Visibility _sendCodeButton() {
    return Visibility(
      visible: !sendCode,
      child: Padding(
        padding: EdgeInsets.only(top: 5.0.h),
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

        setState(() {
          sendCode = true;
          login = false;
          resendCodePermission = false;

          _firstAndLastNameController = TextEditingController();
          _phoneNumberController = TextEditingController();
          _passwordController = TextEditingController();
          _repeatPasswordController = TextEditingController();
        });
      }
    } catch (e) {
      setState(() {
        codeError = 'کد وارد شده صحیح نمی باشد.';

        _sendCodeClick = true;
      });
    }
  }
}
