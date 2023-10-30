class TextTagModel {
  String? tagId;
  String? textId;
  String? issuer;

  TextTagModel({this.tagId, this.textId, this.issuer});

  factory TextTagModel.fromJson(Map json) => TextTagModel(
        tagId: json['TagId'] as String?,
        textId: json['TextId'] as String?,
        issuer: json['issuer'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'TagId': tagId,
        'TextId': textId,
        'issuer': issuer,
      };
}
