// import 'package:flutter/material.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// import 'package:matrimony_app/view/custom_widgets/counter_box.dart';
// import 'package:matrimony_app/view/custom_widgets/counter_button.dart';
// import 'package:matrimony_app/view/custom_widgets/dropdown.dart';
// import 'package:matrimony_app/view/custom_widgets/field.dart';
// import 'package:matrimony_app/view/custom_widgets/field_warp.dart';
// import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
// import 'package:matrimony_app/view/custom_widgets/messenger_checkbox_screen.dart';
// import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
// import 'package:matrimony_app/view/custom_widgets/progress_indicator.dart';
// import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
// import 'package:matrimony_app/view/custom_widgets/section_header.dart';
// import 'package:matrimony_app/view/custom_widgets/top_bar.dart';
// import 'package:matrimony_app/view/photos_about_screen.dart';

// class FamilyDetailsScreen extends StatefulWidget {
//   const FamilyDetailsScreen({super.key});

//   @override
//   State<FamilyDetailsScreen> createState() => _FamilyDetailsState();
// }

// class _FamilyDetailsState extends State<FamilyDetailsScreen> {
//   int _brothers        = 0;
//   int _brothersMarried = 0;
//   int _sisters         = 0;
//   int _sistersMarried  = 0;

//   bool _whatsapp  = false;
//   bool _telegram  = false;

//   final _contactCtrl = TextEditingController();

//   @override
//   void dispose() {
//     _contactCtrl.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlushScaffold(
//       child: Column(
//         children: [
//           TopBar(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: StepBar(current: 5, total: 8),
//           ),
//           const SizedBox(height: 14),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               physics: const BouncingScrollPhysics(),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SectionHeader(
//                     tag: 'STEP 5 OF 8',
//                     title: 'Family Details',
//                     subtitle: 'Tell us about your family background',
//                   ),
//                   const SizedBox(height: 20),
//                   FloatingCard(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [

//                         // ── Row 1: Family Class + Family Type ──
//                         Row(children: [
//                           Expanded(
//                             child: FieldWrap('Family Class',
//                                 required: true,
//                                 child: Drop(
//                                     hint: 'Select',
//                                     items: const [
//                                       'Middle Class',
//                                       'Upper Middle Class',
//                                       'Rich / Affluent',
//                                       'Higher Class',
//                                     ])),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: FieldWrap('Family Type',
//                                 required: true,
//                                 child: Drop(
//                                     hint: 'Select',
//                                     items: const [
//                                       'Nuclear Family',
//                                       'Joint Family',
//                                       'Extended Family',
//                                     ])),
//                           ),
//                         ]),
//                         const SizedBox(height: 14),

//                         // ── Row 2: Family Values + No. of Family Members ──
//                         Row(children: [
//                           Expanded(
//                             child: FieldWrap('Family Values',
//                                 child: Drop(
//                                     hint: 'Select',
//                                     items: const [
//                                       'Traditional',
//                                       'Moderate',
//                                       'Liberal',
//                                     ])),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: FieldWrap('No. of Members',
//                                 child: Drop(
//                                     hint: 'Select',
//                                     items: List.generate(
//                                         10, (i) => '${i + 1}'))),
//                           ),
//                         ]),
//                         const SizedBox(height: 14),

//                         // ── Siblings counter row ──
//                         const Text('Siblings',
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColors.kSlate)),
//                         const SizedBox(height: 10),

//                         // Brothers
//                         Row(children: [
//                           const Text('Brother',
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   color: AppColors.kTextMuted)),
//                           const Spacer(),
//                           CountBtn('-', () => setState(() { if (_brothers > 0) _brothers--; })),
//                           CounterBox(_brothers),
//                           CountBtn('+', () => setState(() => _brothers++)),
//                         ]),
//                         const SizedBox(width: 12),
//                         Row(children: [
//                           const Text('Married Bother',
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   color: AppColors.kTextMuted)),
//                           const Spacer(),
//                           CountBtn('-', () => setState(() { if (_brothersMarried > 0) _brothersMarried--; })),
//                           CounterBox(_brothersMarried),
//                           CountBtn('+', () => setState(() => _brothersMarried++)),
//                         ]),
//                         const SizedBox(height: 10),

