// // ═══════════════════════════════════════════════════════════════
// //  3d. PERSONAL & PHYSICAL
// // ═══════════════════════════════════════════════════════════════


// import 'package:flutter/material.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// import 'package:matrimony_app/view/custom_widgets/counter_button.dart';
// import 'package:matrimony_app/view/custom_widgets/dropdown.dart';
// import 'package:matrimony_app/view/custom_widgets/field_warp.dart';
// import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
// import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
// import 'package:matrimony_app/view/custom_widgets/progress_indicator.dart';
// import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
// import 'package:matrimony_app/view/custom_widgets/section_header.dart';
// import 'package:matrimony_app/view/custom_widgets/toggle_button.dart';
// import 'package:matrimony_app/view/custom_widgets/top_bar.dart';
// import 'package:matrimony_app/view/family_details_screen.dart';


// class PersonalPhysicalScreen extends StatefulWidget {
//   const PersonalPhysicalScreen({super.key});

//   @override
//   State<PersonalPhysicalScreen> createState() =>
//       _PersonalPhysicalState();
// }

// class _PersonalPhysicalState extends State<PersonalPhysicalScreen> {
//   String _marital = 'Unmarried';
//   String _surgery = 'No';
//   String _pets = 'No';
//   int _children = 0;
//   int _descCount = 0;

//   @override
//   Widget build(BuildContext context) {
//     return BlushScaffold(
//       child: Column(
//         children: [
//           TopBar(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: StepBar(current: 4, total: 8),
//           ),
//           const SizedBox(height: 14),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SectionHeader(
//                     tag: 'STEP 4 OF 8',
//                     title: 'Personal & Physical',
//                     subtitle: 'A few last details to complete your profile',
//                   ),
//                   const SizedBox(height: 20),
//                   FloatingCard(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Marital status
//                         FieldWrap('Marital Status',
//                             child: Row(children: [
//                               ...['Unmarried', 'Divorced','Widow/er','Awaiting Divorcee','Annulled'].map((s) =>
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.only(right: 8),
//                                     child: Pill(
//                                       label: s,
//                                       selected: _marital == s,
//                                       onTap: () =>
//                                           setState(() => _marital = s),
//                                     ),
//                                   )),
//                             ])),
//                         const SizedBox(height: 14),

//                         // Number of children
//                         FieldWrap('Number of Children',
//                             child: Row(children: [
//                               CountBtn(
//                                   '-',
//                                   () => setState(() {
//                                         if (_children > 0) _children--;
//                                       })),
//                               Container(
//                                 width: 48,
//                                 height: 40,
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                   color: AppColors.kCardBg,
//                                   border: Border.symmetric(
//                                       horizontal: const BorderSide(
//                                           color: AppColors.kBorder)),
//                                 ),
//                                 child: Text('$_children',
//                                     style: const TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                         color: AppColors.kDarkSlate)),
//                               ),
//                               CountBtn('+',
//                                   () => setState(() => _children++)),
//                             ])),
//                         const SizedBox(height: 14),

