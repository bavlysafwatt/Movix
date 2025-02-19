import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movix/constants/app_constants.dart';
import 'package:movix/constants/app_icons.dart';

class CachedImage extends StatelessWidget {
  const CachedImage(
      {super.key,
      this.imageUrl,
      this.imageHeight,
      this.imageWidth,
      this.boxFit});

  final String? imageUrl;
  final double? imageHeight;
  final double? imageWidth;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CachedNetworkImage(
      height: imageHeight ?? size.width * 0.3,
      width: imageWidth ?? size.width * 0.2,
      imageUrl: imageUrl ?? AppConstants.defaultImageUrl,
      fit: boxFit ?? BoxFit.cover,
      errorWidget: (context, url, error) => Icon(
        AppIcons.error,
        color: Colors.red,
      ),
    );
  }
}
