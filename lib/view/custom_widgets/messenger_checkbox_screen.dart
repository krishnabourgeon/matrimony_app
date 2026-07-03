import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:flutter/material.dart';

/// Messenger checkbox tile
class MessengerCheck extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final bool value;
  final ValueChanged<bool> onChanged;

  const MessengerCheck({super.key, 
    required this.label,
    required this.icon,
    required this.color,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: value ? color.withOpacity(0.08) : AppColors.kCardBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: value ? color : AppColors.kBorder,
              width: value ? 1.5 : 1.0),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, color: value ? color : AppColors.kTextMuted, size: 18),
          const SizedBox(width: 8),
          Text(label,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight:
                      value ? FontWeight.w600 : FontWeight.w400,
                  color:
                      value ? color : AppColors.kTextMuted)),
          const SizedBox(width: 8),
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: value ? color : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                  color: value ? color : AppColors.kBorder),
            ),
            child: value
                ? const Icon(Icons.check, size: 12, color: Colors.white)
                : null,
          ),
        ]),
      ),
    );
  }
}