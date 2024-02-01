import 'shop_config_model.dart';
import 'shop_detail_model.dart';

class ShopAllDetailsModel {
  ShopDetailModel? shop;
  ShopConfigModel? config;

  ShopAllDetailsModel({this.shop, this.config});

  factory ShopAllDetailsModel.fromJson(Map<String, dynamic> json) {
    return ShopAllDetailsModel(
      shop: json['shop'] == null
          ? null
          : ShopDetailModel.fromJson(json['shop'] as Map<String, dynamic>),
      config: json['config'] == null
          ? null
          : ShopConfigModel.fromJson(json['config'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'shop': shop?.toJson(),
        'config': config?.toJson(),
      };
}
