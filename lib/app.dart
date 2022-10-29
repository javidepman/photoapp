import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photoapp/design_system/design/app_pa_color.dart';
import 'package:photoapp/design_system/misc/helpers.dart';
import 'package:photoapp/features/home/presentation/widgets/home_widget.dart';
class PhotoApp extends ConsumerWidget {
  const PhotoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Dosis',
        dividerColor: AppPAColor.primaryLightGray,
      ),
      home: const Scaffold(
        //body: AppPAResponsiveLayout(mobileBody: LoginWidget()),
        body: HomeWidget(),
      ),
    );
  }
}
