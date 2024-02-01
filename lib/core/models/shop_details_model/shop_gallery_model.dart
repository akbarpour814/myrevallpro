class ShopGalleryModel {
  String? name;
  String? image;

  ShopGalleryModel({this.name, this.image});

  factory ShopGalleryModel.fromJson(Map<String, dynamic> json) =>
      ShopGalleryModel(
        name: json['name'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
      };
}
