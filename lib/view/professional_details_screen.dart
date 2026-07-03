// ═══════════════════════════════════════════════════════════════
//  3c. PROFESSIONAL DETAILS
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
import 'package:matrimony_app/view/custom_widgets/top_bar.dart';
import 'package:matrimony_app/view/personal_physical_screen.dart';


class ProfessionalDetailsScreen extends StatefulWidget {
  const ProfessionalDetailsScreen({super.key});

  @override
  State<ProfessionalDetailsScreen> createState() =>
      _ProfessionalDetailsState();
}

class _ProfessionalDetailsState extends State<ProfessionalDetailsScreen> {
  final _empOptions = [
    'Healthcare', 'Information Technology', 'Farmer', 'Defence',
    'Government/PSU', 'Private sector', 'Business', 'Others',
  ];
  final Set<String> _selected = {};

  @override
  Widget build(BuildContext context) {
    return BlushScaffold(
      child: Column(
        children: [
          TopBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: StepBar(current: 3, total: 8),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionHeader(
                    tag: 'STEP 3 OF 8',
                    title: 'Professional Details',
                    subtitle:
                        'Helps us find you the most compatible match',
                  ),
                  const SizedBox(height: 20),
                  FloatingCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Highest education
                        FieldWrap('Highest Education',
                            required: true,
                            child: Drop(
                                hint: 'Select Education',
                                items: const [
                                  'High School', 'Diploma', "Bachelor's",
                                  "Master's", 'PhD', 'Other'
                                ])),
                        const SizedBox(height: 14),

                        // Education in detail
                        FieldWrap('Education in Detail',
                            child: Field(
                                hint: 'Write a brief description',
                                maxLines: 3,
                                maxLength: 255)),
                        const SizedBox(height: 14),

                        // Languages
                        FieldWrap('Languages Known',
                            child: Field(hint: 'Select languages')),
                        const SizedBox(height: 14),

                        // Employed in chips
                        FieldWrap('Employed In',
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: _empOptions.map((e) {
                                final sel = _selected.contains(e);
                                return GestureDetector(
                                  onTap: () => setState(() => sel
                                      ? _selected.remove(e)
                                      : _selected.add(e)),
                                  child: AnimatedContainer(
                                    duration:
                                        const Duration(milliseconds: 180),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: sel
                                          ? AppColors.kAccent.withOpacity(0.1)
                                          : AppColors.kCardBg,
                                      borderRadius:
                                          BorderRadius.circular(8),
                                      border: Border.all(
                                          color: sel ? AppColors.kAccent : AppColors.kBorder,
                                          width: 1.3),
                                    ),
                                    child: Text(e,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: sel
                                              ? AppColors.kAccent
                                              : AppColors.kTextMuted,
                                          fontWeight: sel
                                              ? FontWeight.w600
                                              : FontWeight.w400,
                                        )),
                                  ),
                                );
                              }).toList(),
                            )),
                        const SizedBox(height: 14),

                        // Occupation + Working Country
                        Row(children: [
                          Expanded(
                            child: FieldWrap('Occupation',
                                required: true,
                                child: Drop(hint: 'Select', items: const [
                                  'Engineer', 'Doctor', 'Teacher',
                                  'Lawyer', 'Accountant', 'Other'
                                ])),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: FieldWrap('Working Country',
                                child: Drop(hint: 'Select', items: const [
                                  'India', 'UAE', 'USA', 'UK', 'Other'
                                ])),
                          ),
                        ]),
                        const SizedBox(height: 14),

                        // State + City
                        Row(children: [
                          Expanded(
                            child: FieldWrap('State',
                                child: Drop(hint: 'Select State', items: const [
                                  'Kerala', 'Tamil Nadu', 'Karnataka',
                                  'Maharashtra', 'Delhi'
                                ])),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: FieldWrap('City',
                                child: Drop(hint: 'Select', items: const [
                                  'Thrissur', 'Kochi', 'Kozhikode',
                                  'Thiruvananthapuram'
                                ])),
                          ),
                        ]),
                        const SizedBox(height: 14),

                        // Residential Status
                        FieldWrap('Residential Status',
                            child: Drop(hint: 'Select', items: const [
                              'Resident',
                              'Non-Resident Indian',
                              'Overseas Citizen'
                            ])),
                        const SizedBox(height: 14),

                        // Annual Income
                        FieldWrap('Annual Income',
                            child: Row(children: [
                              Expanded(
                                child: Drop(hint: 'Currency', items: const [
                                  'INR', 'USD', 'AED'
                                ]),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Drop(hint: 'Range', items: const [
                                  'Below 2L', '2-5L', '5-10L',
                                  '10-20L', '20L+'
                                ]),
                              ),
                            ])),
                        const SizedBox(height: 22),
                        CTAButton(
                          label: 'Continue →',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const PersonalPhysicalScreen()),
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