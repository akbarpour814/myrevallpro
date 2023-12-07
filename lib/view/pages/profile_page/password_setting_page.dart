//------/dart and flutter packages
import 'package:flutter/material.dart';

//------/packages
import 'package:sizer/sizer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

//------/controller
import '/controller/custom_dio.dart';
import '/controller/custom_response.dart';
import '/controller/functions_for_checking_user_information_format.dart';
import '/controller/internet_connection.dart';
import '/controller/load_data_from_api.dart';

//------/view/view_models
import '/view/view_models/custom_snack_bar.dart';
import '/view/view_models/no_internet_connection.dart';

//------/main
import '/main.dart';

class PasswordSettingPage extends StatefulWidget {
  const PasswordSettingPage({Key? key}) : super(key: key);

  @override
  _PasswordSettingPageState createState() => _PasswordSettingPageState();
}

class _PasswordSettingPageState extends State<PasswordSettingPage>
    with InternetConnection, LoadDataFromAPI {
  late TextEditingController _previousPasswordController;
  String? _previousPasswordError;
  late TextEditingController _newPasswordController = TextEditingController();
  String? _newPasswordError;
  late TextEditingController _repeatNewPasswordController =
      TextEditingController();
  String? _repeatNewPasswordError;
  late bool _newPasswordRegistered;
  late bool _obscureText;

  late bool _newPasswordRegistrationClick;

  @override
  void initState() {
    super.initState();

    _previousPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _repeatNewPasswordController = TextEditingController();
    _newPasswordRegistered = false;
    _obscureText = true;

    _newPasswordRegistrationClick = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: playerBottomNavigationBar,
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('تغییر رمز'),
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
                _previousPassword(),
                _newPassword(),
                _repeatNewPassword(),
                _newPasswordRegistrationButton(),
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

  Padding _previousPassword() {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.5.h),
      child: TextField(
        readOnly: false,
        obscureText: _obscureText,
        controller: _previousPasswordController,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          helperText: 'رمز عبور قبلی',
          hintText: 'لطفاً رمز عبور قبلی را وارد کنید.',
          errorText: _previousPasswordError,
          suffixIcon: const Icon(Ionicons.key_outline),
        ),
        onChanged: (String text) {
          setState(() {
            _previousPasswordError =
                UserInformationFormatCheck.checkPasswordFormat(
              _previousPasswordController,
              null,
            );
          });
        },
      ),
    );
  }

  Padding _newPassword() {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.5.h),
      child: TextField(
        readOnly: false,
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
            _newPasswordError = UserInformationFormatCheck.checkPasswordFormat(
              _newPasswordController,
              null,
            );
          });
        },
      ),
    );
  }

  Padding _repeatNewPassword() {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.5.h),
      child: TextField(
        readOnly: false,
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
    );
  }

  Padding _newPasswordRegistrationButton() {
    return Padding(
      padding: EdgeInsets.only(top: 5.0.h),
      child: Center(
        child: SizedBox(
          width: 100.0.w - (2 * 5.0.w),
          child: ElevatedButton.icon(
            onPressed: () {
              setState(() {
                if (_newPasswordController.text !=
                    _repeatNewPasswordController.text) {
                  _repeatNewPasswordError =
                      'لطفاً رمز عبور جدید را تکرار کنید.';
                } else {
                  if(_newPasswordRegistrationClick) {
                    _newPasswordRegistration();
                  }
                }
              });
            },
            label: Text(_newPasswordRegistrationClick ? 'ثبت رمز عبور جدید' : 'لطفاً شکیبا باشید.'),
            icon: const Icon(Ionicons.checkmark_outline),
          ),
        ),
      ),
    );
  }

  void _newPasswordRegistration() async {
    try {
      _previousPasswordError = UserInformationFormatCheck.checkPasswordFormat(
        _previousPasswordController,
        'لطفاً رمز عبور قبلی را وارد کنید.',
      );
      _newPasswordError = UserInformationFormatCheck.checkPasswordFormat(
        _newPasswordController,
        'لطفاً رمز عبور جدید را وارد کنید.',
      );
      _repeatNewPasswordError = UserInformationFormatCheck.checkPasswordFormat(
        _repeatNewPasswordController,
        'لطفاً رمز عبور جدید را تکرار کنید.',
      );

      if (_previousPasswordError == null &&
          _newPasswordError == null &&
          _repeatNewPasswordError == null) {
        setState(() {
          _newPasswordRegistrationClick = false;
        });

        customDio = await CustomDio.dio.post(
          'dashboard/user/password',
          data: {
            'old_password': _previousPasswordController.text,
            'password': _newPasswordController.text,
            'password_confirmation': _repeatNewPasswordController.text,
          },
        );

        customResponse = CustomResponse.fromJson(customDio.data);

        setState(() {
          _newPasswordRegistered = customResponse.success;

          if (_newPasswordRegistered) {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(
                context,
                Ionicons.checkmark_done_outline,
                'رمز عبور جدید ثبت شد.',
                4,
              ),
            );
          }

          _previousPasswordController = TextEditingController();
          _newPasswordController = TextEditingController();
          _repeatNewPasswordController = TextEditingController();

          _newPasswordRegistrationClick = true;
        });
      }
    } catch (e) {
      setState(() {
        _previousPasswordError = 'رمز عبور قبلی صحیح نمی باشد.';

        _newPasswordRegistrationClick = true;
      });
    }
  }
}
