// // ═══════════════════════════════════════════════════════════════
// //  3b. COMMUNITY & LOCATION
// // ═══════════════════════════════════════════════════════════════

// import 'package:flutter/material.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// import 'package:matrimony_app/view/custom_widgets/dropdown.dart';
// import 'package:matrimony_app/view/custom_widgets/field.dart';
// import 'package:matrimony_app/view/custom_widgets/field_warp.dart';
// import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
// import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
// import 'package:matrimony_app/view/custom_widgets/progress_indicator.dart';
// import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
// import 'package:matrimony_app/view/custom_widgets/section_header.dart';
// import 'package:matrimony_app/view/custom_widgets/top_bar.dart';
// import 'package:matrimony_app/view/professional_details_screen.dart';


// class CommunityLocationScreen extends StatefulWidget {
//   const CommunityLocationScreen({super.key});

//   @override
//   State<CommunityLocationScreen> createState() =>
//       _CommunityLocationState();
// }

// class _CommunityLocationState extends State<CommunityLocationScreen> {
//   //int _ancestorCount = 0;

//   final _homeAddressCtrl = TextEditingController();
//   final _homePinCtrl = TextEditingController();

//   bool _sameAsAbove = false;
//   final _currentAddressCtrl = TextEditingController();
//   final _currentPinCtrl = TextEditingController();

//   @override
//   void dispose() {
//     _homeAddressCtrl.dispose();
//     _homePinCtrl.dispose();
//     _currentAddressCtrl.dispose();
//     _currentPinCtrl.dispose();
//     super.dispose();
//   }

//   void _toggleSameAsAbove(bool? value) {
//     setState(() {
//       _sameAsAbove = value ?? false;
//       if (_sameAsAbove) {
//         _currentAddressCtrl.text = _homeAddressCtrl.text;
//         _currentPinCtrl.text = _homePinCtrl.text;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlushScaffold(
//       child: Column(
//         children: [
//           TopBar(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: StepBar(current: 2, total: 8),
//           ),
//           const SizedBox(height: 14),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SectionHeader(
//                     tag: 'STEP 2 OF 8',
//                     title: 'Community & Location',
//                     subtitle: 'Tell us about your roots and where you live',
//                   ),
//                   const SizedBox(height: 20),
//                   FloatingCard(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Religion + Caste
//                         Row(children: [
//                           Expanded(
//                             child: FieldWrap('Religion',
//                                 required: true,
//                                 child: Drop(hint: 'Hindu', items: const [
//                                   'Hindu', 'Muslim', 'Christian',
//                                   'Sikh', 'Jain', 'Buddhist', 'Other'
//                                 ])),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: FieldWrap('Caste',
//                                 required: true,
//                                 child: Drop(
//                                     hint: 'Select Caste',
//                                     items: const [
//                                       'Nair', 'Ezhava', 'Brahmin',
//                                       'Kshatriya', 'Other'
//                                     ])),
//                           ),
//                         ]),
//                         const SizedBox(height: 14),

//                         // Other castes
//                         FieldWrap(
//                           'Looking for matches from other castes?',
//                           child: Drop(hint: 'No', items: const ['No', 'Yes']),
//                         ),
//                         const SizedBox(height: 14),

//                         // SubCaste + Gotra
//                         Row(children: [
//                           Expanded(
//                             child: FieldWrap('SubCaste',
//                                 child: Drop(
//                                     hint: 'Select an Option',
//                                     items: const ['Select an Option', 'N/A'])),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: FieldWrap('Gotra',
//                                 child: Drop(
//                                     hint: "Don't Know",
//                                     items: const ["Don't Know", 'N/A'])),
//                           ),
//                         ]),
//                         const SizedBox(height: 14),

