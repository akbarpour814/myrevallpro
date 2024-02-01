class AppConfigModel {
  String? websitePathAddress;
  String? appPathHome;
  String? appNameEn;
  String? appNameFa;
  String? appEmailContact;
  String? appFavicon;
  String? appLogo;
  String? appVersionCompile;
  String? appFontContent;
  String? appFontSizeTitle;
  String? colorMasterApp;
  String? colorClientApp;
  String? appBuyCard;
  String? appBuyCardRequestLink;
  String? appBGCard;
  String? appFownloadIos;
  String? appDownloadAndroid;
  String? appAbout;

  AppConfigModel(
      {this.websitePathAddress,
      this.appPathHome,
      this.appNameEn,
      this.appNameFa,
      this.appEmailContact,
      this.appFavicon,
      this.appLogo,
      this.appVersionCompile,
      this.appFontContent,
      this.appFontSizeTitle,
      this.colorMasterApp,
      this.colorClientApp,
      this.appBuyCard,
      this.appBuyCardRequestLink,
      this.appBGCard,
      this.appAbout,
      this.appDownloadAndroid,
      this.appFownloadIos});

  factory AppConfigModel.fromJson(Map<String, dynamic> json) {
    return AppConfigModel(
      websitePathAddress: json['website_path_address'] as String?,
      appPathHome: json['app_path_home'] as String?,
      appNameEn: json['app_name_en'] as String?,
      appNameFa: json['app_name_fa'] as String?,
      appEmailContact: json['app_email_contact'] as String?,
      appFavicon: json['app_favicon'] as String?,
      appLogo: json['app_logo'] as String?,
      appVersionCompile: json['app_version_compile'] as String?,
      appFontContent: json['app_font_content'] as String?,
      appFontSizeTitle: json['app_font_size_title'] as String?,
      colorMasterApp: json['color_master_app'] as String?,
      colorClientApp: json['color_client_app'] as String?,
      appBuyCard: json['app_buy_card'] as String?,
      appBuyCardRequestLink: json['app_link_request_buy_card'] as String?,
      appBGCard: json['app_bg_card'] as String?,
      appAbout: json['app_about'] as String?,
      appDownloadAndroid: json['app_download_android'] as String?,
      appFownloadIos: json['app_download_ios'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'website_path_address': websitePathAddress,
        'app_path_home': appPathHome,
        'app_name_en': appNameEn,
        'app_name_fa': appNameFa,
        'app_email_contact': appEmailContact,
        'app_favicon': appFavicon,
        'app_logo': appLogo,
        'app_version_compile': appVersionCompile,
        'app_font_content': appFontContent,
        'app_font_size_title': appFontSizeTitle,
        'color_master_app': colorMasterApp,
        'color_client_app': colorClientApp,
        'app_bg_card': appBGCard,
      };
}