//                         // Sisters
//                         Row(children: [
//                           const Text('Sister',
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   color: AppColors.kTextMuted)),
//                           const Spacer(),
//                           CountBtn('-', () => setState(() { if (_sisters > 0) _sisters--; })),
//                           CounterBox(_sisters),
//                           CountBtn('+', () => setState(() => _sisters++)),
//                         ]),
//                         const SizedBox(width: 12),
//                         Row(children: [
//                           const Text('Married Sister',
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   color: AppColors.kTextMuted)),
//                           const Spacer(),
//                           CountBtn('-', () => setState(() { if (_sistersMarried > 0) _sistersMarried--; })),
//                           CounterBox(_sistersMarried),
//                           CountBtn('+', () => setState(() => _sistersMarried++)),
//                         ]),
//                         const SizedBox(height: 14),

//                         // ── Row: Father's + Mother's Occupation ──
//                         Row(children: [
//                           Expanded(
//                             child: FieldWrap("Father's Occupation",
//                                 child: Drop(hint: 'Select', items: const [
//                                   'Business', 'Government/PSU',
//                                   'Private Sector', 'Retired',
//                                   'Farmer', 'Not Employed', 'Deceased',
//                                 ])),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: FieldWrap("Mother's Occupation",
//                                 child: Drop(hint: 'Select', items: const [
//                                   'Homemaker', 'Business',
//                                   'Government/PSU', 'Private Sector',
//                                   'Retired', 'Not Employed', 'Deceased',
//                                 ])),
//                           ),
//                         ]),
//                         const SizedBox(height: 14),

//                         // ── Family Income ──
//                         FieldWrap('Family Annual Income',
//                             child: Drop(hint: 'Select range', items: const [
//                               'Below 2L', '2L to 5L',
//                               '5L to 10L', '10L to 20L',
//                               '20L to 30L', '30L to 50L', '50L+',
//                             ])),
//                         const SizedBox(height: 14),

//                         // ── Contact Number ──
//                         FieldWrap('Family Contact Number',
//                             child: Row(children: [
//                               Container(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 12, vertical: 14),
//                                 decoration: BoxDecoration(
//                                   color: AppColors.kCardBg,
//                                   borderRadius: BorderRadius.circular(12),
//                                   border: Border.all(color: AppColors.kBorder),
//                                 ),
//                                 child: const Text('+91',
//                                     style: TextStyle(
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w700,
//                                         color: AppColors.kDarkSlate)),
//                               ),
//                               const SizedBox(width: 8),
//                               Expanded(
//                                 child: Field(
//                                     hint: 'Enter contact number',
//                                     controller: _contactCtrl,
//                                     keyboardType: TextInputType.phone),
//                               ),
//                             ])),
//                         const SizedBox(height: 14),

//                         // ── Active Messengers ──
//                         const Text('Active messengers on this number:',
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColors.kSlate)),
//                         const SizedBox(height: 10),
//                         Row(children: [
//                           MessengerCheck(
//                             label: 'WhatsApp',
//                             icon: Icons.chat_rounded,
//                             color: const Color(0xFF25D366),
//                             value: _whatsapp,
//                             onChanged: (v) =>
//                                 setState(() => _whatsapp = v),
//                           ),
//                           const SizedBox(width: 16),
//                           MessengerCheck(
//                             label: 'Telegram',
//                             icon: Icons.send_rounded,
//                             color: const Color(0xFF229ED9),
//                             value: _telegram,
//                             onChanged: (v) =>
//                                 setState(() => _telegram = v),
//                           ),
//                         ]),
//                         const SizedBox(height: 22),

