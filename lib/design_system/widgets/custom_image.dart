
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    required this.image,
    this.height,
    this.width,
  }) : super(key: key);
  final ImageProvider image;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: image,
      height: height,
      width: width,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
    );
  }

  factory CustomImage.network(
    String url, {
    double? height,
    double? width,
  }) {
    return CustomImage(
      image: NetworkImage(url),
      height: height,
      width: width,
    );
  }
}
