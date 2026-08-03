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
  String _marital = 'Unmarried';
  String _surgery = 'No';
  String _pets = 'No';
  int _children = 0;
  int _descCount = 0;

  final _descriptionCtrl = TextEditingController();

  String? _height;
  String? _weight;
  String? _skinColor;
  String? _bodyType;
  String? _bloodGroup;
  String? _disability;
  String? _diet;
  String? _smoking;
  String? _drinking;

  bool _isSubmitting = false;
  bool _isSubmittingProfile = false;

  @override
  void dispose() {
    _descriptionCtrl.dispose();
    super.dispose();
  }

  // Required fields: Height, Weight, Skin Color, Body Type, Blood Group.
  // (Marital Status/Surgery/Pets already default to a value so they don't
  // need to gate the button.)
  bool get _isFormValid =>
      _height != null &&
      _weight != null &&
      _skinColor != null &&
      _bodyType != null &&
      _bloodGroup != null;

  void _handleContinue() {
    FocusScope.of(context).unfocus();

    setState(() => _isSubmitting = true);

    // TODO: wire up actual save/continue API call here.
    Future.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const PhotosAboutScreen()),
      );
    });
  }

  // Submits the profile now with whatever's filled so far, skipping the
  // remaining onboarding steps (Family Details / Photos), straight to the
  // app's main screen.
  void _handleSubmit() {
    FocusScope.of(context).unfocus();

    setState(() => _isSubmittingProfile = true);

    // TODO: wire up actual submit-profile API call here.
    Future.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;
      setState(() => _isSubmittingProfile = false);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const MainShell()),
        (route) => false,
      );
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
                    _buildChipSelector(
                      options: const ['Unmarried', 'Divorced', 'Widow/er', 'Awaiting Divorcee', 'Annulled'],
                      selected: _marital,
                      onSelect: (v) => setState(() => _marital = v),
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
                    _buildDropdownField(
                      hint: 'Height (cm)',
                      value: _height,
                      items: const ['150', '155', '160', '165', '170', '175', '180', '185', '190'],
                      onChanged: (v) => setState(() => _height = v),
                    ),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Weight (Kg)',
                      value: _weight,
                      items: const ['45', '50', '55', '60', '65', '70', '75', '80', '85', '90+'],
                      onChanged: (v) => setState(() => _weight = v),
                    ),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Skin Color',
                      value: _skinColor,
                      items: const ['Fair', 'Wheatish', 'Dusky', 'Dark'],
                      onChanged: (v) => setState(() => _skinColor = v),
                    ),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Body Type',
                      value: _bodyType,
                      items: const ['Slim', 'Athletic', 'Average', 'Heavy'],
                      onChanged: (v) => setState(() => _bodyType = v),
                    ),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Blood Group',
                      value: _bloodGroup,
                      items: const ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'],
                      onChanged: (v) => setState(() => _bloodGroup = v),
                    ),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Any disability',
                      value: _disability,
                      items: const ['No', 'Yes'],
                      onChanged: (v) => setState(() => _disability = v),
                    ),
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
                    _buildChipSelector(
                      options: const ['No', 'Yes'],
                      selected: _surgery,
                      onSelect: (v) => setState(() => _surgery = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Diet'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Diet',
                      value: _diet,
                      items: const ['Vegetarian', 'Non-Vegetarian', 'Vegan', 'Jain'],
                      onChanged: (v) => setState(() => _diet = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Smoking'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Smoking',
                      value: _smoking,
                      items: const ['No', 'Occasionally', 'Yes'],
                      onChanged: (v) => setState(() => _smoking = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Drinking'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Drinking',
                      value: _drinking,
                      items: const ['No', 'Occasionally', 'Yes'],
                      onChanged: (v) => setState(() => _drinking = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Do you have any pets?'),
                    SizedBox(height: 10.h),
                    _buildChipSelector(
                      options: const ['No', 'Yes'],
                      selected: _pets,
                      onSelect: (v) => setState(() => _pets = v),
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
  Widget _buildChipSelector({
    required List<String> options,
    required String selected,
    required ValueChanged<String> onSelect,
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
              option,
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
  Widget _buildDropdownField({
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      constraints: BoxConstraints(minHeight: 44.h),
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: _Palette.fieldBg,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          initialValue: value,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: _Palette.ink, size: 22.sp),
          decoration: InputDecoration(
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 10.h),
          ),
          hint: Text(
            hint,
            style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: _Palette.hintText, fontWeight: FontWeight.w400),
          ),
          style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: _Palette.ink, fontWeight: FontWeight.w500),
          dropdownColor: _Palette.subtleWhite,
          borderRadius: BorderRadius.circular(14.r),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: onChanged,
        ),
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
                  backgroundColor: _isFormValid ? _Palette.coral : _Palette.grey,
                  disabledBackgroundColor:
                      (_isFormValid ? _Palette.coral : _Palette.grey).withOpacity(0.6),
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
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.tasaOrbiter(
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
        color: _Palette.ink,
      ),
    );
  }
}







