class ShopConfigModel {
  String? appFontContent;
  String? appFontSizeTitle;
  String? appRatingStarOn;
  String? appRatingStarOff;
  String? iconAddress;

  ShopConfigModel({
    this.appFontContent,
    this.appFontSizeTitle,
    this.appRatingStarOn,
    this.appRatingStarOff,
    this.iconAddress,
  });

  factory ShopConfigModel.fromJson(Map<String, dynamic> json) =>
      ShopConfigModel(
        appFontContent: json['app_font_content'] as String?,
        appFontSizeTitle: json['app_font_size_title'] as String?,
        appRatingStarOn: json['app_rating_star_on'] as String?,
        appRatingStarOff: json['app_rating_star_off'] as String?,
        iconAddress: json['icon_address'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'app_font_content': appFontContent,
        'app_font_size_title': appFontSizeTitle,
        'app_rating_star_on': appRatingStarOn,
        'app_rating_star_off': appRatingStarOff,
        'icon_address': iconAddress,
      };
}
