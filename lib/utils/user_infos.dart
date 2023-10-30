import 'const.dart';

class UserInfos {
  static Future<void> clear() async {
    await storage.deleteAll();
  }

  static Future<void> setToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

  static Future<void> setRefreshToken(String refreshToken) async {
    await storage.write(key: 'refreshToken', value: refreshToken);
  }

  static Future<String?> getRefreshToken() async {
    return await storage.read(key: 'refreshToken');
  }

  static Future<void> setRefreshTokenExpireTime(
      String refreshTokenExpireTime) async {
    await storage.write(
        key: 'refreshTokenExpireTime', value: refreshTokenExpireTime);
  }

  static Future<String?> getRefreshTokenExpireTime() async {
    return await storage.read(key: 'refreshTokenExpireTime');
  }

  static Future<void> setMobile(String mobile) async {
    await storage.write(key: 'mobile', value: mobile);
  }

  static Future<String?> getMobile() async {
    return await storage.read(key: 'mobile');
  }

  static Future<void> setId(String Id) async {
    await storage.write(key: 'Id', value: Id);
  }

  static Future<String?> getId() async {
    return await storage.read(key: 'Id');
  }

  static Future<void> setEmail(String Id) async {
    await storage.write(key: 'email', value: Id);
  }

  static Future<String?> getEmail() async {
    return await storage.read(key: 'email');
  }

  static Future<void> setRandomNotificationCount(int cont) async {
    await storage.write(key: 'RandomNotificationCount', value: cont.toString());
  }

  static Future<int> getRandomNotificationCount() async {
    return int.parse(
        (await storage.read(key: 'RandomNotificationCount')) ?? '0');
  }

  static Future<void> setIsRepeatNotification(bool status) async {
    await storage.write(key: 'RepeatNotification', value: status.toString());
  }

  static Future<bool> isRepeatNotification() async {
    return ((await storage.read(key: 'RepeatNotification')) ?? 'false') ==
        'true';
  }

  static Future<void> setIsRandomNotification(bool status) async {
    await storage.write(key: 'RandomNotification', value: status.toString());
  }

  static Future<bool> isRandomNotification() async {
    return ((await storage.read(key: 'RandomNotification')) ?? 'false') ==
        'true';
  }

  //for unknown value
  static Future<void> setString(String name, String value) async {
    await storage.write(key: name, value: value);
  }

  static Future<void> setInt(String name, int value) async {
    await storage.write(key: name, value: value.toString());
  }

  static Future<void> setBool(String name, bool value) async {
    await storage.write(key: name, value: value.toString());
  }

  static Future<String?> read(String name) async {
    return await storage.read(key: name);
  }

  static Future<int?> getInt(String name) async {
    return int.tryParse((await storage.read(key: name)) ?? '0');
  }

  static Future<bool?> getbool(String name) async {
    return ((await storage.read(key: name)) ?? 'false') == 'true';
  }

  static Future<String?> getString(String name) async {
    return await storage.read(key: name);
  }
}
