// ═══════════════════════════════════════════════════════════════
//  3a. BASIC INFORMATION
// ═══════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:matrimony_app/view/communtiy_location_screen.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/field.dart';
import 'package:matrimony_app/view/custom_widgets/field_warp.dart';
import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
import 'package:matrimony_app/view/custom_widgets/progress_indicator.dart';
import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
import 'package:matrimony_app/view/custom_widgets/section_header.dart';
import 'package:matrimony_app/view/custom_widgets/toggle_button.dart';
import 'package:matrimony_app/view/custom_widgets/top_bar.dart';


class BasicInfoScreen extends StatefulWidget {
  const BasicInfoScreen({super.key});

  @override
  State<BasicInfoScreen> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfoScreen> {
  String _gender = 'Male';
  bool _showPass = false;
  bool _showConfirm = false;

  @override
  Widget build(BuildContext context) {
    return BlushScaffold(
      child: Column(
        children: [
          TopBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: StepBar(current: 1, total: 8),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionHeader(
                    tag: 'STEP 1 OF 8',
                    title: 'Basic\nInformation',
                    subtitle:
                        'Provide your basic information to get started',
                  ),
                  const SizedBox(height: 20),
                  FloatingCard(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // DOB + Gender
                          Row(children: [
                            Expanded(
                              child: FieldWrap('Date of Birth',
                                  required: true,
                                  child: Field(
                                      hint: 'DD-MM-YYYY',
                                      keyboardType:
                                          TextInputType.datetime)),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: FieldWrap('Gender',
                                  required: true,
                                  child: Row(children: [
                                    Expanded(
                                      child: Pill(
                                        label: 'Male',
                                        selected: _gender == 'Male',
                                        onTap: () => setState(
                                            () => _gender = 'Male'),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Expanded(
                                      child: Pill(
                                        label: 'Female',
                                        selected: _gender == 'Female',
                                        onTap: () => setState(
                                            () => _gender = 'Female'),
                                      ),
                                    ),
                                  ])),
                            ),
                          ]),
                          const SizedBox(height: 14),

                          // // Religion + Mother Tongue
                          // Row(children: [
                          //   Expanded(
                          //     child: FieldWrap('Religion',
                          //         required: true,
                          //         child: Drop(
                          //             hint: 'Select',
                          //             items: const [
                          //               'Hindu', 'Muslim', 'Christian',
                          //               'Sikh', 'Jain', 'Buddhist', 'Other'
                          //             ])),
                          //   ),
                          //   const SizedBox(width: 12),
                          //   Expanded(
                          //     child: FieldWrap('Mother Tongue',
                          //         required: true,
                          //         child: Drop(hint: 'Select', items: const [
                          //           'Malayalam', 'Hindi', 'Tamil',
                          //           'Telugu', 'Kannada', 'Punjabi', 'Other'
                          //         ])),
                          //   ),
                          // ]),
                          // const SizedBox(height: 14),

                          // Email
                          FieldWrap('Email',
                              required: true,
                              child: Field(
                                  hint: 'Your email address',
                                  keyboardType: TextInputType.emailAddress)),
                          const SizedBox(height: 14),

                          // Password
                          FieldWrap('Password',
                              child: Field(
                                hint: '••••••••',
                                obscure: !_showPass,
                                suffix: IconButton(
                                  icon: Icon(
                                    _showPass
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: AppColors.kTextMuted, size: 20,
                                  ),
                                  onPressed: () => setState(
                                      () => _showPass = !_showPass),
                                ),
                              )),
                          const SizedBox(height: 4),
                          const Text(
                              'eg. Abcd@123 · min 8 characters – max 20',
                              style: TextStyle(
                                  fontSize: 10, color: AppColors.kTextMuted)),
                          const SizedBox(height: 14),

                          // Confirm password
                          FieldWrap('Confirm Password',
                              child: Field(
                                hint: '••••••••',
                                obscure: !_showConfirm,
                                suffix: IconButton(
                                  icon: Icon(
                                    _showConfirm
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: AppColors.kTextMuted, size: 20,
                                  ),
                                  onPressed: () => setState(
                                      () => _showConfirm = !_showConfirm),
                                ),
                              )),
                          const SizedBox(height: 22),
                          CTAButton(
                            label: 'Continue →',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      const CommunityLocationScreen()),
                            ),
                          ),
                        ]),
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
