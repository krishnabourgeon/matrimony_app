import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/gender_avatar.dart';

class ProfileImage extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Widget errorWidget;

  /// Used to pick the boy/girl default avatar when [image] is missing or
  /// fails to load. Defaults to the opposite of the logged-in user; falls
  /// back to [errorWidget] when gender is unknown.
  final String? gender;

  const ProfileImage(
    this.image, {
    super.key,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    required this.errorWidget,
    this.gender,
  });

  @override
  Widget build(BuildContext context) {
    final g = gender ?? UserGender.matchGender;
    final Widget fallback = normGender(g) == null
        ? errorWidget
        : genderAvatarFallback(gender: g, width: width, height: height, fit: fit);

    if (image.isEmpty) return fallback;
    if (image.startsWith('http')) {
      return Image.network(
        image,
        fit: fit,
        width: width,
        height: height,
        errorBuilder: (_, __, ___) => fallback,
      );
    } else {
      return Image.asset(
        image,
        fit: fit,
        width: width,
        height: height,
        errorBuilder: (_, __, ___) => fallback,
      );
    }
  }
}