//                         // Native Place
//                         FieldWrap('Native Place / Ancestral Origin',
//                             required: true,
//                             child: Column(children: [
//                               Row(children: [
//                                 Expanded(
//                                     child: Drop(hint: 'India', items: const ['India', 'Other'])),
//                                 const SizedBox(width: 8),
//                                 Expanded(
//                                     child: Drop(hint: 'Kerala', items: const [
//                                       'Kerala', 'Tamil Nadu', 'Karnataka',
//                                       'Maharashtra', 'Delhi'
//                                     ])),
//                                 const SizedBox(width: 8),
//                                 Expanded(
//                                     child: Drop(hint: 'Select District', items: const [
//                                       'Thrissur', 'Ernakulam',
//                                       'Thiruvananthapuram', 'Kozhikode'
//                                     ])),
//                               ]),
//                               // const SizedBox(height: 8),
//                               // TextField(
//                               //   maxLines: 3,
//                               //   maxLength: 255,
//                               //   style: const TextStyle(
//                               //       fontSize: 13, color: AppColors.kDarkSlate),
//                               //   onChanged: (v) => setState(
//                               //       () => _ancestorCount = v.length),
//                               //   decoration: InputDecoration(
//                               //     hintText: 'Tell about your ancestral origin',
//                               //     hintStyle: const TextStyle(
//                               //         color: AppColors.kTextMuted, fontSize: 12),
//                               //     contentPadding: const EdgeInsets.all(12),
//                               //     filled: true,
//                               //     fillColor: AppColors.kCardBg,
//                               //     counterText: '${_ancestorCount}/255',
//                               //     counterStyle: const TextStyle(
//                               //         fontSize: 10, color: AppColors.kTextMuted),
//                               //     border: OutlineInputBorder(
//                               //         borderRadius: BorderRadius.circular(12),
//                               //         borderSide:
//                               //             const BorderSide(color: AppColors.kBorder)),
//                               //     enabledBorder: OutlineInputBorder(
//                               //         borderRadius: BorderRadius.circular(12),
//                               //         borderSide:
//                               //             const BorderSide(color: AppColors.kBorder)),
//                               //     focusedBorder: OutlineInputBorder(
//                               //         borderRadius: BorderRadius.circular(12),
//                               //         borderSide: const BorderSide(
//                               //             color: AppColors.kAccent, width: 1.5)),
//                               //   ),
//                               // ),
//                             ])),
//                         const SizedBox(height: 14),

//                         // Permanent Residence
//                         FieldWrap('Permanent Residence',
//                             required: true,
//                             child: Column(children: [
//                               Row(children: [
//                                 Expanded(
//                                     child: Drop(hint: 'India', items: const ['India', 'Other'])),
//                                 const SizedBox(width: 8),
//                                 Expanded(
//                                     child: Drop(hint: 'Kerala', items: const [
//                                       'Kerala', 'Tamil Nadu', 'Karnataka'
//                                     ])),
//                               ]),
//                               const SizedBox(height: 8),
//                               Row(children: [
//                                 Expanded(
//                                     child: Drop(hint: 'Select District', items: const [
//                                       'Thrissur', 'Ernakulam', 'Kozhikode'
//                                     ])),
//                                 const SizedBox(width: 8),
//                                 Expanded(
//                                     child: Field(
//                                         hint: 'PIN/Zip Code',
//                                         controller: _homePinCtrl,
//                                         keyboardType: TextInputType.number)),
//                               ]),
//                             ])),
//                         const SizedBox(height: 14),

//                         // Home Address
//                         FieldWrap('Home Address',
//                             required: true,
//                             child: Field(
//                                 hint: 'Enter home address',
//                                 controller: _homeAddressCtrl)),
//                         const SizedBox(height: 18),

//                         // Same as above checkbox
//                         Row(children: [
//                           const Text('Home Address',
//                               style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w600,
//                                   color: AppColors.kSlate)),
//                           const Text(' *',
//                               style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.red)),
//                           const SizedBox(width: 16),
//                           SizedBox(
//                             height: 20,
//                             width: 20,
//                             child: Checkbox(
//                               value: _sameAsAbove,
//                               activeColor: AppColors.kAccent,
//                               materialTapTargetSize:
//                                   MaterialTapTargetSize.shrinkWrap,
//                               onChanged: _toggleSameAsAbove,
//                             ),
//                           ),
//                           const SizedBox(width: 6),
//                           const Text('Same as above',
//                               style: TextStyle(
//                                   fontSize: 13, color: AppColors.kSlate)),
//                         ]),
//                         const SizedBox(height: 14),

