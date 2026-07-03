import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:flutter/material.dart';

/// Styled dropdown
class Drop extends StatefulWidget {
  final String hint;
  final List<String> items;
  const Drop({super.key, required this.hint, required this.items});

  @override
  State<Drop> createState() => DropState();
}

class DropState extends State<Drop> {
  String? _val;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.kCardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.kBorder),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _val,
          hint: Text(widget.hint,
              style: const TextStyle(color: AppColors.kTextMuted, fontSize: 13)),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.kAccent),
          style: const TextStyle(color: AppColors.kDarkSlate, fontSize: 13, fontFamily: 'Georgia'),
          dropdownColor: AppColors.kBgTop,
          items: widget.items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (v) => setState(() => _val = v),
        ),
      ),
    );
  }
}
