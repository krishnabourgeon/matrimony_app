// ═══════════════════════════════════════════════════════════════
//  3b. COMMUNITY & LOCATION
// ═══════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/dropdown.dart';
import 'package:matrimony_app/view/custom_widgets/field.dart';
import 'package:matrimony_app/view/custom_widgets/field_warp.dart';
import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
import 'package:matrimony_app/view/custom_widgets/progress_indicator.dart';
import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
import 'package:matrimony_app/view/custom_widgets/section_header.dart';
import 'package:matrimony_app/view/custom_widgets/toggle_button.dart';
import 'package:matrimony_app/view/custom_widgets/top_bar.dart';
import 'package:matrimony_app/view/professional_details_screen.dart';


class CommunityLocationScreen extends StatefulWidget {
  const CommunityLocationScreen({super.key});

  @override
  State<CommunityLocationScreen> createState() =>
      _CommunityLocationState();
}

class _CommunityLocationState extends State<CommunityLocationScreen> {
  String _currentAddr = 'Yes';
  int _ancestorCount = 0;

  @override
  Widget build(BuildContext context) {
    return BlushScaffold(
      child: Column(
        children: [
          TopBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: StepBar(current: 2, total: 8),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionHeader(
                    tag: 'STEP 2 OF 8',
                    title: 'Community & Location',
                    subtitle: 'Tell us about your roots and where you live',
                  ),
                  const SizedBox(height: 20),
                  FloatingCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Religion + Caste
                        Row(children: [
                          Expanded(
                            child: FieldWrap('Religion',
                                required: true,
                                child: Drop(hint: 'Hindu', items: const [
                                  'Hindu', 'Muslim', 'Christian',
                                  'Sikh', 'Jain', 'Buddhist', 'Other'
                                ])),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: FieldWrap('Caste',
                                required: true,
                                child: Drop(
                                    hint: 'Select Caste',
                                    items: const [
                                      'Nair', 'Ezhava', 'Brahmin',
                                      'Kshatriya', 'Other'
                                    ])),
                          ),
                        ]),
                        const SizedBox(height: 14),

                        // Other castes
                        FieldWrap(
                          'Looking for matches from other castes?',
                          child: Drop(hint: 'No', items: const ['No', 'Yes']),
                        ),
                        const SizedBox(height: 14),

                        // SubCaste + Gotra
                        Row(children: [
                          Expanded(
                            child: FieldWrap('SubCaste',
                                child: Drop(hint: 'Select', items: const ['Select', 'N/A'])),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: FieldWrap('Gotra',
                                child: Drop(
                                    hint: "Don't Know",
                                    items: const ["Don't Know", 'N/A'])),
                          ),
                        ]),
                        const SizedBox(height: 14),

                        // Native Place
                        FieldWrap('Native Place / Ancestral Origin',
                            child: Column(children: [
                              Row(children: [
                                Expanded(
                                    child: Drop(hint: 'Country', items: const ['India', 'Other'])),
                                const SizedBox(width: 8),
                                Expanded(
                                    child: Drop(hint: 'State', items: const [
                                      'Kerala', 'Tamil Nadu', 'Karnataka',
                                      'Maharashtra', 'Delhi'
                                    ])),
                                const SizedBox(width: 8),
                                Expanded(
                                    child: Drop(hint: 'District', items: const [
                                      'Thrissur', 'Ernakulam',
                                      'Thiruvananthapuram', 'Kozhikode'
                                    ])),
                              ]),
                              const SizedBox(height: 8),
                              TextField(
                                maxLines: 3,
                                maxLength: 255,
                                style: const TextStyle(
                                    fontSize: 13, color: AppColors.kDarkSlate),
                                onChanged: (v) => setState(
                                    () => _ancestorCount = v.length),
                                decoration: InputDecoration(
                                  hintText: 'Tell about your ancestral origin',
                                  hintStyle: const TextStyle(
                                      color: AppColors.kTextMuted, fontSize: 12),
                                  contentPadding: const EdgeInsets.all(12),
                                  filled: true,
                                  fillColor: AppColors.kCardBg,
                                  counterText: '${_ancestorCount}/255',
                                  counterStyle: const TextStyle(
                                      fontSize: 10, color: AppColors.kTextMuted),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          const BorderSide(color: AppColors.kBorder)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          const BorderSide(color: AppColors.kBorder)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: AppColors.kAccent, width: 1.5)),
                                ),
                              ),
                            ])),
                        const SizedBox(height: 14),

                        // Permanent Residence
                        FieldWrap('Permanent Residence',
                            required: true,
                            child: Column(children: [
                              Row(children: [
                                Expanded(
                                    child: Drop(hint: 'Country', items: const ['India', 'Other'])),
                                const SizedBox(width: 8),
                                Expanded(
                                    child: Drop(hint: 'State', items: const [
                                      'Kerala', 'Tamil Nadu', 'Karnataka'
                                    ])),
                              ]),
                              const SizedBox(height: 8),
                              Row(children: [
                                Expanded(
                                    child: Drop(hint: 'District', items: const [
                                      'Thrissur', 'Ernakulam', 'Kozhikode'
                                    ])),
                                const SizedBox(width: 8),
                                Expanded(
                                    child: Field(
                                        hint: 'ZIP Code',
                                        keyboardType: TextInputType.number)),
                              ]),
                            ])),
                        const SizedBox(height: 14),

                        // Home Address
                        FieldWrap('Home Address',
                            required: true,
                            child: Field(hint: 'Enter home address')),
                        const SizedBox(height: 14),

                        // Current address toggle
                        Row(children: [
                          const Text('Is this your current address?',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.kSlate,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(width: 12),
                          ...['Yes', 'No'].map((s) => Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: Pill(
                                  label: s,
                                  selected: _currentAddr == s,
                                  onTap: () =>
                                      setState(() => _currentAddr = s),
                                ),
                              )),
                        ]),
                        const SizedBox(height: 22),
                        CTAButton(
                          label: 'Continue →',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const ProfessionalDetailsScreen()),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Center(
                          child: Text(
                            'You can edit your profile anytime from your dashboard',
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