import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

/// Section header with accent underline
class SectionHeader extends StatelessWidget {
  final String tag;
  final String title;
  final String subtitle;
  final bool centerAligned;
  const SectionHeader(
      {super.key,
      required this.tag,
      required this.title,
      required this.subtitle,
      this.centerAligned = false});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.kAccent.withOpacity(0.12),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.kAccent.withOpacity(0.3)),
        ),
        child: Text(tag,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              color: AppColors.kAccent,
            )),
      ),
      const SizedBox(height: 8),
      Text(title,
          style: const TextStyle(
            fontFamily: 'Georgia',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.kDarkSlate,
            height: 1.2,
          )),
      const SizedBox(height: 4),
      Text(subtitle,
          style: const TextStyle(
              fontSize: 12, color: AppColors.kTextMuted, height: 1.4)),
    ]);
  }
}
