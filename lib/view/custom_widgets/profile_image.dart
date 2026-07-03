import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Widget errorWidget;

  const ProfileImage(
    this.image, {
    super.key,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    required this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (image.startsWith('http')) {
      return Image.network(
        image,
        fit: fit,
        width: width,
        height: height,
        errorBuilder: (_, __, ___) => errorWidget,
      );
    } else {
      return Image.asset(
        image,
        fit: fit,
        width: width,
        height: height,
        errorBuilder: (_, __, ___) => errorWidget,
      );
    }
  }
}
