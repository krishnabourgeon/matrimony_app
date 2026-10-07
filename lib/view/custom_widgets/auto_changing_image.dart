import 'dart:async';

import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/gender_avatar.dart';

/// Cross-fades through [imageUrls] automatically (asset paths or network
/// URLs both work). If there's only one image (or none), it just renders
/// statically — no timer, no animation needed.
class AutoChangingImage extends StatefulWidget {
  final List<String> imageUrls;
  final Duration interval;
  final BoxFit fit;
  final double? width;
  final double? height;
  final double errorIconSize;

  /// Picks the boy/girl default avatar for missing images. Defaults to the
  /// opposite of the logged-in user.
  final String? gender;

  const AutoChangingImage({
    super.key,
    required this.imageUrls,
    this.interval = const Duration(seconds: 3),
    this.fit = BoxFit.cover,
    this.width = double.infinity,
    this.height = double.infinity,
    this.errorIconSize = 44,
    this.gender,
  });

  @override
  State<AutoChangingImage> createState() => _AutoChangingImageState();
}

class _AutoChangingImageState extends State<AutoChangingImage> {
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.imageUrls.length > 1) _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(widget.interval, (_) {
      if (!mounted) return;
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.imageUrls.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget _image(String path, Key key) {
    final errorFallback = genderAvatarFallback(
      key: key,
      gender: widget.gender ?? UserGender.matchGender,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      iconSize: widget.errorIconSize,
    );
    if (path.isEmpty) return errorFallback;
    if (path.startsWith('http')) {
      return Image.network(
        path,
        key: key,
        width: widget.width,
        height: widget.height,
        fit: widget.fit,
        errorBuilder: (_, __, ___) => errorFallback,
      );
    }
    return Image.asset(
      path,
      key: key,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      errorBuilder: (_, __, ___) => errorFallback,
    );
  }

  @override
  Widget build(BuildContext context) {
    final path = widget.imageUrls.isNotEmpty ? widget.imageUrls[_currentIndex] : '';
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 10),
      child: _image(path, ValueKey('$_currentIndex-$path')),
    );
  }
}
