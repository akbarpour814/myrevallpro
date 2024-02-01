import 'package:customer_club/core/models/shop_model.dart';
import 'package:customer_club/features/home/data/models/slider_model.dart';

class HomeDataModel {
  List<ShopModel>? shops;
  List<SliderModel>? slides;

  HomeDataModel({this.shops, this.slides});

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
        shops: (json['shops'] as List<dynamic>?)
            ?.map((e) => ShopModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        slides: (json['slides'] as List<dynamic>?)
            ?.map((e) => SliderModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'shops': shops?.map((e) => e.toJson()).toList(),
        'slides': slides,
      };
}
