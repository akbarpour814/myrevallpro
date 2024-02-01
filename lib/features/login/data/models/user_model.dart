import 'package:customer_club/core/utils/extentions.dart';

class UserModel {
  String? username;
  String? fname;
  String? lname;
  String? email;
  String? mobile;
  String? image;
  String? city;
  String? cityId;
  String? idcard;
  bool? qrscan;
  String? shopId;
  String? shopName;
  String? password;
  String? numNotify;
  String? expireDay;

  UserModel({
    this.username,
    this.fname,
    this.lname,
    this.email,
    this.mobile,
    this.image,
    this.city,
    this.cityId,
    this.idcard,
    this.qrscan,
    this.shopId,
    this.shopName,
    this.password,
    this.numNotify,
    this.expireDay,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      username: json['username'] as String?,
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      image: json['image'] as String?,
      city: json['city'] as String?,
      cityId: json['city_id'].toString(),
      idcard: json['idcard'].toString(),
      qrscan: json['qrscan'] as bool?,
      shopId: json['shop_id'].toString(),
      shopName: json['shop_name'] as String?,
      numNotify: json['num_notify'].toString(),
      expireDay: json['expire_day'].toString(),
      password: json['password'] as String?);

  Map<String, dynamic> toJson() => {
        // 'username': username,
        'fname': fname,
        'lname': lname,
        'email': email,
        // 'mobile': mobile,
        // 'image': image,
        // 'city': city,
        'city_id': cityId,
        // 'idcard': idcard,
        // 'qrscan': qrscan,
        // 'shop_id': shopId,
        // 'shop_name': shopName,
        if (password.isNotNullOrEmpty) 'password': password,
        // 'num_notify': numNotify,
        // 'expire_day': expireDay,
      };
}
