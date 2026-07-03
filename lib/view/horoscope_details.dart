// ════════════════════════════════════════════════════════════════
//  STEP 8 — HOROSCOPE DETAILS
// ════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/field.dart';
import 'package:matrimony_app/view/custom_widgets/field_warp.dart';
import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
import 'package:matrimony_app/view/custom_widgets/progress_indicator.dart';
import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
import 'package:matrimony_app/view/custom_widgets/section_header.dart';
import 'package:matrimony_app/view/custom_widgets/top_bar.dart';
import 'package:matrimony_app/view/login_screen.dart';


class HoroscopeScreen extends StatefulWidget {
  const HoroscopeScreen({super.key});

  @override
  State<HoroscopeScreen> createState() => _HoroscopeState();
}

class _HoroscopeState extends State<HoroscopeScreen> {
  final _dobCtrl  = TextEditingController();
  final _timeCtrl = TextEditingController();
  final _locCtrl  = TextEditingController();

  String _amPm        = 'AM';
  String? _sudha;       // 'Yes' | 'No' | 'DontKnow'
  String? _dosha;       // 'Yes' | 'No' | 'DontKnow'
  String? _starOnly;    // 'Yes' | 'No'
  String? _horoMatch;   // 'Important' | 'Preferable' | 'Not Necessary' | 'DontWant'

  @override
  void dispose() {
    _dobCtrl.dispose();
    _timeCtrl.dispose();
    _locCtrl.dispose();
    super.dispose();
  }

  Widget _radioRow(
    String question,
    List<String> options,
    String? current,
    ValueChanged<String?> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.kSlate)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: options.map((opt) {
            final sel = current == opt;
            return GestureDetector(
              onTap: () => onChanged(opt),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: sel
                      ? AppColors.kAccent.withOpacity(0.1)
                      : AppColors.kCardBg,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: sel ? AppColors.kAccent : AppColors.kBorder,
                    width: sel ? 1.5 : 1.0,
                  ),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: sel
                              ? AppColors.kAccent
                              : AppColors.kBorder,
                          width: 1.5),
                      color: sel ? AppColors.kAccent : Colors.transparent,
                    ),
                    child: sel
                        ? const Icon(Icons.check,
                            size: 9, color: Colors.white)
                        : null,
                  ),
                  const SizedBox(width: 6),
                  Text(opt,
                      style: TextStyle(
                          fontSize: 12,
                          color: sel
                              ? AppColors.kAccent
                              : AppColors.kTextMuted,
                          fontWeight: sel
                              ? FontWeight.w600
                              : FontWeight.w400)),
                ]),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlushScaffold(
      child: Column(
        children: [
          TopBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: StepBar(current: 8, total: 8),
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
                    tag: 'STEP 8 OF 8',
                    title: 'Horoscope Details',
                    subtitle:
                        'Optional but improves your match quality significantly',
                  ),
                  const SizedBox(height: 20),
                  FloatingCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // ── DOB as per horoscope ──
                        FieldWrap('Date of Birth as per horoscope',
                            child: Field(
                              hint: 'DD-MM-YYYY',
                              controller: _dobCtrl,
                              keyboardType: TextInputType.datetime,
                            )),
                        const SizedBox(height: 14),

                        // ── Time of birth + AM/PM ──
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: FieldWrap('Time of Birth',
                                  child: Field(
                                    hint: '1:30',
                                    controller: _timeCtrl,
                                    keyboardType: TextInputType.datetime,
                                  )),
                            ),
                            const SizedBox(width: 10),
                            // AM / PM toggle
                            Container(
                              margin: const EdgeInsets.only(bottom: 1),
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: AppColors.kCardBg,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppColors.kBorder),
                              ),
                              child: Row(
                                children: ['AM', 'PM'].map((t) {
                                  final sel = _amPm == t;
                                  return GestureDetector(
                                    onTap: () =>
                                        setState(() => _amPm = t),
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 180),
                                      width: 42,
                                      height: 38,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: sel
                                            ? AppColors.kAccent
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(9),
                                      ),
                                      child: Text(t,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                              color: sel
                                                  ? Colors.white
                                                  : AppColors.kTextMuted)),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: FieldWrap('Location of Birth',
                                  child: Field(
                                    hint: 'City / Town',
                                    controller: _locCtrl,
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // ── Radio Questions ──
                        _radioRow(
                          'Having Sudha Jathakam',
                          ['Yes', 'No', "Don't Know"],
                          _sudha,
                          (v) => setState(() => _sudha = v),
                        ),
                        const SizedBox(height: 16),

                        _radioRow(
                          'Having Dosha Jathakam',
                          ['Yes', 'No', "Don't Know"],
                          _dosha,
                          (v) => setState(() => _dosha = v),
                        ),
                        const SizedBox(height: 16),

                        _radioRow(
                          'Looking for star match only?',
                          ['Yes', 'No'],
                          _starOnly,
                          (v) => setState(() => _starOnly = v),
                        ),
                        const SizedBox(height: 16),

                        _radioRow(
                          'Horoscope Matches',
                          ['Important', 'Preferable', 'Not Necessary', "Don't Want"],
                          _horoMatch,
                          (v) => setState(() => _horoMatch = v),
                        ),
                        const SizedBox(height: 26),

                        // ── Final Buttons ──
                        Row(children: [
                          Expanded(
                            child: CTAButton(
                              label: 'Skip & Submit',
                              outlined: true,
                              onTap: () => _showSuccess(context),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CTAButton(
                              label: 'Submit ✓',
                              onTap: () => _showSuccess(context),
                            ),
                          ),
                        ]),
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

  void _showSuccess(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: AppColors.kBgTop,
        title: const Row(children: [
          Icon(Icons.favorite_rounded, color: AppColors.kAccent),
          SizedBox(width: 8),
          Text('Profile Created!',
              style: TextStyle(
                  color: AppColors.kDarkSlate, fontSize: 18)),
        ]),
        content: const Text(
          'Your registration is complete. Login to find your perfect match!',
          style:
              TextStyle(color: AppColors.kTextMuted, fontSize: 13),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigate to LoginScreen or MainShell
              Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (r) => false);
            },
            child: const Text('Go to Login',
                style: TextStyle(
                    color: AppColors.kAccent,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

