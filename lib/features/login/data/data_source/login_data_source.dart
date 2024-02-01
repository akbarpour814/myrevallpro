import 'dart:io';

import 'package:customer_club/configs/di.dart';
import 'package:customer_club/core/utils/value_notifires.dart';
import 'package:customer_club/features/login/data/models/login_with_qr_request_model.dart';
import 'package:customer_club/features/login/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class ILoginDataSource {
  Future<Response> getAppConfig();
  Future<Response> loginWithQR(String qr);
  Future<Response> loginWithQRVerify(LoginWithQrRequestModel requestModel);
  Future<Response> registerWithQRVerify(LoginWithQrRequestModel requestModel);
  Future<Response> getAllCity();
  Future<Response> getProfile();
  Future<Response> getShopDetails(int shopId);
  Future<Response> uploadAvatar(File file);
  Future<Response> updateProfile(UserModel userModel);
  Future<Response> scanUserCard(String qr);
}

@Injectable(
  as: ILoginDataSource,
)
class LoginDataSource implements ILoginDataSource {
  @override
  Future<Response> getAppConfig() => getIt<Dio>().get('config_api.php');

  @override
  Future<Response> loginWithQR(String qr) =>
      getIt<Dio>().post('register_step1_qr.php', data: {'qrcode': qr});

  @override
  Future<Response> loginWithQRVerify(LoginWithQrRequestModel requestModel) =>
      getIt<Dio>()
          .post('login_step2_password.php', data: requestModel.toJson());

  @override
  Future<Response> registerWithQRVerify(LoginWithQrRequestModel requestModel) =>
      getIt<Dio>().post('register_step2_cvv.php', data: requestModel.toJson());

  @override
  Future<Response> getShopDetails(int shopId) => getIt<Dio>().post('shop.php',
      data: {'shop_id': shopId, 'token': tokenNotifire.value});

  @override
  Future<Response> getAllCity() => getIt<Dio>().get('cities.php');

  @override
  Future<Response> getProfile() =>
      getIt<Dio>().get('user_info.php', data: {'token': tokenNotifire.value});

  @override
  Future<Response> uploadAvatar(File file) async =>
      getIt<Dio>().post('upload_user_img.php',
          data: FormData.fromMap(
            {
              "image": await MultipartFile.fromFile(
                file.path,
                filename: file.path.split('/').last,
              ),
              'token': tokenNotifire.value
            },
          ));

  @override
  Future<Response> updateProfile(UserModel userModel) =>
      getIt<Dio>().post('user_edit.php',
          data: {'token': tokenNotifire.value, ...userModel.toJson()});

  @override
  Future<Response> scanUserCard(String qr) =>
      getIt<Dio>().post('qr_manager_shop.php',
          data: {'qrcode': qr, 'token': tokenNotifire.value});
}