//                         // ── Buttons ──
//                         Row(children: [
//                           Expanded(
//                             child: CTAButton(
//                               label: 'Skip',
//                               outlined: true,
//                               onTap: () => Navigator.push(context,
//                                   MaterialPageRoute(
//                                       builder: (_) =>
//                                           const PhotosAboutScreen())),
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: CTAButton(
//                               label: 'Continue →',
//                               onTap: () => Navigator.push(context,
//                                   MaterialPageRoute(
//                                       builder: (_) =>
//                                           const PhotosAboutScreen())),
//                             ),
//                           ),
//                         ]),
//                         const SizedBox(height: 10),
//                         const Center(
//                           child: Text(
//                             'In next two stages you can enter your hobbies, interests & horoscope details.',
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






import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/view/hobbies_screen.dart';
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

  String? _familyClass;
  String? _familyType;
  String? _familyValues;
  String? _memberCount;
  String? _fatherOccupation;
  String? _motherOccupation;
  String? _familyIncome;

  bool _isSubmitting = false;

  @override
  void dispose() {
    _contactCtrl.dispose();
    super.dispose();
  }

  // Required fields: Family Class, Family Type.
  bool get _isFormValid => _familyClass != null && _familyType != null;

  void _handleContinue() {
    FocusScope.of(context).unfocus();
    // if (_familyClass == null) return _showSnack('Please select family class');
    // if (_familyType == null) return _showSnack('Please select family type');

    setState(() => _isSubmitting = true);

    // TODO: wire up actual save/continue API call here.
    Future.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const HobbiesScreen()),
      );
    });
  }

  void _handleSkip() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const HobbiesScreen()),
    );
  }

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
                      'Family Details',
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
                    //   'Tell us about your family background',
                    //   style: GoogleFonts.tasaOrbiter(
                    //     fontSize: 14.sp,
                    //     fontWeight: FontWeight.w400,
                    //     color: _Palette.hintText,
                    //   ),
                    // ),
                    SizedBox(height: 20.h),

                    _FieldLabel('Family Status'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Select',
                      value: _familyClass,
                      items: const ['Middle Class', 'Upper Middle Class', 'Rich / Affluent', 'Higher Class'],
                      onChanged: (v) => setState(() => _familyClass = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Family Type'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Select',
                      value: _familyType,
                      items: const ['Nuclear Family', 'Joint Family', 'Extended Family'],
                      onChanged: (v) => setState(() => _familyType = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Family Values'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Select',
                      value: _familyValues,
                      items: const ['Traditional', 'Moderate', 'Liberal'],
                      onChanged: (v) => setState(() => _familyValues = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Total Family Members'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Select',
                      value: _memberCount,
                      items: List.generate(10, (i) => '${i + 1}'),
                      onChanged: (v) => setState(() => _memberCount = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Siblings'),
                    SizedBox(height: 10.h),
                    _buildCounterRow(
                      label: 'Brother',
                      value: _brothers,
                      onDecrement: () => setState(() {
                        if (_brothers > 0) _brothers--;
                      }),
                      onIncrement: () => setState(() => _brothers++),
                    ),
                    SizedBox(height: 10.h),
                    _buildCounterRow(
                      label: 'Married Brother',
                      value: _brothersMarried,
                      onDecrement: () => setState(() {
                        if (_brothersMarried > 0) _brothersMarried--;
                      }),
                      onIncrement: () => setState(() => _brothersMarried++),
                    ),
                    SizedBox(height: 10.h),
                    _buildCounterRow(
                      label: 'Sister',
                      value: _sisters,
                      onDecrement: () => setState(() {
                        if (_sisters > 0) _sisters--;
                      }),
                      onIncrement: () => setState(() => _sisters++),
                    ),
                    SizedBox(height: 10.h),
                    _buildCounterRow(
                      label: 'Married Sister',
                      value: _sistersMarried,
                      onDecrement: () => setState(() {
                        if (_sistersMarried > 0) _sistersMarried--;
                      }),
                      onIncrement: () => setState(() => _sistersMarried++),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel("Father's Occupation"),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Select',
                      value: _fatherOccupation,
                      items: const [
                        'Business', 'Government/PSU', 'Private Sector',
                        'Retired', 'Farmer', 'Not Employed', 'Deceased',
                      ],
                      onChanged: (v) => setState(() => _fatherOccupation = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel("Mother's Occupation"),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Select',
                      value: _motherOccupation,
                      items: const [
                        'Homemaker', 'Business', 'Government/PSU', 'Private Sector',
                        'Retired', 'Not Employed', 'Deceased',
                      ],
                      onChanged: (v) => setState(() => _motherOccupation = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Family Property Value '),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Select range',
                      value: _familyIncome,
                      items: const [
                        'Below 2L', '2L to 5L', '5L to 10L',
                        '10L to 20L', '20L to 30L', '30L to 50L', '50L+',
                      ],
                      onChanged: (v) => setState(() => _familyIncome = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Second Contact Number'),
                    SizedBox(height: 8.h),
                    _buildMobileField(),

                    SizedBox(height: 20.h),
                    // _FieldLabel('Active messengers on this number:'),
                    // SizedBox(height: 10.h),
                    // Row(
                    //   children: [
                    //     _buildMessengerChip(
                    //       label: 'WhatsApp',
                    //       icon: Icons.chat_rounded,
                    //       color: const Color(0xFF25D366),
                    //       value: _whatsapp,
                    //       onChanged: (v) => setState(() => _whatsapp = v),
                    //     ),
                    //     SizedBox(width: 12.w),
                    //     _buildMessengerChip(
                    //       label: 'Telegram',
                    //       icon: Icons.send_rounded,
                    //       color: const Color(0xFF229ED9),
                    //       value: _telegram,
                    //       onChanged: (v) => setState(() => _telegram = v),
                    //     ),
                    //   ],
                    // ),

                    //SizedBox(height: 12.h),
                    Center(
                      child: Text(
                        'In next two stages you can enter your hobbies, interests & horoscope details.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tasaOrbiter(fontSize: 10.sp, color: _Palette.hintText),
                      ),
                    ),
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
                // ... Professional Details → Personal & Physical → Family Details (7th)
                value: 6 / 8,
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
  // Sibling counter row (label + - value +)
  // ---------------------------------------------------------------------
  Widget _buildCounterRow({
    required String label,
    required int value,
    required VoidCallback onDecrement,
    required VoidCallback onIncrement,
  }) {
    Widget counterBtn(IconData icon, VoidCallback onTap) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 34.w,
          height: 34.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _Palette.fieldBg,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(icon, color: _Palette.ink, size: 16.sp),
        ),
      );
    }

    return Row(
      children: [
        Text(
          label,
          style: GoogleFonts.tasaOrbiter(fontSize: 12.sp, color: _Palette.hintText),
        ),
        const Spacer(),
        counterBtn(Icons.remove_rounded, onDecrement),
        SizedBox(width: 10.w),
        Text(
          '$value',
          style: GoogleFonts.tasaOrbiter(fontSize: 14.sp, fontWeight: FontWeight.w700, color: _Palette.ink),
        ),
        SizedBox(width: 10.w),
        counterBtn(Icons.add_rounded, onIncrement),
      ],
    );
  }

  // ---------------------------------------------------------------------
  // Mobile number field with +91 prefix
  // ---------------------------------------------------------------------
  Widget _buildMobileField() {
    return Container(
      height: 52.h,
      decoration: BoxDecoration(
        color: _Palette.fieldBg,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 18.w),
            child: Text(
              '+91',
              style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, fontWeight: FontWeight.w600, color: _Palette.ink),
            ),
          ),
          SizedBox(width: 10.w),
          Container(width: 1, height: 22.h, color: _Palette.trackBg),
          Expanded(
            child: TextFormField(
              controller: _contactCtrl,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: _Palette.ink, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                counterText: '',
                hintText: 'Enter contact number',
                hintStyle: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: _Palette.hintText, fontWeight: FontWeight.w400),
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                isDense: true,
                isCollapsed: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Messenger toggle chip (WhatsApp / Telegram)
  // ---------------------------------------------------------------------
  Widget _buildMessengerChip({
    required String label,
    required IconData icon,
    required Color color,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: value ? color.withOpacity(0.1) : _Palette.fieldBg,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: value ? color : Colors.transparent, width: 1.2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: value ? color : _Palette.hintText, size: 16.sp),
            SizedBox(width: 6.w),
            Text(
              label,
              style: GoogleFonts.tasaOrbiter(
                fontSize: 12.sp,
                fontWeight: value ? FontWeight.w700 : FontWeight.w500,
                color: value ? color : _Palette.ink,
              ),
            ),
          ],
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
      constraints: BoxConstraints(minHeight: 52.h),
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
            contentPadding: EdgeInsets.symmetric(vertical: 14.h),
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
  // Bottom area: Skip (outlined) + Continue (coral once valid, grey otherwise)
  // ---------------------------------------------------------------------
  Widget _buildBottomArea() {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 20.h),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 40.h,
              child: OutlinedButton(
                onPressed: _handleSkip,
                style: OutlinedButton.styleFrom(
                  foregroundColor: _Palette.ink,
                  side: const BorderSide(color: _Palette.trackBg, width: 1.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                ),
                child: Text(
                  'Skip',
                  style: GoogleFonts.tasaOrbiter(fontSize: 16.sp, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: SizedBox(
              height: 40.h,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _handleContinue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isFormValid ? _Palette.coral : _Palette.grey,
                  disabledBackgroundColor: _Palette.coral.withOpacity(0.6),
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