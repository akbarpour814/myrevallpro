class CustomResponse {
  late bool success;
  late dynamic data;
  late String message;

  CustomResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? false;
    data = json['data'];
    message = json['message'] ?? '';
  }
}
