import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photoapp/commons/helpers/providers/app_pa_providers.dart';
import 'package:photoapp/commons/helpers/providers/home_notifier.dart';
import 'package:photoapp/core/domain/models/home_model.dart';
import 'package:photoapp/design_system/design/app_pa_color.dart';
import 'package:photoapp/design_system/design/app_pa_text.dart';
import 'package:photoapp/design_system/widgets/app_pa_home_card.dart';
import 'package:photoapp/design_system/widgets/icons/close_icon.dart';

class ProfileWidget extends ConsumerStatefulWidget {
  final String? name;
  final String? profileUrl;
  final String? bio;
  final List<HomeModel>? homeModel;
  const ProfileWidget({Key? key, this.name, this.profileUrl, this.bio, this.homeModel}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends ConsumerState<ProfileWidget> {

  @override
  Widget build(BuildContext context) {
   return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: const CloseIcon(),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: CircleAvatar(
                        backgroundColor: AppPAColor.primaryDarkGray,
                        radius: 20.0,
                        child: Image.network(widget.profileUrl!,
                          height: 25.0,
                          width: 25.0,
                        ), //Text
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Positioned(
                      top: 0,
                      left: 50,
                      child: AppPAText.title20b(
                        widget.name!,
                        color: AppPAColor.primaryBlack,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Column(
                      children: [
                        const SizedBox(height: 4.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          child: AppPAText.subTitle16sb(
                            widget.bio!.length >= 200 ? widget.bio!.substring(0,200) : widget.bio!,
                            color: AppPAColor.primaryLightGray,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppPAText.title40b(
                      'My Photos',
                      color: AppPAColor.primaryBlack,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SizedBox(
                    height: 580,
                    width: 360,
                    child: AppPAHomeCard(
                      homeModel: widget.homeModel!,
                    )
                ),
              )
            ],
          ),
        ),

      ),
    );
  }

}
