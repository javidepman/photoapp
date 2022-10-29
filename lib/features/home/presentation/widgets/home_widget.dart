import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photoapp/commons/helpers/providers/app_pa_providers.dart';
import 'package:photoapp/commons/helpers/providers/home_notifier.dart';
import 'package:photoapp/design_system/design/app_pa_color.dart';
import 'package:photoapp/design_system/design/app_pa_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:photoapp/design_system/widgets/app_pa_home_card.dart';

import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeWidget extends ConsumerStatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends ConsumerState<HomeWidget> {

  @override
  void initState() {
    super.initState();
    _getHome();
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(appBPNotifierProviderHome);

    return (homeState is AppBPHomeLoaded)
        ? SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppPAText.title28b(
                    'Discover',
                    color: AppPAColor.primaryBlack,
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                  height: 780,
                  width: 360,
                  child: AppPAHomeCard(
                    homeModel: homeState.homeModel,
                  )
              ),
            ],
          ),
        ),

      ),
    ): const Center(
      child: CircularProgressIndicator(),
    );
  }

  Future<void> _getHome() async {
    await ref.read(appBPNotifierProviderHome.notifier).getHome();
  }
}