import 'dart:io';

import 'package:customer_club/configs/di.dart';
import 'package:customer_club/core/models/app_config_model.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:customer_club/core/models/shop_details_model/shop_all_details_model.dart';
import 'package:customer_club/features/login/data/data_source/login_data_source.dart';
import 'package:customer_club/features/login/data/models/city_model.dart';
import 'package:customer_club/features/login/data/models/login_or_register_response_model.dart';
import 'package:customer_club/features/login/data/models/login_with_qr_request_model.dart';
import 'package:customer_club/features/login/data/models/user_model.dart';
import 'package:customer_club/features/login/domain/repository/login_repository.dart';
import 'package:dio/src/response.dart';
import 'package:injectable/injectable.dart';

Response<dynamic>? _cityRes;

@Injectable(
  as: ILoginRepository,
)
class LoginRepository implements ILoginRepository {
  @override
  Future<DataState<AppConfigModel>> getAppConfig() async {
    try {
      final res = await getIt<ILoginDataSource>().getAppConfig();
      if (res.validate()) {
        return DataSuccess(AppConfigModel.fromJson((res.data)));
      }
      return DataError(res.getErrorMessage);
    } catch (e) {
      return DataError(null.getErrorMessage);
    }
  }

  @override
  Future<DataState<LoginOrRegisterResponseModel>> loginWithQR(String qr) async {
    try {
      final res = await getIt<ILoginDataSource>().loginWithQR(qr);
      if (_isLoginOk(res)) {
        return DataSuccess(LoginOrRegisterResponseModel(
            idCard: (((res.data as List).first as Map<String, dynamic>)['data']
                    as Map<String, dynamic>)['idcard']
                .toString(),
            isLogin:
                ((res.data as List).first as Map<String, dynamic>)['success'] ==
                    'login'));
      }
      return DataError(
          ((res.data as List).first as Map<String, dynamic>)['error'] ??
              'خطا در برقراری ارتباط با سرور');
    } catch (e) {
      return DataError(null.getErrorMessage);
    }
  }

  @override
  Future<DataState<String>> loginWithQRVerify(
      LoginWithQrRequestModel requestModel) async {
    try {
      final res =
          await getIt<ILoginDataSource>().loginWithQRVerify(requestModel);
      if (_isLoginOk(res)) {
        return DataSuccess(
            (((res.data as List).first as Map<String, dynamic>)['token']
                .toString()));
      }
      return DataError(
          ((res.data as List).first as Map<String, dynamic>)['error'] ??
              'خطا در برقراری ارتباط با سرور');
    } catch (e) {
      return DataError(null.getErrorMessage);
    }
  }

  @override
  Future<DataState<String>> registerWithQRVerify(
      LoginWithQrRequestModel requestModel) async {
    try {
      final res =
          await getIt<ILoginDataSource>().registerWithQRVerify(requestModel);
      if (_isLoginOk(res)) {
        return DataSuccess(
            (((res.data as List).first as Map<String, dynamic>)['token']
                .toString()));
      }
      return DataError(
          ((res.data as List).first as Map<String, dynamic>)['error'] ??
              'خطا در برقراری ارتباط با سرور');
    } catch (e) {
      return DataError(null.getErrorMessage);
    }
  }

  bool _isLoginOk(Response<dynamic> res) {
    return res.statusCode == 200 &&
        res.data != null &&
        (((res.data as List).first as Map<String, dynamic>)['success'] ==
                true ||
            ((res.data as List).first as Map<String, dynamic>)['success'] ==
                'login');
  }

  @override
  Future<DataState<List<CityModel>>> getAllCity() async {
    try {
      if (_cityRes.validate()) {
        return DataSuccess((_cityRes!.data as List?)
            ?.map((e) => CityModel.fromJson(e))
            .toList());
      } else {
        _cityRes = await getIt<ILoginDataSource>().getAllCity();
        if (_cityRes.validate()) {
          return DataSuccess((_cityRes!.data as List?)
              ?.map((e) => CityModel.fromJson(e))
              .toList());
        }
        return DataError(_cityRes.getErrorMessage);
      }
    } catch (e) {
      return DataError(null.getErrorMessage);
    }
  }

  @override
  Future<DataState<UserModel>> getProfile() async {
    try {
      final res = await getIt<ILoginDataSource>().getProfile();
      if (res.validate(checkError: true)) {
        return DataSuccess(
            UserModel.fromJson((res.data as Map<String, dynamic>)['data']));
      }
      return DataError(res.getErrorMessage);
    } catch (e) {
      return DataError(null.getErrorMessage);
    }
  }

  @override
  Future<DataState<ShopAllDetailsModel>> getShopDetails(int shopId) async {
    try {
      final res = await getIt<ILoginDataSource>().getShopDetails(shopId);
      if (res.validate()) {
        return DataSuccess(ShopAllDetailsModel.fromJson(res.data));
      }
      return DataError(res.getErrorMessage);
    } catch (e) {
      return DataError(null.getErrorMessage);
    }
  }

  @override
  Future<DataState<String>> uploadAvatar(File file) async {
    try {
      final res = await getIt<ILoginDataSource>().uploadAvatar(file);
      if (_isLoginOk(res)) {
        return DataSuccess(
            ((((res.data as List).first as Map<String, dynamic>)['filename']
                .toString())));
      }
      return DataError(res.getErrorMessage);
    } catch (e) {
      return DataError(null.getErrorMessage);
    }
  }

  @override
  Future<DataState> updateProfile(UserModel userModel) async {
    try {
      final res = await getIt<ILoginDataSource>().updateProfile(userModel);
      if (_isLoginOk(res)) {
        return DataSuccess(null);
      } else {
        return DataError(res.getErrorMessage);
      }
    } catch (e) {
      return DataError(null.getErrorMessage);
    }
  }

  @override
  Future<DataState> scanUserCard(String qr) async {
    try {
      final res = await getIt<ILoginDataSource>().scanUserCard(qr);
      if (_isLoginOk(res)) {
        return DataSuccess(null);
      } else {
        return DataError(res.getErrorMessage);
      }
    } catch (e) {
      return DataError(null.getErrorMessage);
    }
  }
}
