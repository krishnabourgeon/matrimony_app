// // ═══════════════════════════════════════════════════════════════
// //  3c. PROFESSIONAL DETAILS
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
// import 'package:matrimony_app/view/personal_physical_screen.dart';


// class ProfessionalDetailsScreen extends StatefulWidget {
//   const ProfessionalDetailsScreen({super.key});

//   @override
//   State<ProfessionalDetailsScreen> createState() =>
//       _ProfessionalDetailsState();
// }

// class _ProfessionalDetailsState extends State<ProfessionalDetailsScreen> {
//   final _empOptions = [
//     'Healthcare', 'Information Technology', 'Farmer', 'Defence',
//     'Government/PSU', 'Private sector', 'Business', 'Others',
//   ];
//   final Set<String> _selected = {};

//   @override
//   Widget build(BuildContext context) {
//     return BlushScaffold(
//       child: Column(
//         children: [
//           TopBar(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: StepBar(current: 3, total: 8),
//           ),
//           const SizedBox(height: 14),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SectionHeader(
//                     tag: 'STEP 3 OF 8',
//                     title: 'Professional Details',
//                     subtitle:
//                         'Helps us find you the most compatible match',
//                   ),
//                   const SizedBox(height: 20),
//                   FloatingCard(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Highest education
//                         FieldWrap('Highest Education',
//                             required: true,
//                             child: Drop(
//                                 hint: 'Select Education',
//                                 items: const [
//                                   'High School', 'Diploma', "Bachelor's",
//                                   "Master's", 'PhD', 'Other'
//                                 ])),
//                         const SizedBox(height: 14),

//                         // Education in detail
//                         FieldWrap('Education in Detail',
//                             child: Field(
//                                 hint: 'Write a brief description',
//                                 maxLines: 3,
//                                 maxLength: 255)),
//                         const SizedBox(height: 14),

//                         // Languages
//                         FieldWrap('Languages Known',
//                             child: Field(hint: 'Select languages')),
//                         const SizedBox(height: 14),

//                         // Employed in chips
//                         FieldWrap('Employed In',
//                             child: Wrap(
//                               spacing: 8,
//                               runSpacing: 8,
//                               children: _empOptions.map((e) {
//                                 final sel = _selected.contains(e);
//                                 return GestureDetector(
//                                   onTap: () => setState(() => sel
//                                       ? _selected.remove(e)
//                                       : _selected.add(e)),
//                                   child: AnimatedContainer(
//                                     duration:
//                                         const Duration(milliseconds: 180),
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 12, vertical: 8),
//                                     decoration: BoxDecoration(
//                                       color: sel
//                                           ? AppColors.kAccent.withOpacity(0.1)
//                                           : AppColors.kCardBg,
//                                       borderRadius:
//                                           BorderRadius.circular(8),
//                                       border: Border.all(
//                                           color: sel ? AppColors.kAccent : AppColors.kBorder,
//                                           width: 1.3),
//                                     ),
//                                     child: Text(e,
//                                         style: TextStyle(
//                                           fontSize: 12,
//                                           color: sel
//                                               ? AppColors.kAccent
//                                               : AppColors.kTextMuted,
//                                           fontWeight: sel
//                                               ? FontWeight.w600
//                                               : FontWeight.w400,
//                                         )),
//                                   ),
//                                 );
//                               }).toList(),
//                             )),
//                         const SizedBox(height: 14),

//                         // Occupation + Working Country
//                         Row(children: [
//                           Expanded(
//                             child: FieldWrap('Occupation',
//                                 required: true,
//                                 child: Drop(hint: 'Select', items: const [
//                                   'Engineer', 'Doctor', 'Teacher',
//                                   'Lawyer', 'Accountant', 'Other'
//                                 ])),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: FieldWrap('Working Country',
//                                 child: Drop(hint: 'Select', items: const [
//                                   'India', 'UAE', 'USA', 'UK', 'Other'
//                                 ])),
//                           ),
//                         ]),
//                         const SizedBox(height: 14),

//                         // State + City
//                         Row(children: [
//                           Expanded(
//                             child: FieldWrap('State',
//                                 child: Drop(hint: 'Select State', items: const [
//                                   'Kerala', 'Tamil Nadu', 'Karnataka',
//                                   'Maharashtra', 'Delhi'
//                                 ])),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: FieldWrap('City',
//                                 child: Drop(hint: 'Select', items: const [
//                                   'Thrissur', 'Kochi', 'Kozhikode',
//                                   'Thiruvananthapuram'
//                                 ])),
//                           ),
//                         ]),
//                         const SizedBox(height: 14),

//                         // Residential Status
//                         FieldWrap('Residential Status',
//                             child: Drop(hint: 'Select', items: const [
//                               'Resident',
//                               'Non-Resident Indian',
//                               'Overseas Citizen'
//                             ])),
//                         const SizedBox(height: 14),

