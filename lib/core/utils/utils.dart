import 'package:customer_club/core/utils/const.dart';
import 'package:customer_club/core/utils/masked_text_input_formater.dart';
import 'package:flutter/services.dart';

List<TextInputFormatter>? typeInputFormatters(TypeEnum type) {
  if (type == TypeEnum.loginCode) {
    return [
      LengthLimitingTextInputFormatter(5),
      FilteringTextInputFormatter.digitsOnly,
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]|-')),
    ];
  }
  if (type == TypeEnum.mobile || type == TypeEnum.phone) {
    return [
      LengthLimitingTextInputFormatter(11),
      FilteringTextInputFormatter.digitsOnly,
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]|-')),
    ];
  }
  if (type == TypeEnum.nationalCode || type == TypeEnum.postalCode) {
    return [
      LengthLimitingTextInputFormatter(10),
      FilteringTextInputFormatter.digitsOnly,
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]|-')),
    ];
  }
  if (type == TypeEnum.digit) {
    return [
      FilteringTextInputFormatter.digitsOnly,
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]|-')),
    ];
  }
  if (type == TypeEnum.string) {
    return [
      LengthLimitingTextInputFormatter(50),
      // TextInputFormatter.withFunction((oldValue, newValue) {
      //   return isPersian(newValue.text) ? newValue : oldValue;
      // })
    ];
  }
  if (type == TypeEnum.longString) {
    return [LengthLimitingTextInputFormatter(4000)];
  }
  if (type == TypeEnum.card) {
    return [
      MaskedTextInputFormatter(
        mask: 'xxxx-xxxx-xxxx-xxxx',
        separator: '-',
      ),
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]|-')),
      LengthLimitingTextInputFormatter(19)
    ];
  }
  if (type == TypeEnum.iban) {
    return [
      MaskedTextInputFormatter(
        mask: 'xxxxxxxxxxxxxxxxxxxxxxxx',
        separator: '',
      ),
      FilteringTextInputFormatter.digitsOnly,
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      LengthLimitingTextInputFormatter(24)
    ];
  }
  if (type == TypeEnum.cvv2) {
    return [
      FilteringTextInputFormatter.digitsOnly,
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]|-')),
      LengthLimitingTextInputFormatter(4)
    ];
  }
  if (type == TypeEnum.nationalCodeSerial) {
    return [LengthLimitingTextInputFormatter(10)];
  }
  if (type == TypeEnum.money) {
    return [
      FilteringTextInputFormatter.digitsOnly,
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]|,')),
      TextInputFormatter.withFunction((oldValue, newValue) {
        if (newValue.text.isEmpty ||
            double.parse(newValue.text.replaceAll(',', '')) <=
                999999999999999999) {
          return newValue;
        } else {
          return oldValue;
        }
      })
    ];
  }
  return [];
}

TextInputType? textInputType(TypeEnum type) {
  if (type == TypeEnum.loginCode ||
      type == TypeEnum.digit ||
      type == TypeEnum.mobile) return TextInputType.number;
  if (type == TypeEnum.string || type == TypeEnum.iban) {
    return TextInputType.text;
  }
  if (type == TypeEnum.email) return TextInputType.emailAddress;
  if (type == TypeEnum.date) return TextInputType.datetime;
  if (type == TypeEnum.postalCode ||
      type == TypeEnum.nationalCode ||
      type == TypeEnum.money ||
      type == TypeEnum.card ||
      type == TypeEnum.cvv2 ||
      type == TypeEnum.phone) return TextInputType.phone;

  return TextInputType.text;
}
