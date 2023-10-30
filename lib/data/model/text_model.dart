import 'package:revallpro/data/model/tags_model.dart';

class TextModel {
  String? title;
  String? issuer;
  String? createAt;
  String? key;
  List<TagsModel>? tagsList;

  TextModel({this.title, this.issuer, this.createAt, this.tagsList,this.key});

  factory TextModel.fromJson(Map json) => TextModel(
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
