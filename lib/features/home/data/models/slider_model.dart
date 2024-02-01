class SliderModel {
  final String? image;
  final String? link;

  SliderModel({this.image, this.link});

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      image: json['img'] as String?,
      link: json['link'] as String?,
    );
  }
}
