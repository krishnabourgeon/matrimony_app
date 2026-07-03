import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:flutter/material.dart';

/// Labelled field wrapper
class FieldWrap extends StatelessWidget {
  final String label;
  final bool required;
  final Widget child;
  const FieldWrap(this.label,
      {super.key, this.required = false, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      RichText(
        text: TextSpan(
          text: label,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.kSlate,
              fontFamily: 'Georgia'),
          children: required
              ? const [
                  TextSpan(
                      text: ' *',
                      style: TextStyle(color: AppColors.kAccent))
                ]
              : [],
        ),
      ),
      const SizedBox(height: 6),
      child,
    ]);
  }
}