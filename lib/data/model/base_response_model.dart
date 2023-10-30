class BaseResponseModel {
  bool? isSuccess;
  String? message;
  dynamic data;

  BaseResponseModel({this.data, this.isSuccess, this.message});
}
