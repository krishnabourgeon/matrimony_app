// Counter button helper
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:flutter/material.dart';

class CountBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const CountBtn(this.label, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40, height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.kAccent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.kAccent.withOpacity(0.3)),
        ),
        child: Text(label,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.kAccent)),
      ),
    );
  }
}