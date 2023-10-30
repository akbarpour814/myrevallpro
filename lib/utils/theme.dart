import 'package:flutter/material.dart';
import 'package:revallpro/gen/fonts.gen.dart';

ThemeData myTheme() {
  return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff217ed9)),
      useMaterial3: true,
      fontFamily: FontFamily.sfProRegular,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              textStyle: MaterialStateProperty.all(
                  const TextStyle(color: Colors.white)),
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xff217ed9)),
              minimumSize:
                  MaterialStateProperty.all(const Size(double.infinity, 40)))),
      inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          errorStyle: TextStyle(fontSize: 11),
          contentPadding: const EdgeInsets.fromLTRB(12, 11, 12, 11),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xffE4E4E4),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff217ed9),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5),
          )),
      textTheme: const TextTheme(
        labelSmall: TextStyle(
            letterSpacing: 0,
            wordSpacing: 0,
            fontFamily: FontFamily.sfProLight,
            color: Color(0xff999999)),
        labelMedium: TextStyle(
            fontSize: 16,
            letterSpacing: 0,
            wordSpacing: 0,
            fontFamily: FontFamily.sfProRegular,
            color: Color(0xff151522)),
        labelLarge: TextStyle(
            fontSize: 28,
            letterSpacing: 0,
            wordSpacing: 0,
            fontFamily: FontFamily.sfProRegular,
            color: Color(0xff151522)),
        bodyLarge: TextStyle(
          letterSpacing: 0,
          wordSpacing: 0,
        ),
        bodyMedium: TextStyle(
          letterSpacing: 0,
          wordSpacing: 0,
        ),
        bodySmall: TextStyle(
          letterSpacing: 0,
          wordSpacing: 0,
        ),
        displayLarge: TextStyle(
          letterSpacing: 0,
          wordSpacing: 0,
        ),
        displayMedium: TextStyle(
          letterSpacing: 0,
          wordSpacing: 0,
        ),
        displaySmall: TextStyle(
          letterSpacing: 0,
          wordSpacing: 0,
        ),
        headlineMedium: TextStyle(
          letterSpacing: 0,
          wordSpacing: 0,
        ),
        titleLarge: TextStyle(
          letterSpacing: 0,
          wordSpacing: 0,
        ),
        titleMedium: TextStyle(
          letterSpacing: 0,
          wordSpacing: 0,
        ),
        titleSmall: TextStyle(
          letterSpacing: 0,
          wordSpacing: 0,
        ),
      ));
}
