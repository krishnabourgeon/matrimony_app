import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/counter_box.dart';
import 'package:matrimony_app/view/custom_widgets/counter_button.dart';
import 'package:matrimony_app/view/custom_widgets/dropdown.dart';
import 'package:matrimony_app/view/custom_widgets/field.dart';
import 'package:matrimony_app/view/custom_widgets/field_warp.dart';
import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
import 'package:matrimony_app/view/custom_widgets/messenger_checkbox_screen.dart';
import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
import 'package:matrimony_app/view/custom_widgets/progress_indicator.dart';
import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
import 'package:matrimony_app/view/custom_widgets/section_header.dart';
import 'package:matrimony_app/view/custom_widgets/top_bar.dart';
import 'package:matrimony_app/view/photos_about_screen.dart';

class FamilyDetailsScreen extends StatefulWidget {
  const FamilyDetailsScreen({super.key});

  @override
  State<FamilyDetailsScreen> createState() => _FamilyDetailsState();
}

class _FamilyDetailsState extends State<FamilyDetailsScreen> {
  int _brothers        = 0;
  int _brothersMarried = 0;
  int _sisters         = 0;
  int _sistersMarried  = 0;

  bool _whatsapp  = false;
  bool _telegram  = false;

  final _contactCtrl = TextEditingController();

  @override
  void dispose() {
    _contactCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlushScaffold(
      child: Column(
        children: [
          TopBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: StepBar(current: 5, total: 8),
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
                    tag: 'STEP 5 OF 8',
                    title: 'Family Details',
                    subtitle: 'Tell us about your family background',
                  ),
                  const SizedBox(height: 20),
                  FloatingCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // ── Row 1: Family Class + Family Type ──
                        Row(children: [
                          Expanded(
                            child: FieldWrap('Family Class',
                                required: true,
                                child: Drop(
                                    hint: 'Select',
                                    items: const [
                                      'Middle Class',
                                      'Upper Middle Class',
                                      'Rich / Affluent',
                                      'Higher Class',
                                    ])),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: FieldWrap('Family Type',
                                required: true,
                                child: Drop(
                                    hint: 'Select',
                                    items: const [
                                      'Nuclear Family',
                                      'Joint Family',
                                      'Extended Family',
                                    ])),
                          ),
                        ]),
                        const SizedBox(height: 14),

                        // ── Row 2: Family Values + No. of Family Members ──
                        Row(children: [
                          Expanded(
                            child: FieldWrap('Family Values',
                                child: Drop(
                                    hint: 'Select',
                                    items: const [
                                      'Traditional',
                                      'Moderate',
                                      'Liberal',
                                    ])),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: FieldWrap('No. of Members',
                                child: Drop(
                                    hint: 'Select',
                                    items: List.generate(
                                        10, (i) => '${i + 1}'))),
                          ),
                        ]),
                        const SizedBox(height: 14),

                        // ── Siblings counter row ──
                        const Text('Siblings',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.kSlate)),
                        const SizedBox(height: 10),

                        // Brothers
                        Row(children: [
                          const Text('Brother',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.kTextMuted)),
                          const Spacer(),
                          CountBtn('-', () => setState(() { if (_brothers > 0) _brothers--; })),
                          CounterBox(_brothers),
                          CountBtn('+', () => setState(() => _brothers++)),
                        ]),
                        const SizedBox(width: 12),
                        Row(children: [
                          const Text('Married Bother',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.kTextMuted)),
                          const Spacer(),
                          CountBtn('-', () => setState(() { if (_brothersMarried > 0) _brothersMarried--; })),
                          CounterBox(_brothersMarried),
                          CountBtn('+', () => setState(() => _brothersMarried++)),
                        ]),
                        const SizedBox(height: 10),

                        // Sisters
                        Row(children: [
                          const Text('Sister',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.kTextMuted)),
                          const Spacer(),
                          CountBtn('-', () => setState(() { if (_sisters > 0) _sisters--; })),
                          CounterBox(_sisters),
                          CountBtn('+', () => setState(() => _sisters++)),
                        ]),
                        const SizedBox(width: 12),
                        Row(children: [
                          const Text('Married Sister',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.kTextMuted)),
                          const Spacer(),
                          CountBtn('-', () => setState(() { if (_sistersMarried > 0) _sistersMarried--; })),
                          CounterBox(_sistersMarried),
                          CountBtn('+', () => setState(() => _sistersMarried++)),
                        ]),
                        const SizedBox(height: 14),

                        // ── Row: Father's + Mother's Occupation ──
                        Row(children: [
                          Expanded(
                            child: FieldWrap("Father's Occupation",
                                child: Drop(hint: 'Select', items: const [
                                  'Business', 'Government/PSU',
                                  'Private Sector', 'Retired',
                                  'Farmer', 'Not Employed', 'Deceased',
                                ])),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: FieldWrap("Mother's Occupation",
                                child: Drop(hint: 'Select', items: const [
                                  'Homemaker', 'Business',
                                  'Government/PSU', 'Private Sector',
                                  'Retired', 'Not Employed', 'Deceased',
                                ])),
                          ),
                        ]),
                        const SizedBox(height: 14),

                        // ── Family Income ──
                        FieldWrap('Family Annual Income',
                            child: Drop(hint: 'Select range', items: const [
                              'Below 2L', '2L to 5L',
                              '5L to 10L', '10L to 20L',
                              '20L to 30L', '30L to 50L', '50L+',
                            ])),
                        const SizedBox(height: 14),

                        // ── Contact Number ──
                        FieldWrap('Family Contact Number',
                            child: Row(children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 14),
                                decoration: BoxDecoration(
                                  color: AppColors.kCardBg,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: AppColors.kBorder),
                                ),
                                child: const Text('+91',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.kDarkSlate)),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Field(
                                    hint: 'Enter contact number',
                                    controller: _contactCtrl,
                                    keyboardType: TextInputType.phone),
                              ),
                            ])),
                        const SizedBox(height: 14),

                        // ── Active Messengers ──
                        const Text('Active messengers on this number:',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.kSlate)),
                        const SizedBox(height: 10),
                        Row(children: [
                          MessengerCheck(
                            label: 'WhatsApp',
                            icon: Icons.chat_rounded,
                            color: const Color(0xFF25D366),
                            value: _whatsapp,
                            onChanged: (v) =>
                                setState(() => _whatsapp = v),
                          ),
                          const SizedBox(width: 16),
                          MessengerCheck(
                            label: 'Telegram',
                            icon: Icons.send_rounded,
                            color: const Color(0xFF229ED9),
                            value: _telegram,
                            onChanged: (v) =>
                                setState(() => _telegram = v),
                          ),
                        ]),
                        const SizedBox(height: 22),

                        // ── Buttons ──
                        Row(children: [
                          Expanded(
                            child: CTAButton(
                              label: 'Skip',
                              outlined: true,
                              onTap: () => Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const PhotosAboutScreen())),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CTAButton(
                              label: 'Continue →',
                              onTap: () => Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const PhotosAboutScreen())),
                            ),
                          ),
                        ]),
                        const SizedBox(height: 10),
                        const Center(
                          child: Text(
                            'In next two stages you can enter your hobbies, interests & horoscope details.',
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