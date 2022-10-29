import 'dart:ui';

import 'package:flutter/material.dart';

class AppPAText {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  static Text _title(
    String str,
    double size,
    FontWeight weight,
    double letterSpacing,
    double lineHeight,
    Color? color, {
    Key? key,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
  }) {
    return Text(
      str,
      key: key,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        letterSpacing: letterSpacing,
        height: lineHeight / size,
        color: color,
        decoration: decoration,
        fontFeatures: const [FontFeature.proportionalFigures()],
      ),
    );
  }

  static Text title28b(String str, {Color? color}) =>
      _title(str, 28, semiBold, 0, 28, color);

  static Text title40b(String str, {Color? color}) =>
      _title(str, 40, bold, 0, 40, color);

  static Text title28sb(String str, {Color? color}) =>
      _title(str, 28, regular, 0, 28, color);

  static Text title24b(String str, {Color? color}) =>
      _title(str, 24, regular, 0, 20, color);

  static Text title20b(String str, {Color? color}) =>
      _title(str, 20, bold, 0, 20, color);

  static Text title20r(String str, {Color? color}) =>
      _title(str, 20, regular, 0, 20, color);

  static Text subTitle16b(String str, {Color? color, TextAlign? textAlign}) =>
      _title(str, 16, bold, 0, 20, color, textAlign: textAlign);

  static Text subTitle16sb(String str, {Color? color, TextAlign? textAlign}) =>
      _title(str, 16, semiBold, 0, 20, color, textAlign: textAlign);

  static Text subTitle16card(String str,
          {Color? color, TextAlign? textAlign}) =>
      _title(str, 16, regular, 0, 20, color, textAlign: textAlign);

  static Text subTitle14b(String str, {Color? color, TextAlign? textAlign}) =>
      _title(str, 14, bold, 0, 17, color, textAlign: textAlign);

  static Text subTitle14sb(String str, {Color? color, TextAlign? textAlign}) =>
      _title(str, 14, semiBold, 0, 17, color, textAlign: textAlign);

  static Text subTitle14r(String str, {Color? color, TextAlign? textAlign}) =>
      _title(str, 14, regular, 0, 17, color, textAlign: textAlign);

  static Text subTitle12sb(String str, {Color? color, TextAlign? textAlign}) =>
      _title(str, 12, semiBold, 0, 14.6, color, textAlign: textAlign);

  static Text subTitle12r(String str, {Color? color, TextAlign? textAlign}) =>
      _title(str, 12, regular, 0, 14.6, color, textAlign: textAlign);

  static Text subTitle10sb(String str, {Color? color}) =>
      _title(str, 10, semiBold, 0, 10, color);

  static Text body14r(String str, {Color? color, TextAlign? textAlign}) =>
      _title(str, 14, regular, 0, 14, color, textAlign: textAlign);

  static Text body12r(String str, {Color? color, TextAlign? textAlign}) =>
      _title(str, 12, regular, 0, 20, color, textAlign: textAlign);

  static Text caption12r(String str, {Color? color, TextAlign? textAlign}) =>
      _title(str, 12, regular, 0, 16, color, textAlign: textAlign);

  static Text caption10r(String str, {Color? color, TextAlign? textAlign}) =>
      _title(str, 10, regular, 0, 16, color, textAlign: textAlign);

  static Text caption8r(String str, {Color? color, TextAlign? textAlign}) =>
      _title(str, 8, regular, 0, 16, color, textAlign: textAlign);

  static Text termsTitle14b(String str, {Color? color}) =>
      _title(str, 14, bold, 0, 14, color,
          textAlign: TextAlign.center, decoration: TextDecoration.underline);

  static Text termsSubtitle12b(String str, {Color? color}) =>
      _title(str, 12, bold, 0, 12, color, decoration: TextDecoration.underline);

  static Text termsBody12r(String str, {Color? color}) =>
      _title(str, 12, regular, 0, 12, color, textAlign: TextAlign.justify);

  static Text termsBody12b(String str, {Color? color}) =>
      _title(str, 12, bold, 0, 12, color);
}
