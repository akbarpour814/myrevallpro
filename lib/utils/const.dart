import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum TextTypeEnum {
  string,
  longString,
  digit,
  password,
  loginCode,
  email,
  mobile,
  postalCode,
  phone,
  date,
  iban,
  nationalCode,
  card,
  cvv2,
  nationalCodeSerial,
  money,
  companyId,
}

const storage = FlutterSecureStorage(
  aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ),
);

const TagsDbTable = 'Tags';
const TextsDbTable = 'Texts';
const TextTagDbTable = 'TextTag';
