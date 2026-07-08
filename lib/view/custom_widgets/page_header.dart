import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

/// Reusable page top-bar
class PageHeader extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBack;
  const PageHeader(
      {super.key, required this.title, this.actions, this.showBack = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 16, 0),
      child: Row(children: [
        if (showBack)
          GestureDetector(
            onTap: () => Navigator.maybePop(context),
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.kWhite.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.kBorder),
              ),
              child: const Icon(Icons.arrow_back_ios_new_rounded,
                  size: 16, color: AppColors.kAccent),
            ),
          ),
        if (showBack) const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: AppColors.kTextDark,
            letterSpacing: -0.5,
          ),
        ),
        const Spacer(),
        ...?actions,
      ]),
    );
  }
}

/// Accent icon button
// Widget _iconBtn(IconData icon, {VoidCallback? onTap, int badge = 0}) {
//   return GestureDetector(
//     onTap: onTap,
//     child: Stack(
//       clipBehavior: Clip.none,
//       children: [
//         Container(
//           width: 40,
//           height: 40,
//           decoration: BoxDecoration(
//             color: AppColors.kWhite.withOpacity(0.8),
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(color: AppColors.kBorder),
//           ),
//           child: Icon(icon, color: AppColors.kAccent, size: 20),
//         ),
//         if (badge > 0)
//           Positioned(
//             top: -4,
//             right: -4,
//             child: Container(
//               padding: const EdgeInsets.all(4),
//               decoration: const BoxDecoration(
//                   color: AppColors.kAccent, shape: BoxShape.circle),
//               child: Text('$badge',
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 9,
//                       fontWeight: FontWeight.w800)),
//             ),
//           ),
//       ],
//     ),
//   );
// }
