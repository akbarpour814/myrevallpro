import 'dart:io';

import 'package:customer_club/core/models/app_config_model.dart';
import 'package:customer_club/core/models/shop_details_model/shop_all_details_model.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/features/login/data/models/city_model.dart';
import 'package:customer_club/features/login/data/models/login_or_register_response_model.dart';
import 'package:customer_club/features/login/data/models/login_with_qr_request_model.dart';
import 'package:customer_club/features/login/data/models/user_model.dart';

abstract class ILoginRepository {
  Future<DataState<AppConfigModel>> getAppConfig();
  Future<DataState<LoginOrRegisterResponseModel>> loginWithQR(String qr);
  Future<DataState<String>> loginWithQRVerify(
      LoginWithQrRequestModel requestModel);
  Future<DataState<String>> registerWithQRVerify(
      LoginWithQrRequestModel requestModel);
  Future<DataState<ShopAllDetailsModel>> getShopDetails(int shopId);
  Future<DataState<List<CityModel>>> getAllCity();
  Future<DataState<UserModel>> getProfile();
  Future<DataState<String>> uploadAvatar(File file);
  Future<DataState> updateProfile(UserModel userModel);
  Future<DataState> scanUserCard(String qr);
}
