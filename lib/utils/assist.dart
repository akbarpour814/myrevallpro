import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'const.dart';
import 'masked_text_input_formater.dart';

bool isEmail(String email) {
  return RegExp(
          '''^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$''')
      .hasMatch(email);
}

BoxShadow myShadow({Color? shadowColor, Offset? offset}) {
  return BoxShadow(
      color: shadowColor ?? Colors.grey.withOpacity(0.3),
      offset: offset ?? const Offset(0.0, 0.1),
      blurRadius: 5);
}

List<TextInputFormatter>? typeInputFormatters(TextTypeEnum type) {
  if (type == TextTypeEnum.loginCode) {
    return [
      LengthLimitingTextInputFormatter(5),
      FilteringTextInputFormatter.digitsOnly,
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]|-')),
    ];
  }
  if (type == TextTypeEnum.mobile || type == TextTypeEnum.phone) {
    return [
      LengthLimitingTextInputFormatter(11),
      FilteringTextInputFormatter.digitsOnly,
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]|-')),
    ];
  }
  if (type == TextTypeEnum.companyId) {
    return [
      LengthLimitingTextInputFormatter(11),
      FilteringTextInputFormatter.digitsOnly,
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]|-')),
    ];
  }
  if (type == TextTypeEnum.nationalCode || type == TextTypeEnum.postalCode) {
    return [
      LengthLimitingTextInputFormatter(10),
      FilteringTextInputFormatter.digitsOnly,
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]|-')),
    ];
  }
  if (type == TextTypeEnum.digit) {
    return [
      FilteringTextInputFormatter.digitsOnly,
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]|-')),
    ];
  }
  if (type == TextTypeEnum.string) {
    return [
      LengthLimitingTextInputFormatter(50),
    ];
  }
  if (type == TextTypeEnum.longString) {
    return [LengthLimitingTextInputFormatter(4000)];
  }
  if (type == TextTypeEnum.card) {
    return [
      MaskedTextInputFormatter(
        mask: 'xxxx-xxxx-xxxx-xxxx',
        separator: '-',
      ),
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]|-')),
      LengthLimitingTextInputFormatter(19)
    ];
  }
  if (type == TextTypeEnum.iban) {
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
  if (type == TextTypeEnum.cvv2) {
    return [
      FilteringTextInputFormatter.digitsOnly,
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]|-')),
      LengthLimitingTextInputFormatter(4)
    ];
  }
  if (type == TextTypeEnum.nationalCodeSerial) {
    return [LengthLimitingTextInputFormatter(10)];
  }

  if (type == TextTypeEnum.money) {
    return [
      FilteringTextInputFormatter.digitsOnly,
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]|,')),
      TextInputFormatter.withFunction((oldValue, newValue) {
        if (newValue.text.isEmpty ||
            double.parse(newValue.text.replaceAll(',', '')) <=
                BigInt.parse('999999999999999999').toDouble()) {
          return newValue;
        } else {
          return oldValue;
        }
      })
    ];
  }
  return [];
}

TextInputType? textInputType(TextTypeEnum type) {
  if (type == TextTypeEnum.loginCode ||
      type == TextTypeEnum.card ||
      type == TextTypeEnum.cvv2 ||
      type == TextTypeEnum.digit ||
      type == TextTypeEnum.mobile) return TextInputType.number;
  if (type == TextTypeEnum.string || type == TextTypeEnum.iban) {
    return TextInputType.text;
  }
  if (type == TextTypeEnum.email) return TextInputType.emailAddress;
  if (type == TextTypeEnum.date) return TextInputType.datetime;
  if (type == TextTypeEnum.postalCode ||
      type == TextTypeEnum.nationalCode ||
      type == TextTypeEnum.money ||
      type == TextTypeEnum.companyId ||
      type == TextTypeEnum.phone) return TextInputType.phone;

  return TextInputType.text;
}


bool isPersian(String text) {
  return text.isEmpty ||
      RegExp(r'^[ \u0618\u0619\u061A\u0621\u0623\u0624\u0622\u0626\u0627\u0628\u067E\u062A-\u062F\u0686\u0630-\u0639\u0641\u0642\u0644-\u0648\u064E\u064F\u0650\u0651\u0698\u063A\u06A9\u06AF\u06CC]+$')
          .hasMatch(text);
}