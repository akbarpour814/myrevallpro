import 'package:customer_club/configs/di.dart';
import 'package:customer_club/core/utils/value_notifires.dart';
import 'package:customer_club/features/home/data/models/comment_request_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class IHomeDataSource {
  Future<Response> getHomeData();
  Future<Response> getGuilds();
  Future<Response> getGuildDetails(int guildId);
  Future<Response> getLocationShops();
  Future<Response> getShopDetails(int shopId);
  Future<Response> getDiscountList(int shopId);
  Future<Response> getShopLocation(int shopId);
  Future<Response> getShopWithQr(String qr);
  Future<Response> searchShops(String query);
  Future<Response> getUserNotifyShops();
  Future<Response> getShopRating(int shopId);
  Future<Response> addComment(CommentRequestModel requestModel);
}

@Injectable(
  as: IHomeDataSource,
)
class HomeDataSource implements IHomeDataSource {
  @override
  Future<Response> getHomeData() => getIt<Dio>().get('home.php');

  @override
  Future<Response> getGuilds() => getIt<Dio>().get('shop_catagories.php');

  @override
  Future<Response> getGuildDetails(int guildId) =>
      getIt<Dio>().get('category_shops.php?shop_catagories_id=$guildId');

  @override
  Future<Response> getLocationShops() => getIt<Dio>().get('shops_location.php');

  @override
  Future<Response> getShopDetails(int shopId) => getIt<Dio>().post('shop.php',
      data: {'shop_id': shopId, 'token': tokenNotifire.value});

  @override
  Future<Response> getDiscountList(int shopId) =>
      getIt<Dio>().get('shop_offer.php?shop_id=$shopId');

  @override
  Future<Response> getShopLocation(int shopId) =>
      getIt<Dio>().get('shop_location.php?shop_id=$shopId');

  @override
  Future<Response> getShopWithQr(String qr) =>
      getIt<Dio>().get('qr_shop.php?qrcode=$qr');

  @override
  Future<Response> searchShops(String query) =>
      getIt<Dio>().get('search_shops.php?search=$query');

  @override
  Future<Response> getUserNotifyShops() => getIt<Dio>()
      .post('user_notify.php', data: {'token': tokenNotifire.value});

  @override
  Future<Response> getShopRating(int shopId) => getIt<Dio>()
      .get('shop_rating.php', queryParameters: {'element_id': shopId});

  @override
  Future<Response> addComment(CommentRequestModel requestModel) =>
      getIt<Dio>().post('set_rating_shop.php',
          data: {'token': tokenNotifire.value, ...requestModel.toJson()});
}
