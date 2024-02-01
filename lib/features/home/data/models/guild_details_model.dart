import 'package:customer_club/core/models/guild_model.dart';
import 'package:customer_club/core/models/shop_model.dart';

class GuildDetailsModel {
  List<ShopModel>? shops;
  GuildModel? category;

  GuildDetailsModel({this.shops, this.category});

  factory GuildDetailsModel.fromJson(Map<String, dynamic> json) {
    return GuildDetailsModel(
      shops: (json['shops'] as List<dynamic>?)
          ?.map((e) => ShopModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: json['category'] == null
          ? null
          : GuildModel.fromJson(json['category'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'shops': shops?.map((e) => e.toJson()).toList(),
        'category': category?.toJson(),
      };
}
