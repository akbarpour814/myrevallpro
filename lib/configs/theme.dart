import 'package:customer_club/configs/color_palette.dart';
import 'package:customer_club/configs/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

ThemeData myTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: ColorPalette.primaryColor),
    useMaterial3: true,
    fontFamily: FontFamily.estedad,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.white),
            backgroundColor:
                MaterialStatePropertyAll(ColorPalette.primaryColor),
            fixedSize: MaterialStateProperty.all(const Size(300, 44)),
            maximumSize: MaterialStateProperty.all(const Size(300, 44)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
            textStyle: MaterialStateProperty.all(const TextStyle(
                fontSize: 12,
                fontFamily: FontFamily.estedad,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
            minimumSize: MaterialStateProperty.all(const Size(300, 44)))),
    inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        labelStyle: TextStyle(
            letterSpacing: 0,
            wordSpacing: 1,
            color: Colors.grey.shade400,
            fontFamily: FontFamily.estedad),
        hintStyle: TextStyle(
            letterSpacing: 0,
            wordSpacing: 1,
            fontSize: 14,
            fontFamily: FontFamily.estedad,
            color: Colors.grey.shade400),
        focusedBorder: _border(),
        border: _border(),
        enabledBorder: _border(),
        errorBorder: _border(),
        disabledBorder: _border(),
        focusedErrorBorder: _border(),
        errorStyle: const TextStyle(fontSize: 10, height: .5),
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10)),
  );
}

OutlineInputBorder _border() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Colors.grey.shade300,
      ));
}
