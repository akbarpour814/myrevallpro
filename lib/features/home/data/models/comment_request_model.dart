class CommentRequestModel {
  int? shopId;
  String? comment;
  int? rating;

  CommentRequestModel({this.shopId, this.comment, this.rating});

  factory CommentRequestModel.fromJson(Map<String, dynamic> json) {
    return CommentRequestModel(
      shopId: json['shop_id'] as int?,
      comment: json['comment'] as String?,
      rating: json['rating'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'shop_id': shopId,
        'comment': comment,
        'rating': rating,
      };
}
