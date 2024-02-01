import 'package:customer_club/configs/color_palette.dart';
import 'package:customer_club/core/utils/const.dart';
import 'package:customer_club/core/utils/custom_modals.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/core/utils/my_icons.dart';
import 'package:customer_club/core/utils/utils.dart';
import 'package:customer_club/core/utils/validators.dart';
import 'package:customer_club/core/utils/value_notifires.dart';
import 'package:customer_club/core/widgets/my_loading.dart';
import 'package:customer_club/features/login/data/models/login_with_qr_request_model.dart';
import 'package:customer_club/features/login/presentation/blocs/verfiy_login/verify_login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class VerifyLoginScreen extends StatefulWidget {
  final String idCard;
  final bool isLogin;
  const VerifyLoginScreen(
      {super.key, required this.idCard, required this.isLogin});

  @override
  State<VerifyLoginScreen> createState() => _VerifyLoginScreenState();
}

class _VerifyLoginScreenState extends State<VerifyLoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _cvv2Controller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureCvv2 = true;
  String _cvv2Icon = MyIcons.eyeBlack;
  bool _obscurePass = true;
  String _passIcon = MyIcons.eyeBlack;
  FocusNode _passNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(child: SvgPicture.string(MyIcons.userVerify)),
        title: const Text(
          'تایید کارت',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: ColorPalette.primaryColor,
      ),
      body: BlocProvider(
        create: (context) => VerifyLoginBloc(),
        child: BlocConsumer<VerifyLoginBloc, VerifyLoginState>(
          listener: (context, state) {
            if (state is VerifyLoginSuccess) {
              CustomModal.showSuccess(context, 'خوش آمدید');
              tokenNotifire.value = state.token;
              Navigator.pop(context);
            }
            if (state is VerifyLoginError) {
              CustomModal.showError(context, state.message);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Form(
                key: _formKey,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 24),
                      padding: EdgeInsets.all(12),
                      height: 50.w(context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                appConfig.appBGCard ?? '',
                              ))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                appConfig.appNameFa ?? '',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: 2.5.w(context)),
                                child: Text(
                                  '${widget.idCard.toPersianDigit().substring(0, 4)}-${widget.idCard.toPersianDigit().substring(4, 8)}-${widget.idCard.toPersianDigit().substring(8, 12)}-${widget.idCard.toPersianDigit().substring(12, 16)}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          if (!widget.isLogin) ...[
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _nameController,
                                    maxLines: 1,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                        label: Text('نام'),
                                        prefixIconConstraints: BoxConstraints(
                                            maxWidth: 30, minWidth: 30),
                                        prefixIcon: SizedBox(
                                          width: 20,
                                          child: Center(
                                            child: SvgPicture.string(
                                              MyIcons.userPrimary,
                                              width: 20,
                                            ),
                                          ),
                                        )),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'نام را وارد نمایید';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                8.wsb(),
                                Expanded(
                                  child: TextFormField(
                                    controller: _lastNameController,
                                    textInputAction: TextInputAction.next,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        label: Text('نام خانوادگی'),
                                        prefixIconConstraints: BoxConstraints(
                                            maxWidth: 30, minWidth: 30),
                                        prefixIcon: SizedBox(
                                          width: 20,
                                          child: Center(
                                            child: SvgPicture.string(
                                              MyIcons.userPrimary,
                                              width: 20,
                                            ),
                                          ),
                                        )),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'نام خانوادگی را وارد نمایید';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            16.hsb(),
                            TextFormField(
                              controller: _usernameController,
                              maxLines: 1,
                              textDirection: TextDirection.ltr,
                              textInputAction: TextInputAction.next,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                  label: Text('نام کاربری'),
                                  prefixIconConstraints: BoxConstraints(
                                      maxWidth: 30, minWidth: 30),
                                  prefixIcon: SizedBox(
                                    width: 20,
                                    child: Center(
                                      child: SvgPicture.string(
                                        MyIcons.userPrimary,
                                        width: 20,
                                      ),
                                    ),
                                  )),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'نام کاربری را به درستی وارد نمایید';
                                }
                                if (value.characters
                                    .any((element) => element.isPersian)) {
                                  return 'نام کاربری باید لاتین باشد';
                                }
                                return null;
                              },
                            ),
                            16.hsb(),
                            TextFormField(
                              controller: _mobileController,
                              maxLines: 1,
                              textDirection: TextDirection.ltr,
                              textInputAction: TextInputAction.next,
                              textAlign: TextAlign.right,
                              keyboardType: textInputType(TypeEnum.mobile),
                              inputFormatters:
                                  typeInputFormatters(TypeEnum.mobile),
                              decoration: InputDecoration(
                                  label: Text('شماره موبایل'),
                                  prefixIconConstraints: BoxConstraints(
                                      maxWidth: 30, minWidth: 30),
                                  prefixIcon: SizedBox(
                                    width: 20,
                                    child: Center(
                                      child: SvgPicture.string(
                                        MyIcons.mobile,
                                        width: 20,
                                      ),
                                    ),
                                  )),
                              validator: (value) =>
                                  mobileNumberValidator(value),
                            ),
                            16.hsb(),
                            TextFormField(
                              controller: _cvv2Controller,
                              maxLines: 1,
                              textDirection: TextDirection.ltr,
                              textInputAction: TextInputAction.next,
                              textAlign: TextAlign.right,
                              onFieldSubmitted: (_) {
                                _passNode.requestFocus();
                              },
                              obscureText: _obscureCvv2,
                              keyboardType: textInputType(TypeEnum.cvv2),
                              inputFormatters:
                                  typeInputFormatters(TypeEnum.cvv2),
                              decoration: InputDecoration(
                                label: Text('CVV2'),
                                prefixIconConstraints:
                                    BoxConstraints(maxWidth: 30, minWidth: 30),
                                prefixIcon: SizedBox(
                                  width: 20,
                                  child: Center(
                                    child: SvgPicture.string(
                                      MyIcons.passwordPrimary,
                                      width: 20,
                                    ),
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _obscureCvv2 = !_obscureCvv2;
                                      _cvv2Icon = _obscureCvv2
                                          ? MyIcons.eyeBlack
                                          : MyIcons.removeEyeBlck;
                                    });
                                  },
                                  icon: SvgPicture.string(
                                    _cvv2Icon,
                                    width: 20,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.length != 4) {
                                  return 'CVV2 را به درستی وارد نمایید';
                                }
                                return null;
                              },
                            ),
                            16.hsb(),
                          ],
                          TextFormField(
                            focusNode: _passNode,
                            controller: _passwordController,
                            textInputAction: TextInputAction.go,
                            maxLines: 1,
                            onFieldSubmitted: (_) => _enter(state, context),
                            obscureText: _obscurePass,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.right,
                            keyboardType: textInputType(TypeEnum.password),
                            inputFormatters:
                                typeInputFormatters(TypeEnum.password),
                            decoration: InputDecoration(
                              label: Text('رمز عبور'),
                              prefixIconConstraints:
                                  BoxConstraints(maxWidth: 30, minWidth: 30),
                              prefixIcon: SizedBox(
                                width: 20,
                                child: Center(
                                  child: SvgPicture.string(
                                    MyIcons.passwordPrimary,
                                    width: 20,
                                  ),
                                ),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscurePass = !_obscurePass;
                                    _passIcon = _obscurePass
                                        ? MyIcons.eyeBlack
                                        : MyIcons.removeEyeBlck;
                                  });
                                },
                                icon: SvgPicture.string(
                                  _passIcon,
                                  width: 20,
                                ),
                              ),
                            ),
                            validator: passwordValidator,
                          ),
                          24.hsb(),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      ColorPalette.primaryColor)),
                              onPressed: () {
                                _enter(state, context);
                              },
                              child: state is VerifyLoginLoading
                                  ? MyLoading(
                                      withText: false,
                                      color: Colors.white,
                                    )
                                  : Text(widget.isLogin
                                      ? 'ورود'
                                      : 'تایید اطلاعات'))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _enter(VerifyLoginState state, BuildContext context) {
    if (state is! VerifyLoginLoading) {
      if (_formKey.currentState!.validate()) {
        if (!widget.isLogin) {
          BlocProvider.of<VerifyLoginBloc>(context).add(
              VerifyRegisterRequestEvent(
                  requestModel: LoginWithQrRequestModel(
                      cvv2: _cvv2Controller.text.trim(),
                      password: _passwordController.text.trim(),
                      fname: _nameController.text.trim(),
                      lname: _lastNameController.text.trim(),
                      mobile: _mobileController.text.trim(),
                      username: _usernameController.text.trim(),
                      idcard: widget.idCard)));
        } else {
          BlocProvider.of<VerifyLoginBloc>(context).add(VerifyLoginRequestEvent(
              requestModel: LoginWithQrRequestModel(
                  password: _passwordController.text.trim(),
                  idcard: widget.idCard)));
        }
      }
    }
  }
}
