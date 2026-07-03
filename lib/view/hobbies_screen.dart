// ════════════════════════════════════════════════════════════════
//  STEP 7 — HOBBIES & INTERESTS
// ════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
import 'package:matrimony_app/view/custom_widgets/progress_indicator.dart';
import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
import 'package:matrimony_app/view/custom_widgets/section_header.dart';
import 'package:matrimony_app/view/custom_widgets/top_bar.dart';
import 'package:matrimony_app/view/horoscope_details.dart';

class HobbiesScreen extends StatefulWidget {
  const HobbiesScreen({super.key});

  @override
  State<HobbiesScreen> createState() => _HobbiesState();
}

class _HobbiesState extends State<HobbiesScreen> {
  final Set<String> _selected = {};

  final _hobbies = [
    'Writing',    'Reading',       'Badminton',  'Cricket',
    'Football',   'Tennis',        'Chess',      'Kabadi',
    'Caroms',     'Billiards',     'Swimming',   'Travelling',
    'Trucking',   'Cinema',        'Watching TV','Gaming',
    'Cooking',    'Photography',   'Painting',   'Yoga',
    'Music',      'Dancing',       'Gardening',  'Cycling',
  ];

  @override
  Widget build(BuildContext context) {
    return BlushScaffold(
      child: Column(
        children: [
          TopBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: StepBar(current: 7, total: 8),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionHeader(
                    tag: 'STEP 7 OF 8',
                    title: 'Hobbies & Interests',
                    subtitle:
                        'Select all that apply — helps find like-minded matches',
                  ),
                  const SizedBox(height: 20),
                  FloatingCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // selection count
                        Row(children: [
                          const Text('Hobbies & Interests',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.kDarkSlate)),
                          const Spacer(),
                          if (_selected.isNotEmpty)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.kAccent.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text('${_selected.length} selected',
                                  style: const TextStyle(
                                      fontSize: 11,
                                      color: AppColors.kAccent,
                                      fontWeight: FontWeight.w600)),
                            ),
                        ]),
                        const SizedBox(height: 14),

                        Wrap(
                          spacing: 8,
                          runSpacing: 10,
                          children: _hobbies.map((h) {
                            final sel = _selected.contains(h);
                            return GestureDetector(
                              onTap: () => setState(() =>
                                  sel ? _selected.remove(h) : _selected.add(h)),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 180),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 9),
                                decoration: BoxDecoration(
                                  color: sel
                                      ? AppColors.kDarkSlate
                                      : AppColors.kCardBg,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: sel
                                        ? AppColors.kDarkSlate
                                        : AppColors.kBorder,
                                    width: 1.3,
                                  ),
                                  boxShadow: sel
                                      ? [
                                          BoxShadow(
                                              color: AppColors.kDarkSlate
                                                  .withOpacity(0.2),
                                              blurRadius: 6,
                                              offset: const Offset(0, 2))
                                        ]
                                      : [],
                                ),
                                child: Text(h,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: sel
                                            ? FontWeight.w600
                                            : FontWeight.w400,
                                        color: sel
                                            ? Colors.white
                                            : AppColors.kTextMuted)),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 24),

                        // ── Buttons ──
                        Row(children: [
                          Expanded(
                            child: CTAButton(
                              label: 'Skip this section',
                              outlined: true,
                              onTap: () => Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const HoroscopeScreen())),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CTAButton(
                              label: 'Continue →',
                              onTap: () => Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const HoroscopeScreen())),
                            ),
                          ),
                        ]),
                        const SizedBox(height: 10),
                        const Center(
                          child: Text(
                            'After completing the registration you can edit the profile from your personal dashboard.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 10, color: AppColors.kTextMuted),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}