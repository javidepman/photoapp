import 'package:flutter/material.dart';
import 'package:photoapp/design_system/design/app_pa_assets.dart';
import 'package:photoapp/design_system/design/app_pa_color.dart';

class CloseIcon extends StatelessWidget {
  const CloseIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPAAsset.imageSvg('close_icon.svg',
        height: 34.0, width: 34.0, color: AppPAColor.primaryBlack);
  }
}
