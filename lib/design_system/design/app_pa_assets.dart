import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppPAAsset {

  static Image image(String? name, {double? width, double? height}) =>
      Image.asset('assets/images/$name', width: width, height: height);
  static Image imageNetwork(String? name, {double? width, double? height}) =>
      Image.network('$name', width: width, height: height);
  static SvgPicture imageSvg(String? name,
          {double? width, double? height, Color? color}) =>
      SvgPicture.asset(
        'assets/images/$name',
        width: width,
        height: height,
        color: color,
      );
}
