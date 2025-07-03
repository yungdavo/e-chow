import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;

  const AppCachedImage({
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) =>
      placeholder ?? Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
      errorWidget ?? Icon(Icons.broken_image),
    );
  }
}