import 'dart:async';
import 'dart:io';

import 'package:customer_club/configs/color_palette.dart';
import 'package:customer_club/configs/di.dart';
import 'package:customer_club/core/utils/const.dart';
import 'package:customer_club/core/utils/custom_modals.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/core/utils/image_picker.dart';
import 'package:customer_club/core/utils/my_icons.dart';
import 'package:customer_club/core/utils/my_navigator.dart';
import 'package:customer_club/core/utils/utils.dart';
import 'package:customer_club/core/utils/validators.dart';
import 'package:customer_club/core/utils/value_notifires.dart';
import 'package:customer_club/core/widgets/my_icon_button.dart';
import 'package:customer_club/core/widgets/my_loading.dart';
import 'package:customer_club/features/home/presentation/screens/user_notify_shops_screen.dart';
import 'package:customer_club/features/login/data/models/city_model.dart';
import 'package:customer_club/features/login/data/models/user_model.dart';
import 'package:customer_club/features/login/presentation/blocs/get_profile/get_profile_bloc.dart';
import 'package:customer_club/features/login/presentation/blocs/update_profile/update_profile_bloc.dart';
import 'package:customer_club/features/login/presentation/blocs/upload_avatar/upload_avatar_bloc.dart';
import 'package:customer_club/features/login/presentation/widgets/city/city_drobdown.dart';
import 'package:customer_club/features/login/presentation/widgets/profile_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:badges/badges.dart' as badges;
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  File? _pickedImage;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePass = true;
  String _passIcon = MyIcons.eyeBlack;
  FocusNode _passNode = FocusNode();
  CityModel? _selectedCity;
  String? _uploadedAvatarLink;
  bool _firstLoaded = false;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final bloc = GetProfileBloc()..add(GetProfileStartEvent());
            _timer = Timer.periodic(Duration(seconds: 8), (timer) {
              if (tokenNotifire.value.isNotNullOrEmpty) {
                bloc.add(GetProfileNumNotifEvent(
                    shopDetailModel: bloc.state is GetProfileLoaded
                        ? (bloc.state as GetProfileLoaded).shopModel
                        : null));
              }
            });
            return bloc;
          },
        ),
        BlocProvider(
          create: (context) => UploadAvatarBloc(),
        ),
        BlocProvider(
          create: (context) => UpdateProfileBloc(),
        ),
      ],
      child: BlocConsumer<GetProfileBloc, GetProfileState>(
          listener: (context, state) {
        if (state is GetProfileLoaded) {
          if (!_firstLoaded) {
            _firstLoaded = true;
            _userNameController.text = state.user.username ?? '';
            _firstNameController.text = state.user.fname ?? '';
            _lastNameController.text = state.user.lname ?? '';
            _mobileController.text = state.user.mobile ?? '';
            _emailController.text = state.user.email ?? '';
            setState(() {});
          }
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Center(child: SvgPicture.string(MyIcons.profileWhite)),
            title: const Text(
              'حساب کاربری',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              MyIconButton(
                  onTap: state is GetProfileLoaded &&
                          state.user.numNotify.isNotNullOrEmpty &&
                          (int.tryParse(state.user.numNotify ?? '0') ?? 0) > 0
                      ? () => MyNavigator.push(context, UserNotifyShopsScreen())
                      : null,
                  padding: EdgeInsets.zero,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.string(
                          MyIcons.message,
                          width: 22,
                        ),
                      ),
                      badges.Badge(
                        position: badges.BadgePosition.topEnd(top: 0, end: 0),
                        showBadge: state is GetProfileLoaded &&
                            state.user.numNotify.isNotNullOrEmpty &&
                            (int.tryParse(state.user.numNotify ?? '0') ?? 0) >
                                0,
                        ignorePointer: false,
                        badgeContent: Text(
                          (state is GetProfileLoaded
                                  ? (state.user.numNotify ?? '')
                                  : '')
                              .toPersianDigit(),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 10, color: Colors.white),
                        ),
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: Colors.green.shade700,
                          padding: EdgeInsets.all((state is GetProfileLoaded
                                      ? int.parse(state.user.numNotify ?? '0')
                                      : 0) <
                                  10
                              ? 6
                              : 5),
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1),
                        ),
                      )
                    ],
                  )),
              _menu(),
            ],
            centerTitle: true,
            backgroundColor: ColorPalette.primaryColor,
          ),
          body: state is GetProfileLoaded
              ? Form(
                  key: _formKey,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 160),
                    children: [
                      Row(
                        children: [
                          BlocConsumer<UploadAvatarBloc, UploadAvatarState>(
                            listener: (context, uploadState) {
                              if (uploadState is UploadAvatarSuccess) {
                                _uploadedAvatarLink = uploadState.link;
                              }
                            },
                            builder: (context, uploadState) {
                              return Padding(
                                  padding: const EdgeInsets.only(
                                      right: 16, top: 16, bottom: 24),
                                  child: InkWell(
                                    borderRadius:
                                        BorderRadius.circular(18.w(context)),
                                    onTapDown: (details) {
                                      if (state is! UploadAvatarLoading) {
                                        imagePicker(context, details,
                                            isAlreadyPicked: _pickedImage !=
                                                null, onPick: (file) {
                                          if (file != null) {
                                            setState(() {
                                              _pickedImage = file;
                                            });
                                            BlocProvider.of<UploadAvatarBloc>(
                                                    context)
                                                .add(UploadAvatarStartEvent(
                                                    file: file));
                                          }
                                        });
                                      }
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 30.w(context),
                                          height: 30.w(context),
                                          margin: EdgeInsets.only(
                                              bottom: 4, left: 4),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2,
                                                  color: ColorPalette
                                                      .primaryColor),
                                              shape: BoxShape.circle,
                                              image: _pickedImage != null
                                                  ? DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: FileImage(
                                                          _pickedImage!))
                                                  : state.user.image
                                                          .isNotNullOrEmpty
                                                      ? DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                              state
                                                                  .user.image!))
                                                      : null),
                                        ),
                                        Positioned(
                                            bottom: 8,
                                            left: 8,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  color:
                                                      ColorPalette.primaryColor,
                                                  shape: BoxShape.circle),
                                              child: Icon(
                                                CupertinoIcons
                                                    .photo_camera_solid,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ))
                                      ],
                                    ),
                                  ));
                            },
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                state.user.expireDay!,
                                style: TextStyle(color: Colors.green.shade700),
                              ),
                              8.hsb(),
                              Text(
                                '${state.user.idcard!.toPersianDigit().substring(0, 4)}-${state.user.idcard!.toPersianDigit().substring(4, 8)}-${state.user.idcard!.toPersianDigit().substring(8, 12)}-${state.user.idcard!.toPersianDigit().substring(12, 16)}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorPalette.primaryColor),
                              )
                            ],
                          ))
                        ],
                      ),
                      if (state.shopModel != null)
                        ProfileStore(
                          shop: state.shopModel!,
                          canScanQr: state.user.qrscan ?? false,
                          onScan: () {
                            Navigator.pop(context);
                            BlocProvider.of<GetProfileBloc>(context)
                                .add(GetProfileStartEvent());
                          },
                        ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _firstNameController,
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
                                if (value == null || value.trim().isEmpty) {
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
                                if (value == null || value.trim().isEmpty) {
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
                        controller: _userNameController,
                        maxLines: 1,
                        textDirection: TextDirection.ltr,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.right,
                        readOnly: true,
                        decoration: InputDecoration(
                            label: Text('نام کاربری'),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            prefixIconConstraints:
                                BoxConstraints(maxWidth: 30, minWidth: 30),
                            prefixIcon: SizedBox(
                              width: 20,
                              child: Center(
                                child: SvgPicture.string(
                                  MyIcons.userPrimary,
                                  width: 20,
                                ),
                              ),
                            )),
                      ),
                      16.hsb(),
                      TextFormField(
                        controller: _mobileController,
                        maxLines: 1,
                        textDirection: TextDirection.ltr,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.right,
                        keyboardType: textInputType(TypeEnum.mobile),
                        readOnly: true,
                        inputFormatters: typeInputFormatters(TypeEnum.mobile),
                        decoration: InputDecoration(
                            label: Text('شماره موبایل'),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            prefixIconConstraints:
                                BoxConstraints(maxWidth: 30, minWidth: 30),
                            prefixIcon: SizedBox(
                              width: 20,
                              child: Center(
                                child: SvgPicture.string(
                                  MyIcons.mobile,
                                  width: 20,
                                ),
                              ),
                            )),
                      ),
                      8.hsb(),
                      Divider(
                        color: Colors.grey.shade200,
                      ),
                      8.hsb(),
                      TextFormField(
                        controller: _emailController,
                        maxLines: 1,
                        textDirection: TextDirection.ltr,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.right,
                        keyboardType: textInputType(TypeEnum.email),
                        inputFormatters: typeInputFormatters(TypeEnum.email),
                        decoration: InputDecoration(
                            label: Text('ایمیل'),
                            prefixIconConstraints:
                                BoxConstraints(maxWidth: 30, minWidth: 30),
                            prefixIcon: SizedBox(
                              width: 20,
                              child: Center(
                                child: SvgPicture.string(
                                  MyIcons.mobile,
                                  width: 20,
                                ),
                              ),
                            )),
                        validator: (value) => emailValidator(value),
                      ),
                      16.hsb(),
                      CityListDrobDown(
                          onSelected: (selected) {
                            _selectedCity = selected;
                          },
                          selectCityId: state.user.cityId),
                      16.hsb(),
                      TextFormField(
                        focusNode: _passNode,
                        controller: _passwordController,
                        textInputAction: TextInputAction.go,
                        maxLines: 1,
                        obscureText: _obscurePass,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.right,
                        keyboardType: textInputType(TypeEnum.password),
                        inputFormatters: typeInputFormatters(TypeEnum.password),
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
                        validator: (value) {
                          if (value.isNotNullOrEmpty && value!.length < 6) {
                            return 'رمز عبور باید شامل حداقل 6 کاراکتر باشد ';
                          } else {
                            return null;
                          }
                        },
                      ),
                      24.hsb(),
                      BlocConsumer<UpdateProfileBloc, UpdateProfileState>(
                        listener: (context, updateState) {
                          if (updateState is UpdateProfileSuccess) {
                            CustomModal.showSuccess(
                                context, 'حساب کاربری با موفقیت ذخیره شد');
                          }
                          if (updateState is UpdateProfileError) {
                            CustomModal.showError(context, updateState.message);
                          }
                        },
                        builder: (context, updateState) {
                          return ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      ColorPalette.primaryColor)),
                              onPressed: () {
                                if (updateState is! UpdateProfileLoading) {
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<UpdateProfileBloc>(context)
                                        .add(UpdateProfileRequestEvent(
                                            userModel: UserModel(
                                                cityId: _selectedCity?.id
                                                    .toString(),
                                                email: _emailController.text
                                                    .trim(),
                                                fname: _firstNameController.text
                                                    .trim(),
                                                image: _uploadedAvatarLink ??
                                                    state.user.image,
                                                lname: _lastNameController.text
                                                    .trim(),
                                                password: _passwordController
                                                            .text.length >
                                                        5
                                                    ? _passwordController.text
                                                        .trim()
                                                    : null)));
                                  }
                                }
                              },
                              child: updateState is UpdateProfileLoading
                                  ? MyLoading(
                                      withText: false,
                                      color: Colors.white,
                                    )
                                  : Text('ذخیره'));
                        },
                      )
                    ],
                  ),
                )
              : state is GetProfileLoading
                  ? MyLoading()
                  : Center(
                      child: Text('حساب کاربری یافت نشد'),
                    ),
        );
      }),
    );
  }

  Padding _menu() {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: PopupMenuButton<int>(
        icon: SvgPicture.string(
          MyIcons.menu,
        ),
        color: Colors.white,
        surfaceTintColor: Colors.white,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        itemBuilder: (context) => [
          if (appConfig.appAbout.isNotNullOrEmpty)
            PopupMenuItem<int>(
              onTap: () {
                FocusScope.of(context).requestFocus();
                showDialog(
                  context: context,
                  builder: (context) => Directionality(
                    textDirection: TextDirection.rtl,
                    child: AlertDialog(
                      backgroundColor: Colors.white,
                      surfaceTintColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      title: Text(
                        'درباره ما',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            appConfig.appAbout!,
                            textAlign: TextAlign.justify,
                            style: TextStyle(height: 2),
                          ),
                          if (appConfig.website.isNotNullOrEmpty)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    launchUrl(
                                        Uri.parse(
                                            appConfig.website ?? ''),
                                        mode: LaunchMode.externalApplication,
                                        webOnlyWindowName: '_self');
                                  },
                                  child: Text(
                                    appConfig.website!,
                                    style: TextStyle(
                                        height: 2,
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue),
                                  ),
                                ),
                                8.wsb(),
                                SvgPicture.string(
                                  MyIcons.siteGray,
                                  width: 16,
                                ),
                              ],
                            ),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('بستن'))
                      ],
                    ),
                  ),
                );
              },
              value: 0,
              height: 36,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.string(
                    MyIcons.abountUs,
                    width: 20,
                  ),
                  8.wsb(),
                  Text(
                    'درباره ما',
                    style: TextStyle(color: Color(0xff292D32)),
                  ),
                ],
              ),
            ),
          PopupMenuItem<int>(
            onTap: () async {
              await getIt<FlutterSecureStorage>().deleteAll();
              tokenNotifire.value = null;
            },
            value: 1,
            height: 36,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.string(
                  MyIcons.logout,
                  width: 20,
                ),
                8.wsb(),
                Text(
                  'خروج از حساب کاربری',
                  style: TextStyle(color: Color(0xff292D32)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
