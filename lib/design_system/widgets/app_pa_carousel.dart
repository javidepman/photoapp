import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photoapp/core/domain/models/home_model.dart';
import 'package:photoapp/design_system/design/app_pa_color.dart';
import 'package:photoapp/design_system/widgets/app_pa_image_dialog.dart';
import 'package:photoapp/design_system/widgets/custom_image.dart';
import 'package:photoapp/design_system/widgets/icons/close_icon.dart';

class AppPACarousel extends StatefulWidget {
  final List<HomeModel> homeModel;
  final int? index;
  const AppPACarousel(
      {Key? key,
        required this.homeModel,
        this.index})
      : super(key: key);

  @override
  State<AppPACarousel> createState() => _AppPACarouselState();
}

class _AppPACarouselState extends State<AppPACarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
    _current = widget.index!;
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> imageSliders = widget.homeModel
        .map(
          (item) => FutureBuilder<String>(
        future: getUrl(item.urls!.thumb!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final url = snapshot.data!;
            final image = Image.network(url, height: 0, width: 420, fit: BoxFit.cover,);
            return InkWell(
              onTap: () => ImageDialog.show(
                context,
                description: item.description,
                likes: item.likes!,
                child: image,
                name: '${item.user!.firstName!} ${item.user!.lastName!}',
                profileUrl: item.user!.profileImage!.small!,
                bio: item.user!.bio!,
                homeModel: widget.homeModel
              ),
              child: image,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    )
        .toList();

    return Card(
      color: AppPAColor.primaryWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 22.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            Container(
              height: 720.0,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: const CloseIcon(),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: CarouselSlider(
                      items: imageSliders,
                      carouselController: _controller,
                      options: CarouselOptions(
                          autoPlay: false,
                          enlargeCenterPage: true,
                          reverse: false,
                          enableInfiniteScroll: false,
                          viewportFraction: 1,
                          height: 400.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              //_current = index;
                            });
                          }),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    imageSliders.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () =>
                            _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppPAColor.primaryWhite
                                  .withOpacity(_current == entry.key
                                  ? 0.9
                                  : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Future<String> getUrl(String url) async {
    return url;
  }

}
