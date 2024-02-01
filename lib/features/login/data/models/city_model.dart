class CityModel {
  int? id;
  String? name;
  String? slug;
  String? lat;
  String? lng;

  CityModel({this.id, this.name, this.slug, this.lat, this.lng});

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        lat: json['lat'] as String?,
        lng: json['lng'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'lat': lat,
        'lng': lng,
      };
}
