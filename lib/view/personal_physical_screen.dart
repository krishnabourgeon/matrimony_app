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
//                             child: Wrap(
//                               spacing: 8,
//                               runSpacing: 8,
//                               children: [
//                                 'Unmarried',
//                                 'Divorced',
//                                 'Widow/er',
//                                 'Awaiting Divorcee',
//                                 'Annulled'
//                               ].map((s) => Pill(
//                                     label: s,
//                                     selected: _marital == s,
//                                     onTap: () =>
//                                         setState(() => _marital = s),
//                                   )).toList(),
//                             )),
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
//                             child: Wrap(
//                               spacing: 8,
//                               runSpacing: 8,
//                               children: ['No', 'Yes'].map((s) => Pill(
//                                     label: s,
//                                     selected: _surgery == s,
//                                     onTap: () =>
//                                         setState(() => _surgery = s),
//                                   )).toList(),
//                             )),
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
//                             child: Wrap(
//                               spacing: 8,
//                               runSpacing: 8,
//                               children: ['No', 'Yes'].map((s) => Pill(
//                                     label: s,
//                                     selected: _pets == s,
//                                     onTap: () =>
//                                         setState(() => _pets = s),
//                                   )).toList(),
//                             )),
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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:matrimony_app/model/blood_group.dart';
import 'package:matrimony_app/model/body_type.dart';
import 'package:matrimony_app/model/choices_model.dart';
import 'package:matrimony_app/model/diets_model.dart';
import 'package:matrimony_app/model/marital_statuses_model.dart';
import 'package:matrimony_app/model/skin_type_model.dart';
import 'package:matrimony_app/provider/register_provider.dart';
import 'package:matrimony_app/services/provider_helper_class.dart';
import 'package:matrimony_app/view/family_details_screen.dart';
import 'package:matrimony_app/view/main_screen.dart';
import 'package:matrimony_app/view/photos_about_screen.dart';

/// Brand colors used on this screen — mirrors BasicInfoScreen's palette.
class _Palette {
  _Palette._();
  static const Color coral = Color(0xFFFF3356);
  static const Color ink = Color(0xFF1A1A1A);
  static const Color subtleWhite = Color(0xFFFFFFFF);

  static const Color fieldBg = Color(0xFFF5F5F7);
  static const Color hintText = Color(0xFF8A8A8E);
  static const Color trackBg = Color(0xFFECECEE);
  static const Color grey = Color(0xFFBDBDBD);
}

class PersonalPhysicalScreen extends StatefulWidget {
  const PersonalPhysicalScreen({super.key});

  @override
  State<PersonalPhysicalScreen> createState() => _PersonalPhysicalState();
}

class _PersonalPhysicalState extends State<PersonalPhysicalScreen> {
  static final List<int> _heightOptions = List.generate(210 - 120 + 1, (i) => 120 + i);
  static final List<int> _weightOptions = List.generate(150 - 30 + 1, (i) => 30 + i);

  MaritalStatus? _marital;
  String _surgery = 'No';
  String _pets = 'No';
  int _children = 0;
  int _descCount = 0;

  final _descriptionCtrl = TextEditingController();
  final _disabilityDescCtrl = TextEditingController();
  final _surgeryDescCtrl = TextEditingController();

  int? _height;
  int? _weight;
  SkinType? _skinColor;
  BodyType? _bodyType;
  BloodGroup? _bloodGroup;
  String _disability = 'No';
  Diet? _diet;
  Choice? _smoking;
  Choice? _drinking;