//                         // Physical details
//                         const Text('Physical Details',
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColors.kSlate)),
//                         const SizedBox(height: 8),
//                         Row(children: [
//                           Expanded(
//                               child: Drop(hint: 'Height (cm)', items: const [
//                                 '150', '155', '160', '165', '170',
//                                 '175', '180', '185', '190'
//                               ])),
//                           const SizedBox(width: 8),
//                           Expanded(
//                               child: Drop(hint: 'Weight (Kg)', items: const [
//                                 '45', '50', '55', '60', '65',
//                                 '70', '75', '80', '85', '90+'
//                               ])),
//                         ]),
//                         const SizedBox(height: 8),
//                         Row(children: [
//                           Expanded(
//                               child: Drop(hint: 'Skin Color', items: const [
//                                 'Fair', 'Wheatish', 'Dusky', 'Dark'
//                               ])),
//                           const SizedBox(width: 8),
//                           Expanded(
//                               child: Drop(hint: 'Body Type', items: const [
//                                 'Slim', 'Athletic', 'Average', 'Heavy'
//                               ])),
//                         ]),
//                         const SizedBox(height: 8),
//                         Row(children: [
//                           Expanded(
//                               child: Drop(hint: 'Blood Group', items: const [
//                                 'A+', 'A-', 'B+', 'B-',
//                                 'O+', 'O-', 'AB+', 'AB-'
//                               ])),
//                           const SizedBox(width: 8),
//                           Expanded(
//                               child: Drop(
//                                   hint: 'Any disability',
//                                   items: const ['No', 'Yes'])),
//                         ]),
//                         const SizedBox(height: 8),
//                         TextField(
//                           maxLines: 3,
//                           maxLength: 255,
//                           style: const TextStyle(
//                               fontSize: 13, color: AppColors.kDarkSlate),
//                           onChanged: (v) =>
//                               setState(() => _descCount = v.length),
//                           decoration: InputDecoration(
//                             hintText: 'Write a brief description',
//                             hintStyle: const TextStyle(
//                                 color: AppColors.kTextMuted, fontSize: 12),
//                             contentPadding: const EdgeInsets.all(12),
//                             filled: true,
//                             fillColor: AppColors.kCardBg,
//                             counterText: '${_descCount}/255',
//                             counterStyle: const TextStyle(
//                                 fontSize: 10, color: AppColors.kTextMuted),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide:
//                                     const BorderSide(color: AppColors.kBorder)),
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide:
//                                     const BorderSide(color: AppColors.kBorder)),
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: const BorderSide(
//                                     color: AppColors.kAccent, width: 1.5)),
//                           ),
//                         ),
//                         const SizedBox(height: 14),

//                         // Surgery
//                         FieldWrap(
//                             'Any major surgical treatment or organ replacing done?',
//                             child: Row(children: [
//                               ...['No', 'Yes'].map((s) => Padding(
//                                     padding:
//                                         const EdgeInsets.only(right: 8),
//                                     child: Pill(
//                                       label: s,
//                                       selected: _surgery == s,
//                                       onTap: () =>
//                                           setState(() => _surgery = s),
//                                     ),
//                                   )),
//                             ])),
//                         const SizedBox(height: 14),

//                         // Diet + Smoking + Drinking
//                         Row(children: [
//                           Expanded(
//                             child: FieldWrap('Diet',
//                                 child: Drop(hint: 'Diet', items: const [
//                                   'Vegetarian', 'Non-Vegetarian',
//                                   'Vegan', 'Jain'
//                                 ])),
//                           ),
//                           const SizedBox(width: 8),
//                           Expanded(
//                             child: FieldWrap('Smoking',
//                                 child: Drop(hint: 'Smoking', items: const [
//                                   'No', 'Occasionally', 'Yes'
//                                 ])),
//                           ),
//                         ]),
//                         const SizedBox(height: 10),
//                         SizedBox(
//                           width: 180,
//                           child: FieldWrap('Drinking',
//                               child: Drop(hint: 'Drinking', items: const [
//                                 'No', 'Occasionally', 'Yes'
//                               ])),
//                         ),
//                         const SizedBox(height: 14),

//                         // Pets
//                         FieldWrap('Do you have any pets?',
//                             child: Row(children: [
//                               ...['No', 'Yes'].map((s) => Padding(
//                                     padding:
//                                         const EdgeInsets.only(right: 8),
//                                     child: Pill(
//                                       label: s,
//                                       selected: _pets == s,
//                                       onTap: () =>
//                                           setState(() => _pets = s),
//                                     ),
//                                   )),
//                             ])),
//                         const SizedBox(height: 22),

//                         // Two buttons
//                         Row(children: [
//                           Expanded(
//                             child: CTAButton(
//                               label: 'Continue',
//                               //outlined: true,
//                               onTap: () => Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (_) => const FamilyDetailsScreen()),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           // Expanded(
//                           //   child: _CTAButton(
//                           //     label: 'Submit ✓',
//                           //     onTap: () => showDialog(
//                           //       context: context,
//                           //       builder: (_) => AlertDialog(
//                           //         shape: RoundedRectangleBorder(
//                           //             borderRadius:
//                           //                 BorderRadius.circular(20)),
//                           //         backgroundColor: AppColors.kBgTop,
//                           //         title: const Row(children: [
//                           //           Icon(Icons.favorite_rounded,
//                           //               color: AppColors.kAccent),
//                           //           SizedBox(width: 8),
//                           //           Text('Profile Created!',
//                           //               style: TextStyle(
//                           //                   color: AppColors.kDarkSlate,
//                           //                   fontSize: 18)),
//                           //         ]),
//                           //         content: const Text(
//                           //           'Your registration is complete. Login to find your perfect match!',
//                           //           style: TextStyle(
//                           //               color: AppColors.kTextMuted, fontSize: 13),
//                           //         ),
//                           //         actions: [
//                           //           TextButton(
//                           //             onPressed: () {
//                           //               Navigator.pop(context);
//                           //               Navigator.pushAndRemoveUntil(
//                           //                 context,
//                           //                 MaterialPageRoute(
//                           //                     builder: (_) =>
//                           //                         const LoginScreen()),
//                           //                 (r) => false,
//                           //               );
//                           //             },
//                           //             child: const Text('Go to Login',
//                           //                 style: TextStyle(
//                           //                     color: AppColors.kAccent,
//                           //                     fontWeight: FontWeight.bold)),
//                           //           ),
//                           //         ],
//                           //       ),
//                           //     ),
//                           //   ),
//                           // ),
//                         ]),
//                         const SizedBox(height: 10),
//                         const Center(
//                           child: Text(
//                             'You can edit your profile anytime from your dashboard',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 fontSize: 10, color: AppColors.kTextMuted),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 32),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





// ═══════════════════════════════════════════════════════════════
//  3d. PERSONAL & PHYSICAL
// ═══════════════════════════════════════════════════════════════


import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/counter_button.dart';
import 'package:matrimony_app/view/custom_widgets/dropdown.dart';
import 'package:matrimony_app/view/custom_widgets/field_warp.dart';
import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
import 'package:matrimony_app/view/custom_widgets/progress_indicator.dart';
import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
import 'package:matrimony_app/view/custom_widgets/section_header.dart';
import 'package:matrimony_app/view/custom_widgets/toggle_button.dart';
import 'package:matrimony_app/view/custom_widgets/top_bar.dart';
import 'package:matrimony_app/view/family_details_screen.dart';


class PersonalPhysicalScreen extends StatefulWidget {
  const PersonalPhysicalScreen({super.key});

  @override
  State<PersonalPhysicalScreen> createState() =>
      _PersonalPhysicalState();
}

class _PersonalPhysicalState extends State<PersonalPhysicalScreen> {
  String _marital = 'Unmarried';
  String _surgery = 'No';
  String _pets = 'No';
  int _children = 0;
  int _descCount = 0;

  @override
  Widget build(BuildContext context) {
    return BlushScaffold(
      child: Column(
        children: [
          TopBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: StepBar(current: 4, total: 8),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionHeader(
                    tag: 'STEP 4 OF 8',
                    title: 'Personal & Physical',
                    subtitle: 'A few last details to complete your profile',
                  ),
                  const SizedBox(height: 20),
                  FloatingCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Marital status
                        FieldWrap('Marital Status',
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                'Unmarried',
                                'Divorced',
                                'Widow/er',
                                'Awaiting Divorcee',
                                'Annulled'
                              ].map((s) => Pill(
                                    label: s,
                                    selected: _marital == s,
                                    onTap: () =>
                                        setState(() => _marital = s),
                                  )).toList(),
                            )),
                        const SizedBox(height: 14),

                        // Number of children
                        FieldWrap('Number of Children',
                            child: Row(children: [
                              CountBtn(
                                  '-',
                                  () => setState(() {
                                        if (_children > 0) _children--;
                                      })),
                              Container(
                                width: 48,
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.kCardBg,
                                  border: Border.symmetric(
                                      horizontal: const BorderSide(
                                          color: AppColors.kBorder)),
                                ),
                                child: Text('$_children',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.kDarkSlate)),
                              ),
                              CountBtn('+',
                                  () => setState(() => _children++)),
                            ])),
                        const SizedBox(height: 14),

                        // Physical details
                        const Text('Physical Details',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.kSlate)),
                        const SizedBox(height: 8),
                        Row(children: [
                          Expanded(
                              child: Drop(hint: 'Height (cm)', items: const [
                                '150', '155', '160', '165', '170',
                                '175', '180', '185', '190'
                              ])),
                          const SizedBox(width: 8),
                          Expanded(
                              child: Drop(hint: 'Weight (Kg)', items: const [
                                '45', '50', '55', '60', '65',
                                '70', '75', '80', '85', '90+'
                              ])),
                        ]),
                        const SizedBox(height: 8),
                        Row(children: [
                          Expanded(
                              child: Drop(hint: 'Skin Color', items: const [
                                'Fair', 'Wheatish', 'Dusky', 'Dark'
                              ])),
                          const SizedBox(width: 8),
                          Expanded(
                              child: Drop(hint: 'Body Type', items: const [
                                'Slim', 'Athletic', 'Average', 'Heavy'
                              ])),
                        ]),
                        const SizedBox(height: 8),
                        Row(children: [
                          Expanded(
                              child: Drop(hint: 'Blood Group', items: const [
                                'A+', 'A-', 'B+', 'B-',
                                'O+', 'O-', 'AB+', 'AB-'
                              ])),
                          const SizedBox(width: 8),
                          Expanded(
                              child: Drop(
                                  hint: 'Any disability',
                                  items: const ['No', 'Yes'])),
                        ]),
                        const SizedBox(height: 8),
                        TextField(
                          maxLines: 3,
                          maxLength: 255,
                          style: const TextStyle(
                              fontSize: 13, color: AppColors.kDarkSlate),
                          onChanged: (v) =>
                              setState(() => _descCount = v.length),
                          decoration: InputDecoration(
                            hintText: 'Write a brief description',
                            hintStyle: const TextStyle(
                                color: AppColors.kTextMuted, fontSize: 12),
                            contentPadding: const EdgeInsets.all(12),
                            filled: true,
                            fillColor: AppColors.kCardBg,
                            counterText: '${_descCount}/255',
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
                        const SizedBox(height: 14),

                        // Surgery
                        FieldWrap(
                            'Any major surgical treatment or organ replacing done?',
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: ['No', 'Yes'].map((s) => Pill(
                                    label: s,
                                    selected: _surgery == s,
                                    onTap: () =>
                                        setState(() => _surgery = s),
                                  )).toList(),
                            )),
                        const SizedBox(height: 14),

                        // Diet + Smoking + Drinking
                        Row(children: [
                          Expanded(
                            child: FieldWrap('Diet',
                                child: Drop(hint: 'Diet', items: const [
                                  'Vegetarian', 'Non-Vegetarian',
                                  'Vegan', 'Jain'
                                ])),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: FieldWrap('Smoking',
                                child: Drop(hint: 'Smoking', items: const [
                                  'No', 'Occasionally', 'Yes'
                                ])),
                          ),
                        ]),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 180,
                          child: FieldWrap('Drinking',
                              child: Drop(hint: 'Drinking', items: const [
                                'No', 'Occasionally', 'Yes'
                              ])),
                        ),
                        const SizedBox(height: 14),

                        // Pets
                        FieldWrap('Do you have any pets?',
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: ['No', 'Yes'].map((s) => Pill(
                                    label: s,
                                    selected: _pets == s,
                                    onTap: () =>
                                        setState(() => _pets = s),
                                  )).toList(),
                            )),
                        const SizedBox(height: 22),

                        // Two buttons
                        Row(children: [
                          Expanded(
                            child: CTAButton(
                              label: 'Continue',
                              //outlined: true,
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const FamilyDetailsScreen()),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                        ]),
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