//                         // Current Residence
//                         FieldWrap('Current Residence',
//                             child: IgnorePointer(
//                               ignoring: _sameAsAbove,
//                               child: Opacity(
//                                 opacity: _sameAsAbove ? 0.5 : 1.0,
//                                 child: Column(children: [
//                                   Row(children: [
//                                     Expanded(
//                                         child: Drop(hint: 'India', items: const ['India', 'Other'])),
//                                     const SizedBox(width: 8),
//                                     Expanded(
//                                         child: Drop(hint: 'Kerala', items: const [
//                                           'Kerala', 'Tamil Nadu', 'Karnataka'
//                                         ])),
//                                   ]),
//                                   const SizedBox(height: 8),
//                                   Row(children: [
//                                     Expanded(
//                                         child: Drop(hint: 'Select District', items: const [
//                                           'Thrissur', 'Ernakulam', 'Kozhikode'
//                                         ])),
//                                     const SizedBox(width: 8),
//                                     Expanded(
//                                         child: Field(
//                                             hint: 'PIN/Zip Code',
//                                             controller: _currentPinCtrl,
//                                             keyboardType: TextInputType.number)),
//                                   ]),
//                                   const SizedBox(height: 8),
//                                   Field(
//                                     hint: 'Enter current address',
//                                     controller: _currentAddressCtrl,
//                                   ),
//                                 ]),
//                               ),
//                             )),
//                         const SizedBox(height: 22),

//                         CTAButton(
//                           label: 'Continue →',
//                           onTap: () => Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) =>
//                                     const ProfessionalDetailsScreen()),
//                           ),
//                         ),
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
//  3b. COMMUNITY & LOCATION
// ═══════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/view/professional_details_screen.dart';

/// Brand colors used on this screen — mirrors BasicInfoScreen's palette.
class _Palette {
  _Palette._();
  static const Color coral = Color(0xFFFF3356);
  static const Color ink = Color(0xFF1A1A1A);
  static const Color subtleWhite = Color(0xFFFFFFFF);

  static const Color fieldBg = Color(0xFFF5F5F7);
  static const Color hintText = Color(0xFF8A8A8E);
  static const Color trackBg = Color(0xFFECECEE);
  static const Color error = Color(0xFFE53935);
  static const Color grey = Color(0xFFBDBDBD);
}

class CommunityLocationScreen extends StatefulWidget {
  const CommunityLocationScreen({super.key});

  @override
  State<CommunityLocationScreen> createState() => _CommunityLocationState();
}

class _CommunityLocationState extends State<CommunityLocationScreen> {
  //int _ancestorCount = 0;

  final _homeAddressCtrl = TextEditingController();
  final _homePinCtrl = TextEditingController();

  bool _sameAsAbove = false;
  final _currentAddressCtrl = TextEditingController();
  final _currentPinCtrl = TextEditingController();
  bool _isSubmitting = false;

  String? _religion;
  String? _caste;
  String? _otherCastes;
  String? _subCaste;
  String? _gotra;

  String? _nativeCountry;
  String? _nativeState;
  String? _nativeDistrict;

  String? _permanentCountry;
  String? _permanentState;
  String? _permanentDistrict;

  String? _currentCountry;
  String? _currentState;
  String? _currentDistrict;

  String? _homeAddressError;

  @override
  void dispose() {
    _homeAddressCtrl.dispose();
    _homePinCtrl.dispose();
    _currentAddressCtrl.dispose();
    _currentPinCtrl.dispose();
    super.dispose();
  }

  void _toggleSameAsAbove(bool? value) {
    setState(() {
      _sameAsAbove = value ?? false;
      if (_sameAsAbove) {
        _currentAddressCtrl.text = _homeAddressCtrl.text;
        _currentPinCtrl.text = _homePinCtrl.text;
        _currentCountry = _nativeCountry;
        _currentState = _nativeState;
        _currentDistrict = _nativeDistrict;
      }
    });
  }

  // Required fields: Religion, Caste, Native Place, Permanent Residence, Home Address.
  bool get _isFormValid =>
      _religion != null &&
      _caste != null &&
      _nativeCountry != null &&
      _nativeState != null &&
      _nativeDistrict != null &&
      _permanentCountry != null &&
      _permanentState != null &&
      _permanentDistrict != null &&
      _homePinCtrl.text.trim().isNotEmpty &&
      _homeAddressCtrl.text.trim().isNotEmpty;

