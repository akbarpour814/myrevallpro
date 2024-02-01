class DiscountModel {
  int? id;
  String? title;
  String? description;
  String? image;
  int? offerPercent;
  String? created;

  DiscountModel({
    this.id,
    this.title,
    this.description,
    this.image,
    this.offerPercent,
    this.created,
  });

  factory DiscountModel.fromJson(Map<String, dynamic> json) => DiscountModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        image: json['image'] as String?,
        offerPercent: json['offer_percent'] as int?,
        created: json['created'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
        'offer_percent': offerPercent,
        'created': created,
      };
}
