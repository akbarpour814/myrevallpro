class TagsModel {
  String? title;
  String? issuer;
  String? createAt;
  String? key;
  int usedCount = 0;

  TagsModel({this.title, this.issuer, this.createAt, this.key});

  factory TagsModel.fromJson(Map json) => TagsModel(
        title: json['title'] as String?,
        issuer: json['issuer'] as String?,
        createAt: json['createAt'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'issuer': issuer,
        'createAt': createAt,
      };
}
