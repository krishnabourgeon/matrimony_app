import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

/// Primary CTA button
class CTAButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool outlined;
  const CTAButton(
      {super.key, required this.label,
      required this.onTap,
      this.outlined = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: outlined ? AppColors.kWhite : AppColors.kAccent,
          borderRadius: BorderRadius.circular(14),
          border: outlined ? Border.all(color: AppColors.kAccent, width: 1.5) : null,
          boxShadow: outlined
              ? []
              : [
                  BoxShadow(
                    color: AppColors.kAccent.withOpacity(0.35),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  )
                ],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.4,
            color: outlined ? AppColors.kAccent : AppColors.kWhite,
          ),
        ),
      ),
    );
  }
}