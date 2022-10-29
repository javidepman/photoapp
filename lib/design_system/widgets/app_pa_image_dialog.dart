import 'package:photoapp/core/domain/models/home_model.dart';
import 'package:photoapp/design_system/design/app_pa_color.dart';
import 'package:photoapp/design_system/design/app_pa_text.dart';
import 'package:photoapp/design_system/misc//helpers.dart';
import 'package:photoapp/design_system/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:photoapp/design_system/widgets/icons/close_icon.dart';
import 'package:photoapp/features/home/presentation/widgets/profile_widget.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class ImageDialog extends StatelessWidget {
  final Widget child;
  final String? description;
  final int? likes;
  final String? name;
  final String? profileUrl;
  final String? bio;
  final List<HomeModel>? homeModel;

  const ImageDialog({
    Key? key,
    required this.child,
    this.description,
    this.likes,
    this.name,
    this.profileUrl,
    this.bio,
    this.homeModel
  }) : super(key: key);

  static void show(
    BuildContext context, {
    required Widget child,
    String? description,
    int? likes,
    String? name,
    String? profileUrl,
    String? bio,
    List<HomeModel>? homeModel,
  }) {
    showDialog(
      context: context,
      builder: (context) => ImageDialog(
        child: child,
        description: description,
        likes: likes,
        name: name,
        profileUrl: profileUrl,
        bio: bio,
        homeModel: homeModel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.of(context).pop();
      }),
      child: Container(
          height: 380,
          width: 720,
          alignment: FractionalOffset.center,
          color: AppPAColor.primaryBlack,
          child: Stack(
            children: [
              PinchZoom(
                child: child,
              ),
              Positioned(
                top: 30,
                left: 20,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const CloseIcon(),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  height: 180.0,
                  color: AppPAColor.primaryDarkGray.withOpacity(0.3),
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8.0),
                      AppPAText.title28b(
                        description!.length >= 40 ? description!.substring(0,40) : description!,
                        color: AppPAColor.primaryWhite,
                      ),
                      const SizedBox(height: 8.0),
                      AppPAText.body14r(
                        '${likes} Likes',
                        color: AppPAColor.primaryWhite.withOpacity(0.8),
                      ),
                      const SizedBox(height: 16.0),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileWidget(
                              name: name,
                              profileUrl: profileUrl,
                              bio: bio,
                              homeModel: homeModel,
                            ),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppPAColor.primaryDarkGray,
                                  radius: 20.0,
                                  child: Image.network(profileUrl!,
                                    height: 25.0,
                                    width: 25.0,
                                  ), //Text
                                )
                              ],
                            ),
                            const SizedBox(width: 16.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppPAText.subTitle16sb(
                                  name!.length >= 30 ? name!.substring(0,30) : name!,
                                  //name!.substring(0,10),
                                  color: AppPAColor.primaryWhite,
                                ),
                                const SizedBox(height: 4.0),
                                AppPAText.body14r(
                                  'View profile',
                                  color: AppPAColor.primaryWhite,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
      ),
    );
  }
}
