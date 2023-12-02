import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit? boxFit;
  final String imageUrl;

  const CachedImage({
    required this.imageUrl,
    super.key,
    this.width,
    this.height,
    this.boxFit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: boxFit,
      width: width,
      height: height,
      imageUrl: imageUrl,
    );
  }
}
