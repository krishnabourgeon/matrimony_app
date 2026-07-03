import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

/// Step progress indicator
class StepBar extends StatelessWidget {
  final int current; // 1-based
  final int total;
  const StepBar({super.key, required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(total, (i) {
        final done = i < current;
        final active = i == current - 1;
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(right: i < total - 1 ? 4 : 0),
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: done || active
                  ? AppColors.kAccent
                  : AppColors.kAccent.withOpacity(0.2),
            ),
          ),
        );
      }),
    );
  }
}