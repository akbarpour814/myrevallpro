import 'package:customer_club/core/models/app_config_model.dart';

AppConfigModel appConfig = AppConfigModel();

enum TypeEnum {
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
  money
}

//-------------------------------وضعیت برنامه ها---------------------------
const heldStatus = 'held';
const inactiveStatus = 'un_active';
const soldoutStatus = 'sold_out';
const performingStatus = 'performing';
const waitingStatus = 'waiting';
const extendedStatus = 'extended';

//-------------------------------وضعیت صندلی ها----------------------------
const chairSoldStatus = 'sold';
const chairAvailableStatus = 'available';
const chairSelectedStatus = 'selected';
const chairReserveStatus = 'reservation';
const chairBlocStatus = 'blocked';
const chairDeletedStatus = 'deleted';

//-------------------------------سطح کاربری----------------------------
const normalUserLevel = 'normal';
const bronzeUserLevel = 'bronze';
const silverUserLevel = 'silver';
const goldenUserLevel = 'golden';