  bool _isSubmitting = false;
  bool _isSubmittingProfile = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<RegisterProvider>();
      provider.getMaritalStatuses();
      provider.getSkinTypes();
      provider.getBodyTypes();
      provider.getBloodGroups();
      provider.getDiets();
      provider.getChoices();
    });
  }

  @override
  void dispose() {
    _descriptionCtrl.dispose();
    _disabilityDescCtrl.dispose();
    _surgeryDescCtrl.dispose();
    super.dispose();
  }

  // Physical Details (Height/Weight/Skin Color/Body Type/Blood Group) are
  // optional on this screen — nothing here gates the Continue/Submit button.
  Future<bool> _submitPersonalDetails() {
    final provider = context.read<RegisterProvider>();
    return provider.personalDetails(
      maritalStatusId: _marital?.id ?? 0,
      childCount: _children,
      height: _height ?? 0,
      weight: _weight ?? 0,
      skinTypeId: _skinColor?.id ?? 0,
      bodyTypeId: _bodyType?.id ?? 0,
      bloodGroupId: _bloodGroup?.id ?? 0,
      disabilityStatus: _disability == 'Yes' ? 1 : 0,
      disabilityDesc: _disability == 'Yes' ? _disabilityDescCtrl.text.trim() : '',
      majorSurgery: _surgery == 'Yes' ? 1 : 0,
      dietId: _diet?.id ?? 0,
      drinkingHabitId: _drinking?.id ?? 0,
      smokingHabitId: _smoking?.id ?? 0,
      havePet: _pets == 'Yes' ? 1 : 0,
    );
  }

  void _handleContinue() {
    FocusScope.of(context).unfocus();

    setState(() => _isSubmitting = true);
    final provider = context.read<RegisterProvider>();
    _submitPersonalDetails().then((success) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      if (success) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PhotosAboutScreen()),
        );
      } else {
        _showSnack(provider.personalError ?? 'Something went wrong. Please try again');
      }
    });
  }

  // Submits the profile now with whatever's filled so far, skipping the
  // remaining onboarding steps (Family Details / Photos), straight to the
  // app's main screen.
  void _handleSubmit() {
    FocusScope.of(context).unfocus();
    setState(() => _isSubmittingProfile = true);
    final provider = context.read<RegisterProvider>();
    _submitPersonalDetails().then((success) {
      if (!mounted) return;
      setState(() => _isSubmittingProfile = false);
      if (success) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const MainShell()),
          (route) => false,
        );
      } else {
        _showSnack(provider.personalError ?? 'Something went wrong. Please try again');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _Palette.subtleWhite,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 35.h),
                    Text(
                      'Personal & Physical',
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w800,
                        color: _Palette.ink,
                        letterSpacing: -0.6,
                        height: 1.25,
                      ),
                    ),
                    // SizedBox(height: 6.h),
                    // Text(
                    //   'A few last details to complete your profile',
                    //   style: GoogleFonts.tasaOrbiter(
                    //     fontSize: 14.sp,
                    //     fontWeight: FontWeight.w400,
                    //     color: _Palette.hintText,
                    //   ),
                    // ),
                    SizedBox(height: 20.h),

                    _FieldLabel('Marital Status'),
                    SizedBox(height: 10.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final options = provider.maritalStatusesModel?.maritalStatuses ?? [];
                        final loading = provider.loaderState == LoaderState.loading &&
                            provider.maritalStatusesModel == null;
                        if (loading) {
                          return SizedBox(
                            height: 30.h,
                            child: Center(
                              child: CircularProgressIndicator(strokeWidth: 2, color: _Palette.coral),
                            ),
                          );
                        }
                        return _buildChipSelector<MaritalStatus>(
                          options: options,
                          selected: _marital,
                          labelBuilder: (m) => m.name,
                          onSelect: (v) => setState(() => _marital = v),
                        );
                      },
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Number of Children'),
                    SizedBox(height: 8.h),
                    _buildCounterField(
                      value: _children,
                      onDecrement: () => setState(() {
                        if (_children > 0) _children--;
                      }),
                      onIncrement: () => setState(() => _children++),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Physical Details'),
                    SizedBox(height: 8.h),
                    _buildDropdownField<int>(
                      hint: 'Height (cm)',
                      value: _height,
                      items: _heightOptions,
                      labelBuilder: (h) => '$h cm',
                      onChanged: (v) => setState(() => _height = v),
                    ),
                    SizedBox(height: 8.h),
                    _buildDropdownField<int>(
                      hint: 'Weight (Kg)',
                      value: _weight,
                      items: _weightOptions,
                      labelBuilder: (w) => '$w kg',
                      onChanged: (v) => setState(() => _weight = v),
                    ),
                    SizedBox(height: 8.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final skinTypes = provider.skinTypeModel?.skinTypes ?? [];
                        final loading = provider.loaderState == LoaderState.loading &&
                            provider.skinTypeModel == null;
                        return _buildDropdownField<SkinType>(
                          hint: loading ? 'Loading...' : 'Skin Color',
                          value: _skinColor,
                          items: skinTypes,
                          labelBuilder: (s) => s.name,
                          loading: loading,
                          onChanged: (v) => setState(() => _skinColor = v),
                        );
                      },
                    ),
                    SizedBox(height: 8.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final bodyTypes = provider.bodyTypeModel?.bodyTypes ?? [];
                        final loading = provider.loaderState == LoaderState.loading &&
                            provider.bodyTypeModel == null;
                        return _buildDropdownField<BodyType>(
                          hint: loading ? 'Loading...' : 'Body Type',
                          value: _bodyType,
                          items: bodyTypes,
                          labelBuilder: (b) => b.name,
                          loading: loading,
                          onChanged: (v) => setState(() => _bodyType = v),
                        );
                      },
                    ),
                    SizedBox(height: 8.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final bloodGroups = provider.bloodGroupModel?.bloodGroups ?? [];
                        final loading = provider.loaderState == LoaderState.loading &&
                            provider.bloodGroupModel == null;
                        return _buildDropdownField<BloodGroup>(
                          hint: loading ? 'Loading...' : 'Blood Group',
                          value: _bloodGroup,
                          items: bloodGroups,
                          labelBuilder: (b) => b.name,
                          loading: loading,
                          onChanged: (v) => setState(() => _bloodGroup = v),
                        );
                      },
                    ),
                    SizedBox(height: 8.h),
                    _buildDropdownField<String>(
                      hint: 'Any disability',
                      value: _disability,
                      items: const ['No', 'Yes'],
                      labelBuilder: (s) => s,
                      onChanged: (v) => setState(() => _disability = v ?? 'No'),
                    ),
                    if (_disability == 'Yes') ...[
                      SizedBox(height: 8.h),
                      _buildTextAreaField(
                        controller: _disabilityDescCtrl,
                        hint: 'Briefly describe the disability',
                        maxLength: 255,
                        onChanged: (v) => setState(() {}),
                        count: _disabilityDescCtrl.text.length,
                      ),
                    ],
                    //SizedBox(height: 8.h),
                    // _buildTextAreaField(
                    //   controller: _descriptionCtrl,
                    //   hint: 'Write a brief description',
                    //   maxLength: 255,
                    //   onChanged: (v) => setState(() => _descCount = v.length),
                    //   count: _descCount,
                    // ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Any major surgical treatment or organ replacing done?'),
                    SizedBox(height: 10.h),
                    _buildChipSelector<String>(
                      options: const ['No', 'Yes'],
                      selected: _surgery,
                      labelBuilder: (s) => s,
                      onSelect: (v) => setState(() => _surgery = v ?? 'No'),
                    ),
                    if (_surgery == 'Yes') ...[
                      SizedBox(height: 8.h),
                      _buildTextAreaField(
                        controller: _surgeryDescCtrl,
                        hint: 'Briefly describe the surgery / organ replacement',
                        maxLength: 255,
                        onChanged: (v) => setState(() {}),
                        count: _surgeryDescCtrl.text.length,
                      ),
                    ],

                    SizedBox(height: 20.h),
                    _FieldLabel('Diet'),
                    SizedBox(height: 8.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final diets = provider.dietsModel?.diets ?? [];
                        final loading = provider.loaderState == LoaderState.loading &&
                            provider.dietsModel == null;
                        return _buildDropdownField<Diet>(
                          hint: loading ? 'Loading...' : 'Diet',
                          value: _diet,
                          items: diets,
                          labelBuilder: (d) => d.name,
                          loading: loading,
                          onChanged: (v) => setState(() => _diet = v),
                        );
                      },
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Smoking'),
                    SizedBox(height: 8.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final options = provider.choicesModel?.choices ?? [];
                        final loading = provider.loaderState == LoaderState.loading &&
                            provider.choicesModel == null;
                        return _buildDropdownField<Choice>(
                          hint: loading ? 'Loading...' : 'Smoking',
                          value: _smoking,
                          items: options,
                          labelBuilder: (c) => c.name,
                          loading: loading,
                          onChanged: (v) => setState(() => _smoking = v),
                        );
                      },
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Drinking'),
                    SizedBox(height: 8.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final options = provider.choicesModel?.choices ?? [];
                        final loading = provider.loaderState == LoaderState.loading &&
                            provider.choicesModel == null;
                        return _buildDropdownField<Choice>(
                          hint: loading ? 'Loading...' : 'Drinking',
                          value: _drinking,
                          items: options,
                          labelBuilder: (c) => c.name,
                          loading: loading,
                          onChanged: (v) => setState(() => _drinking = v),
                        );
                      },
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Do you have any pets?'),
                    SizedBox(height: 10.h),
                    _buildChipSelector<String>(
                      options: const ['No', 'Yes'],
                      selected: _pets,
                      labelBuilder: (s) => s,
                      onSelect: (v) => setState(() => _pets = v ?? 'No'),
                    ),

                    SizedBox(height: 12.h),
                    // Center(
                    //   child: Text(
                    //     'You can edit your profile anytime from your dashboard',
                    //     textAlign: TextAlign.center,
                    //     style: GoogleFonts.tasaOrbiter(fontSize: 10.sp, color: _Palette.hintText),
                    //   ),
                    // ),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
            _buildBottomArea(),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Top bar: back button + progress track
  // ---------------------------------------------------------------------
  Widget _buildTopBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 36.w,
              height: 36.w,
              decoration: const BoxDecoration(
                color: _Palette.fieldBg,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_back_rounded, color: _Palette.ink, size: 18.sp),
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: LinearProgressIndicator(
                // ... Community & Location → Professional Details → Personal & Physical (6th)
                value: 5 / 8,
                minHeight: 6.h,
                backgroundColor: _Palette.trackBg,
                valueColor: const AlwaysStoppedAnimation<Color>(_Palette.coral),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Single-select chip row (Marital Status / Surgery / Pets)
  // ---------------------------------------------------------------------
  Widget _buildChipSelector<T>({
    required List<T> options,
    required T? selected,
    required String Function(T) labelBuilder,
    required ValueChanged<T?> onSelect,
  }) {
    return Wrap(
      spacing: 10.w,
      runSpacing: 10.h,
      children: options.map((option) {
        final bool isSelected = selected == option;
        return GestureDetector(
          onTap: () => onSelect(option),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
            decoration: BoxDecoration(
              color: isSelected ? _Palette.coral : _Palette.fieldBg,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(
                color: isSelected ? _Palette.coral : Colors.transparent,
                width: 1.2,
              ),
            ),
            child: Text(
              labelBuilder(option),
              style: GoogleFonts.tasaOrbiter(
                fontSize: 10.5.sp,
                fontWeight: FontWeight.w600,
                color: isSelected ? _Palette.subtleWhite : _Palette.ink,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // ---------------------------------------------------------------------
  // Counter field (- value +)
  // ---------------------------------------------------------------------
  Widget _buildCounterField({
    required int value,
    required VoidCallback onDecrement,
    required VoidCallback onIncrement,
  }) {
    Widget counterBtn(IconData icon, VoidCallback onTap) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 40.w,
          height: 40.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _Palette.fieldBg,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(icon, color: _Palette.ink, size: 18.sp),
        ),
      );
    }

    return Row(
      children: [
        counterBtn(Icons.remove_rounded, onDecrement),
        SizedBox(width: 12.w),
        Text(
          '$value',
          style: GoogleFonts.tasaOrbiter(fontSize: 16.sp, fontWeight: FontWeight.w700, color: _Palette.ink),
        ),
        SizedBox(width: 12.w),
        counterBtn(Icons.add_rounded, onIncrement),
      ],
    );
  }

  // ---------------------------------------------------------------------
  // Text area field with character counter
  // ---------------------------------------------------------------------
  Widget _buildTextAreaField({
    required TextEditingController controller,
    required String hint,
    required int maxLength,
    required int count,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: _Palette.fieldBg,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: TextFormField(
        controller: controller,
        maxLines: 3,
        maxLength: maxLength,
        onChanged: onChanged,
        style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: _Palette.ink, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: _Palette.hintText, fontWeight: FontWeight.w400),
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
          counterText: '$count/$maxLength',
          counterStyle: GoogleFonts.tasaOrbiter(fontSize: 10.sp, color: _Palette.hintText),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Dropdown field
  // ---------------------------------------------------------------------
  Widget _buildDropdownField<T>({
    required String hint,
    required T? value,
    required List<T> items,
    required String Function(T) labelBuilder,
    required ValueChanged<T?> onChanged,
    bool enabled = true,
    bool loading = false,
  }) {
    return Container(
      constraints: BoxConstraints(minHeight: 44.h),
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: _Palette.fieldBg,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: loading
          ? Row(
              children: [
                SizedBox(
                  width: 14.w,
                  height: 14.w,
                  child: CircularProgressIndicator(strokeWidth: 2, color: _Palette.coral),
                ),
                SizedBox(width: 10.w),
                Text(
                  hint,
                  style: GoogleFonts.tasaOrbiter(
                      fontSize: 13.sp, color: _Palette.hintText, fontWeight: FontWeight.w400),
                ),
              ],
            )
          : DropdownButtonHideUnderline(
              child: DropdownButtonFormField<T>(
                initialValue: items.contains(value) ? value : null,
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down_rounded, color: _Palette.ink, size: 22.sp),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                ),
                hint: Text(
                  hint,
                  style: GoogleFonts.tasaOrbiter(
                      fontSize: 13.sp, color: _Palette.hintText, fontWeight: FontWeight.w400),
                ),
                style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: _Palette.ink, fontWeight: FontWeight.w500),
                dropdownColor: _Palette.subtleWhite,
                borderRadius: BorderRadius.circular(14.r),
                items: items
                    .map((item) => DropdownMenuItem<T>(
                          value: item,
                          child: Text(labelBuilder(item), overflow: TextOverflow.ellipsis),
                        ))
                    .toList(),
                onChanged: enabled ? onChanged : null,
              ),
            ),
    );
  }

  // ---------------------------------------------------------------------
  // Snackbar helper
  // ---------------------------------------------------------------------
  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: GoogleFonts.tasaOrbiter(color: _Palette.subtleWhite)),
        backgroundColor: _Palette.ink,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Bottom area: Continue (filled, coral once valid/grey otherwise) +
  // Submit (outlined coral — finishes the profile now, skipping the
  // remaining steps).
  // ---------------------------------------------------------------------
  Widget _buildBottomArea() {
    final bool busy = _isSubmitting || _isSubmittingProfile;
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 20.h),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 40.h,
              child: ElevatedButton(
                onPressed: busy ? null : _handleContinue,
                style: ElevatedButton.styleFrom(
                  // backgroundColor: _isFormValid ? _Palette.coral : _Palette.grey,
                  // disabledBackgroundColor:
                  //     (_isFormValid ? _Palette.coral : _Palette.grey).withOpacity(0.6),
                  // foregroundColor: _Palette.subtleWhite,
                  backgroundColor: _Palette.coral,
                  disabledBackgroundColor: _Palette.coral,
                  foregroundColor: _Palette.subtleWhite,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                ),
                child: _isSubmitting
                    ? SizedBox(
                        width: 22.w,
                        height: 22.w,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2.4,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            _Palette.subtleWhite,
                          ),
                        ),
                      )
                    : Text(
                        'Continue',
                        style: GoogleFonts.tasaOrbiter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.1,
                        ),
                      ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: SizedBox(
              height: 40.h,
              child: OutlinedButton(
                onPressed: busy ? null : _handleSubmit,
                style: OutlinedButton.styleFrom(
                  foregroundColor: _Palette.coral,
                  disabledForegroundColor: _Palette.coral.withOpacity(0.6),
                  side: BorderSide(color: _Palette.coral, width: 1.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                ),
                child: _isSubmittingProfile
                    ? SizedBox(
                        width: 22.w,
                        height: 22.w,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.4,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            _Palette.coral,
                          ),
                        ),
                      )
                    : Text(
                        'Submit',
                        style: GoogleFonts.tasaOrbiter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.1,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Small reusable field label used above every input on this screen.
class _FieldLabel extends StatelessWidget {
  final String text;
  final bool required;
  const _FieldLabel(this.text, {this.required = false});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: GoogleFonts.tasaOrbiter(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
          color: _Palette.ink,
        ),
        children: required
            ? [
                TextSpan(
                  text: ' *',
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ]
            : null,
      ),
    );
  }
}







