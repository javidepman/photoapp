
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photoapp/core/domain/models/home_model.dart';
import 'package:photoapp/design_system/design/app_pa_color.dart';
import 'package:photoapp/design_system/design/app_pa_text.dart';
import 'package:photoapp/design_system/widgets/app_pa_carousel.dart';
import 'package:transparent_image/transparent_image.dart';

class AppPAHomeCard extends StatefulWidget {
  final List<HomeModel> homeModel;
  const AppPAHomeCard(
      {Key? key,
      required this.homeModel})
      : super(key: key);

  @override
  State<AppPAHomeCard> createState() => _AppPAHomeCardState();
}

class _AppPAHomeCardState extends State<AppPAHomeCard> {

  @override
  Widget build(BuildContext context) {

    return StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
        itemCount: widget.homeModel.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AppPACarousel(
                    homeModel: widget.homeModel, index: index,
                  )
                ),
              );
            },
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(
                          Radius.circular(15))
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(15)),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: widget.homeModel[index].urls!.thumb!,fit: BoxFit.cover,),
                  ),
                ),
                Positioned(
                  top: 160,
                  child: Container(
                    height: 64,
                    width: 150,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppPAColor.primaryLightGray.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                Positioned(
                  top: 160,
                  left: 10,
                  child: AppPAText.title20b(
                    widget.homeModel[index].description!.length >= 20 ?
                    widget.homeModel[index].description!.substring(0,20) :
                    widget.homeModel[index].description!,
                    color: AppPAColor.primaryWhite,
                  ),
                ),
                Positioned(
                  top: 180,
                  left: 10,
                  child: AppPAText.subTitle16b('${widget.homeModel[index].likes} Likes',
                    color: AppPAColor.primaryDarkGray,
                  ),
                )
              ],
            ),
          );
        },
        staggeredTileBuilder: (index) {
          return StaggeredTile.count(1, index.isEven ? 1.2 : 1.2);
        }
    );
  }

  Future<String> getUrl(String url) async {
    return url;
  }

}
