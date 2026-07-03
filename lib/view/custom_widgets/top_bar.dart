import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

class TopBar extends StatelessWidget {
  final String? title;
  final bool showBack;
  final VoidCallback? onBack;
  final Widget? trailing;
  const TopBar({super.key,this.title, this.showBack = true, this.onBack, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          if (showBack)
            GestureDetector(
              onTap: onBack ?? () => Navigator.maybePop(context),
              child: Container(
                width: 38, height: 38,
                decoration: BoxDecoration(
                  color: AppColors.kWhite.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.kBorder),
                ),
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    size: 16, color: AppColors.kAccent),
              ),
            ),
          if (showBack) const SizedBox(width: 12),
          // Brand logo
          Row(children: [
            Container(
              width: 30, height: 30,
              decoration: BoxDecoration(
                color: AppColors.kAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.favorite_rounded,
                  color: AppColors.kWhite, size: 16),
            ),
            const SizedBox(width: 8),
            const Text('VivahBharath',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kDarkSlate,
                )),
          ]),
          const Spacer(),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}