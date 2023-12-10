import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit? boxFit;
  final String imageUrl;
  final double borderRadius;

  const CachedImage({
    required this.imageUrl,
    super.key,
    this.width,
    this.height,
    this.borderRadius = 0,
    this.boxFit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        fit: boxFit,
        width: width,
        height: height,
        imageUrl: imageUrl,
      ),
    );
  }
}