  void _handleContinue() {
    FocusScope.of(context).unfocus();

    setState(() {
      //_homeAddressError = _homeAddressCtrl.text.trim().isEmpty ? 'Please enter home address' : null;
    });

    // if (_religion == null) return _showSnack('Please select religion');
    // if (_caste == null) return _showSnack('Please select caste');
    // if (_nativeCountry == null || _nativeState == null || _nativeDistrict == null) {
    //   return _showSnack('Please complete native place / ancestral origin');
    // }
    // if (_permanentCountry == null || _permanentState == null || _permanentDistrict == null) {
    //   return _showSnack('Please complete permanent residence');
    // }
    // if (_homePinCtrl.text.trim().isEmpty) return _showSnack('Please enter PIN/Zip code');
    // if (_homeAddressError != null) return;

    setState(() => _isSubmitting = true);

    // TODO: wire up actual save/continue API call here.
    Future.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ProfessionalDetailsScreen()),
      );
    });
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
                      'Community & Location',
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w800,
                        color: _Palette.ink,
                        letterSpacing: -0.6,
                        height: 1.25,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'Tell us about your roots and where you live',
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: _Palette.hintText,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    _FieldLabel('Religion'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Select Religion',
                      value: _religion,
                      items: const ['Hindu', 'Muslim', 'Christian', 'Sikh', 'Jain', 'Buddhist', 'Other'],
                      onChanged: (v) => setState(() => _religion = v),
                    ),
                    

                    SizedBox(height: 20.h),
                    _FieldLabel('Caste'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Select Caste',
                      value: _caste,
                      items: const ['Nair', 'Ezhava', 'Brahmin', 'Kshatriya', 'Other'],
                      onChanged: (v) => setState(() => _caste = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Looking for matches from other castes ( other than own sub castes )?'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'No',
                      value: _otherCastes,
                      items: const ['No', 'Yes'],
                      onChanged: (v) => setState(() => _otherCastes = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('SubCaste'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Select an Option',
                      value: _subCaste,
                      items: const ['Select an Option', 'N/A'],
                      onChanged: (v) => setState(() => _subCaste = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Gotra'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: "Don't Know",
                      value: _gotra,
                      items: const ["Don't Know", 'N/A'],
                      onChanged: (v) => setState(() => _gotra = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Native Place / Ancestral Origin'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Country',
                      value: _nativeCountry,
                      items: const ['India', 'Other'],
                      onChanged: (v) => setState(() => _nativeCountry = v),
                    ),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'State',
                      value: _nativeState,
                      items: const ['Kerala', 'Tamil Nadu', 'Karnataka', 'Maharashtra', 'Delhi'],
                      onChanged: (v) => setState(() => _nativeState = v),
                    ),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'District',
                      value: _nativeDistrict,
                      items: const ['Thrissur', 'Ernakulam', 'Thiruvananthapuram', 'Kozhikode'],
                      onChanged: (v) => setState(() => _nativeDistrict = v),
                    ),
                    // const SizedBox(height: 8),
                    // TextField(
                    //   maxLines: 3,
                    //   maxLength: 255,
                    //   style: const TextStyle(
                    //       fontSize: 13, color: AppColors.kDarkSlate),
                    //   onChanged: (v) => setState(
                    //       () => _ancestorCount = v.length),
                    //   decoration: InputDecoration(
                    //     hintText: 'Tell about your ancestral origin',
                    //     hintStyle: const TextStyle(
                    //         color: AppColors.kTextMuted, fontSize: 12),
                    //     contentPadding: const EdgeInsets.all(12),
                    //     filled: true,
                    //     fillColor: AppColors.kCardBg,
                    //     counterText: '${_ancestorCount}/255',
                    //     counterStyle: const TextStyle(
                    //         fontSize: 10, color: AppColors.kTextMuted),
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(12),
                    //         borderSide:
                    //             const BorderSide(color: AppColors.kBorder)),
                    //     enabledBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(12),
                    //         borderSide:
                    //             const BorderSide(color: AppColors.kBorder)),
                    //     focusedBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(12),
                    //         borderSide: const BorderSide(
                    //             color: AppColors.kAccent, width: 1.5)),
                    //   ),
                    // ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Permanent Residence'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Country',
                      value: _permanentCountry,
                      items: const ['India', 'Other'],
                      onChanged: (v) => setState(() => _permanentCountry = v),
                    ),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'State',
                      value: _permanentState,
                      items: const ['Kerala', 'Tamil Nadu', 'Karnataka'],
                      onChanged: (v) => setState(() => _permanentState = v),
                    ),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'District',
                      value: _permanentDistrict,
                      items: const ['Thrissur', 'Ernakulam', 'Kozhikode'],
                      onChanged: (v) => setState(() => _permanentDistrict = v),
                    ),
                    SizedBox(height: 8.h),
                    _buildTextField(
                      controller: _homePinCtrl,
                      hint: 'PIN/Zip Code',
                      keyboardType: TextInputType.number,
                      onChanged: (_) => setState(() {}),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Home Address'),
                    SizedBox(height: 8.h),
                    _buildTextField(
                      controller: _homeAddressCtrl,
                      hint: 'Enter home address',
                      errorText: _homeAddressError,
                      onChanged: (_) {
                        setState(() {
                          if (_homeAddressError != null) _homeAddressError = null;
                        });
                      },
                    ),

                    SizedBox(height: 18.h),
                    Row(
                      children: [
                        SizedBox(
                          height: 20.h,
                          width: 20.h,
                          child: Checkbox(
                            value: _sameAsAbove,
                            activeColor: _Palette.coral,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            onChanged: _toggleSameAsAbove,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Current address same as above',
                          style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: _Palette.ink),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),

                    _FieldLabel('Current Residence'),
                    SizedBox(height: 8.h),
                    IgnorePointer(
                      ignoring: _sameAsAbove,
                      child: Opacity(
                        opacity: _sameAsAbove ? 0.5 : 1.0,
                        child: Column(
                          children: [
                            _buildDropdownField(
                              hint: 'Country',
                              value: _currentCountry,
                              items: const ['India', 'Other'],
                              onChanged: (v) => setState(() => _currentCountry = v),
                            ),
                            SizedBox(height: 8.h),
                            _buildDropdownField(
                              hint: 'State',
                              value: _currentState,
                              items: const ['Kerala', 'Tamil Nadu', 'Karnataka'],
                              onChanged: (v) => setState(() => _currentState = v),
                            ),
                            SizedBox(height: 8.h),
                            _buildDropdownField(
                              hint: 'District',
                              value: _currentDistrict,
                              items: const ['Thrissur', 'Ernakulam', 'Kozhikode'],
                              onChanged: (v) => setState(() => _currentDistrict = v),
                            ),
                            SizedBox(height: 8.h),
                            _buildTextField(
                              controller: _currentPinCtrl,
                              hint: 'PIN/Zip Code',
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 8.h),
                            _buildTextField(
                              controller: _currentAddressCtrl,
                              hint: 'Enter current address',
                            ),
                          ],
                        ),
                      ),
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
                // Initial Info → OTP Verify → Basic Info → Community & Location (4th)
                value: 3 / 8,
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
  // Text field
  // ---------------------------------------------------------------------
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    String? errorText,
    ValueChanged<String>? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 44.h,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: _Palette.fieldBg,
            borderRadius: BorderRadius.circular(14.r),
            border: errorText != null ? Border.all(color: _Palette.error, width: 1.2) : null,
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            onChanged: onChanged,
            style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: _Palette.ink, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: _Palette.hintText, fontWeight: FontWeight.w400),
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              isDense: true,
              isCollapsed: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
            ),
          ),
        ),
        if (errorText != null) ...[
          SizedBox(height: 6.h),
          Text(
            errorText,
            style: GoogleFonts.tasaOrbiter(fontSize: 11.sp, color: _Palette.error, fontWeight: FontWeight.w500),
          ),
        ],
      ],
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
  // Bottom area: Continue button (coral once the form is valid, grey otherwise)
  // ---------------------------------------------------------------------
  Widget _buildBottomArea() {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 20.h),
      child: SizedBox(
        width: double.infinity,
        height: 40.h,
        child: ElevatedButton(
          onPressed: _isSubmitting ? null : _handleContinue,
          style: ElevatedButton.styleFrom(
            backgroundColor: _isFormValid ? _Palette.coral : _Palette.grey,
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

