import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

class Pill extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const Pill(
      {super.key, required this.label,
      required this.selected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? AppColors.kAccent : AppColors.kWhite,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: selected ? AppColors.kAccent : AppColors.kBorder, width: 1.4),
          boxShadow: selected
              ? [
                  BoxShadow(
                      color: AppColors.kAccent.withOpacity(0.25),
                      blurRadius: 8,
                      offset: const Offset(0, 3))
                ]
              : [],
        ),
        child: Text(label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: selected ? AppColors.kWhite : AppColors.kTextMuted,
            )),
      ),
    );
  }
}