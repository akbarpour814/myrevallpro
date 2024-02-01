class CommentModel {
  int? id;
  String? username;
  String? userFamily;
  String? userImg;
  String? comment;
  int? rating;
  String? created;

  CommentModel({
    this.id,
    this.username,
    this.userFamily,
    this.userImg,
    this.comment,
    this.rating,
    this.created,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json['id'] as int?,
        username: json['username'] as String?,
        userFamily: json['user_family'] as String?,
        userImg: json['user_img'] as String?,
        comment: json['comment'] as String?,
        rating: json['rating'] as int?,
        created: json['created'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'user_family': userFamily,
        'user_img': userImg,
        'comment': comment,
        'rating': rating,
        'created': created,
      };
}
