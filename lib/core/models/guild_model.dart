class GuildModel {
  int? id;
  String? name;
  String? slug;
  String? icon;
  String? bgColor;

  GuildModel({this.id, this.name, this.slug, this.icon, this.bgColor});

  factory GuildModel.fromJson(Map<String, dynamic> json) => GuildModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        icon: json['icon'] as String?,
        bgColor: json['bg_color'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'icon': icon,
        'bg_color': bgColor,
      };
}
