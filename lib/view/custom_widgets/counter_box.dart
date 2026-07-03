
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:flutter/material.dart';

/// Small counter display box (used in FamilyDetailsScreen)
class CounterBox extends StatelessWidget {
  final int value;
  const CounterBox(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.kCardBg,
        border: Border.symmetric(
            horizontal: const BorderSide(color: AppColors.kBorder)),
      ),
      child: Text(
        '$value',
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.kDarkSlate),
      ),
    );
  }
}