//                         // Annual Income
//                         FieldWrap('Annual Income',
//                             child: Row(children: [
//                               Expanded(
//                                 child: Drop(hint: 'Currency', items: const [
//                                   'INR', 'USD', 'AED'
//                                 ]),
//                               ),
//                               const SizedBox(width: 12),
//                               Expanded(
//                                 child: Drop(hint: 'Range', items: const [
//                                   'Below 2L', '2-5L', '5-10L',
//                                   '10-20L', '20L+'
//                                 ]),
//                               ),
//                             ])),
//                         const SizedBox(height: 22),
//                         CTAButton(
//                           label: 'Continue →',
//                           onTap: () => Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) =>
//                                     const PersonalPhysicalScreen()),
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
//  3c. PROFESSIONAL DETAILS
// ═══════════════════════════════════════════════════════════════



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/view/personal_physical_screen.dart';

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

class ProfessionalDetailsScreen extends StatefulWidget {
  const ProfessionalDetailsScreen({super.key});

  @override
  State<ProfessionalDetailsScreen> createState() => _ProfessionalDetailsState();
}

class _ProfessionalDetailsState extends State<ProfessionalDetailsScreen> {
  final _empOptions = const [
    'Healthcare', 'Information Technology', 'Farmer', 'Defence',
    'Government/PSU', 'Private sector', 'Business', 'Others',
  ];
  final Set<String> _selected = {};

  final _educationDetailCtrl = TextEditingController();
  final _languagesCtrl = TextEditingController();

  String? _education;
  String? _occupation;
  String? _workingCountry;
  String? _state;
  String? _city;
  String? _residentialStatus;
  String? _currency;
  String? _incomeRange;

  bool _isSubmitting = false;

  @override
  void dispose() {
    _educationDetailCtrl.dispose();
    _languagesCtrl.dispose();
    super.dispose();
  }

  // Required fields: Highest Education, Occupation.
  bool get _isFormValid => _education != null && _occupation != null;

  void _handleContinue() {
    FocusScope.of(context).unfocus();
    // if (_education == null) return _showSnack('Please select highest education');
    // if (_occupation == null) return _showSnack('Please select occupation');

    setState(() => _isSubmitting = true);

    // TODO: wire up actual save/continue API call here.
    Future.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const PersonalPhysicalScreen()),
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
                      'Professional Details',
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
                      'Helps us find you the most compatible match',
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: _Palette.hintText,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    _FieldLabel('Highest Education'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Select Education',
                      value: _education,
                      items: const ['High School', 'Diploma', "Bachelor's", "Master's", 'PhD', 'Other'],
                      onChanged: (v) => setState(() => _education = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Education in Detail'),
                    SizedBox(height: 8.h),
                    _buildTextField(
                      controller: _educationDetailCtrl,
                      hint: 'Write a brief description',
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Languages Known'),
                    SizedBox(height: 8.h),
                    _buildTextField(
                      controller: _languagesCtrl,
                      hint: 'Select languages',
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Employment Type'),
                    SizedBox(height: 10.h),
                    _buildMultiSelectChips(),

                    SizedBox(height: 20.h),
                    _FieldLabel('Occupation'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Select Occupation',
                      value: _occupation,
                      items: const ['Engineer', 'Doctor', 'Teacher', 'Lawyer', 'Accountant', 'Other'],
                      onChanged: (v) => setState(() => _occupation = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Working Country'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Select',
                      value: _workingCountry,
                      items: const ['India', 'UAE', 'USA', 'UK', 'Other'],
                      onChanged: (v) => setState(() => _workingCountry = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Working State / Province'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Select State',
                      value: _state,
                      items: const ['Kerala', 'Tamil Nadu', 'Karnataka', 'Maharashtra', 'Delhi'],
                      onChanged: (v) => setState(() => _state = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Working City'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Select',
                      value: _city,
                      items: const ['Thrissur', 'Kochi', 'Kozhikode', 'Thiruvananthapuram'],
                      onChanged: (v) => setState(() => _city = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Residential Status'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Select',
                      value: _residentialStatus,
                      items: const ['Resident', 'Non-Resident Indian', 'Overseas Citizen'],
                      onChanged: (v) => setState(() => _residentialStatus = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Annual Income'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Currency',
                      value: _currency,
                      items: const ['INR', 'USD', 'AED'],
                      onChanged: (v) => setState(() => _currency = v),
                    ),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Range',
                      value: _incomeRange,
                      items: const ['Below 2L', '2-5L', '5-10L', '10-20L', '20L+'],
                      onChanged: (v) => setState(() => _incomeRange = v),
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
                // ... Basic Info → Community & Location → Professional Details (5th)
                value: 4 / 8,
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
  // Multi-select chips (Employed In)
  // ---------------------------------------------------------------------
  Widget _buildMultiSelectChips() {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: _empOptions.map((option) {
        final bool selected = _selected.contains(option);
        return GestureDetector(
          onTap: () => setState(() {
            selected ? _selected.remove(option) : _selected.add(option);
          }),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 9.h),
            decoration: BoxDecoration(
              color: selected ? _Palette.coral.withOpacity(0.1) : _Palette.fieldBg,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: selected ? _Palette.coral : Colors.transparent,
                width: 1.2,
              ),
            ),
            child: Text(
              option,
              style: GoogleFonts.tasaOrbiter(
                fontSize: 10.5.sp,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                color: selected ? _Palette.coral : _Palette.ink,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // ---------------------------------------------------------------------
  // Text field
  // ---------------------------------------------------------------------
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType? keyboardType,
    ValueChanged<String>? onChanged,
  }) {
    return Container(
      height: 44.h,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: _Palette.fieldBg,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
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