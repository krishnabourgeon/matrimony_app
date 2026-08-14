// ════════════════════════════════════════════════════════════════
//  STEP 8 — HOROSCOPE DETAILS
// ════════════════════════════════════════════════════════════════

// import 'package:flutter/material.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// import 'package:matrimony_app/view/custom_widgets/field.dart';
// import 'package:matrimony_app/view/custom_widgets/field_warp.dart';
// import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
// import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
// import 'package:matrimony_app/view/custom_widgets/progress_indicator.dart';
// import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
// import 'package:matrimony_app/view/custom_widgets/section_header.dart';
// import 'package:matrimony_app/view/custom_widgets/top_bar.dart';
// import 'package:matrimony_app/view/login_screen.dart';

// class HoroscopeScreen extends StatefulWidget {
//   const HoroscopeScreen({super.key});

//   @override
//   State<HoroscopeScreen> createState() => _HoroscopeState();
// }

// class _HoroscopeState extends State<HoroscopeScreen> {
//   final _dobCtrl  = TextEditingController();
//   final _timeCtrl = TextEditingController();
//   final _locCtrl  = TextEditingController();

//   String _amPm        = 'AM';
//   String? _sudha;       // 'Yes' | 'No' | 'DontKnow'
//   String? _dosha;       // 'Yes' | 'No' | 'DontKnow'
//   String? _starOnly;    // 'Yes' | 'No'
//   String? _horoMatch;   // 'Important' | 'Preferable' | 'Not Necessary' | 'DontWant'

//   @override
//   void dispose() {
//     _dobCtrl.dispose();
//     _timeCtrl.dispose();
//     _locCtrl.dispose();
//     super.dispose();
//   }

//   Widget _radioRow(
//     String question,
//     List<String> options,
//     String? current,
//     ValueChanged<String?> onChanged,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(question,
//             style: const TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w600,
//                 color: AppColors.kSlate)),
//         const SizedBox(height: 8),
//         Wrap(
//           spacing: 6,
//           runSpacing: 6,
//           children: options.map((opt) {
//             final sel = current == opt;
//             return GestureDetector(
//               onTap: () => onChanged(opt),
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 150),
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 14, vertical: 8),
//                 decoration: BoxDecoration(
//                   color: sel
//                       ? AppColors.kAccent.withOpacity(0.1)
//                       : AppColors.kCardBg,
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(
//                     color: sel ? AppColors.kAccent : AppColors.kBorder,
//                     width: sel ? 1.5 : 1.0,
//                   ),
//                 ),
//                 child: Row(mainAxisSize: MainAxisSize.min, children: [
//                   Container(
//                     width: 14,
//                     height: 14,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                           color: sel
//                               ? AppColors.kAccent
//                               : AppColors.kBorder,
//                           width: 1.5),
//                       color: sel ? AppColors.kAccent : Colors.transparent,
//                     ),
//                     child: sel
//                         ? const Icon(Icons.check,
//                             size: 9, color: Colors.white)
//                         : null,
//                   ),
//                   const SizedBox(width: 6),
//                   Text(opt,
//                       style: TextStyle(
//                           fontSize: 12,
//                           color: sel
//                               ? AppColors.kAccent
//                               : AppColors.kTextMuted,
//                           fontWeight: sel
//                               ? FontWeight.w600
//                               : FontWeight.w400)),
//                 ]),
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlushScaffold(
//       child: Column(
//         children: [
//           TopBar(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: StepBar(current: 8, total: 8),
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
//                     tag: 'STEP 8 OF 8',
//                     title: 'Horoscope Details',
//                     subtitle:
//                         'Optional but improves your match quality significantly',
//                   ),
//                   const SizedBox(height: 20),
//                   FloatingCard(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [

//                         // ── DOB as per horoscope ──
//                         FieldWrap('Date of Birth as per horoscope',
//                             child: Field(
//                               hint: 'DD-MM-YYYY',
//                               controller: _dobCtrl,
//                               keyboardType: TextInputType.datetime,
//                             )),
//                         const SizedBox(height: 14),

//                         // ── Time of birth + AM/PM ──
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Expanded(
//                               child: FieldWrap('Time of Birth',
//                                   child: Field(
//                                     hint: '1:30',
//                                     controller: _timeCtrl,
//                                     keyboardType: TextInputType.datetime,
//                                   )),
//                             ),
//                             const SizedBox(width: 10),
//                             // AM / PM toggle
//                             Container(
//                               margin: const EdgeInsets.only(bottom: 1),
//                               padding: const EdgeInsets.all(4),
//                               decoration: BoxDecoration(
//                                 color: AppColors.kCardBg,
//                                 borderRadius: BorderRadius.circular(12),
//                                 border: Border.all(color: AppColors.kBorder),
//                               ),
//                               child: Row(
//                                 children: ['AM', 'PM'].map((t) {
//                                   final sel = _amPm == t;
//                                   return GestureDetector(
//                                     onTap: () =>
//                                         setState(() => _amPm = t),
//                                     child: AnimatedContainer(
//                                       duration:
//                                           const Duration(milliseconds: 180),
//                                       width: 42,
//                                       height: 38,
//                                       alignment: Alignment.center,
//                                       decoration: BoxDecoration(
//                                         color: sel
//                                             ? AppColors.kAccent
//                                             : Colors.transparent,
//                                         borderRadius:
//                                             BorderRadius.circular(9),
//                                       ),
//                                       child: Text(t,
//                                           style: TextStyle(
//                                               fontSize: 13,
//                                               fontWeight: FontWeight.w700,
//                                               color: sel
//                                                   ? Colors.white
//                                                   : AppColors.kTextMuted)),
//                                     ),
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: FieldWrap('Location of Birth',
//                                   child: Field(
//                                     hint: 'City / Town',
//                                     controller: _locCtrl,
//                                   )),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 20),

//                         // ── Radio Questions ──
//                         _radioRow(
//                           'Having Sudha Jathakam',
//                           ['Yes', 'No', "Don't Know"],
//                           _sudha,
//                           (v) => setState(() => _sudha = v),
//                         ),
//                         const SizedBox(height: 16),

//                         _radioRow(
//                           'Having Dosha Jathakam',
//                           ['Yes', 'No', "Don't Know"],
//                           _dosha,
//                           (v) => setState(() => _dosha = v),
//                         ),
//                         const SizedBox(height: 16),

//                         _radioRow(
//                           'Looking for star match only?',
//                           ['Yes', 'No'],
//                           _starOnly,
//                           (v) => setState(() => _starOnly = v),
//                         ),
//                         const SizedBox(height: 16),

//                         _radioRow(
//                           'Horoscope Matches',
//                           ['Important', 'Preferable', 'Not Necessary', "Don't Want"],
//                           _horoMatch,
//                           (v) => setState(() => _horoMatch = v),
//                         ),
//                         const SizedBox(height: 26),

//                         // ── Final Buttons ──
//                         Row(children: [
//                           Expanded(
//                             child: CTAButton(
//                               label: 'Skip & Submit',
//                               outlined: true,
//                               onTap: () => _showSuccess(context),
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: CTAButton(
//                               label: 'Submit ✓',
//                               onTap: () => _showSuccess(context),
//                             ),
//                           ),
//                         ]),
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

//   void _showSuccess(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         backgroundColor: AppColors.kBgTop,
//         title: const Row(children: [
//           Icon(Icons.favorite_rounded, color: AppColors.kAccent),
//           SizedBox(width: 8),
//           Text('Profile Created!',
//               style: TextStyle(
//                   color: AppColors.kDarkSlate, fontSize: 18)),
//         ]),
//         content: const Text(
//           'Your registration is complete. Login to find your perfect match!',
//           style:
//               TextStyle(color: AppColors.kTextMuted, fontSize: 13),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               // Navigate to LoginScreen or MainShell
//               Navigator.pushAndRemoveUntil(context,
//                 MaterialPageRoute(builder: (_) => const LoginScreen()),
//                 (r) => false);
//             },
//             child: const Text('Go to Login',
//                 style: TextStyle(
//                     color: AppColors.kAccent,
//                     fontWeight: FontWeight.bold)),
//           ),
//         ],
//       ),
//     );
//   }
// }

// ════════════════════════════════════════════════════════════════
//  HOROSCOPE DETAILS
// ════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:matrimony_app/model/stars_model.dart';
import 'package:matrimony_app/provider/register_provider.dart';
import 'package:matrimony_app/services/provider_helper_class.dart';
import 'package:matrimony_app/services/shared_preference_helper.dart';
import 'package:matrimony_app/view/login_screen.dart';
import 'package:matrimony_app/view/subscription_plan_screen.dart';

/// Brand colors used on this screen — mirrors the other onboarding screens' palette.
class _Palette {
  _Palette._();
  static const Color coral = Color(0xFFFF3356);
  static const Color ink = Color(0xFF1A1A1A);
  static const Color subtleWhite = Color(0xFFFFFFFF);

  static const Color fieldBg = Color(0xFFF5F5F7);
  static const Color hintText = Color(0xFF8A8A8E);
  static const Color trackBg = Color(0xFFECECEE);
}

class HoroscopeScreen extends StatefulWidget {
  const HoroscopeScreen({super.key});

  @override
  State<HoroscopeScreen> createState() => _HoroscopeState();
}

class _HoroscopeState extends State<HoroscopeScreen> {
  final _timeCtrl = TextEditingController();
  final _locCtrl = TextEditingController();

  String _amPm = 'AM';
  DateTime? _dobHoroscope;
  Star? _birthStar;
  String? _sudha; // 'Yes' | 'No' | 'Dont Know'
  String? _dosha; // 'Yes' | 'No' | 'Dont Know'
  String? _starOnly; // 'Yes' | 'No'
  String?
  _horoMatch; // 'Important' | 'Preferable' | "Don't Want" | 'Not Necessary'

  bool _isSubmitting = false;

  // No catalog endpoint exists for these yet, so they're fixed local ids —
  // worth confirming against the real API contract if horoscope-info
  // rejects match_type_id.
  static const Map<String, int> _matchTypeIds = {
    "Don't Want": 0,
    'Important': 1,
    'Preferable': 2,
    'Not Necessary': 3,
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RegisterProvider>().getStars();
    });
  }

  @override
  void dispose() {
    _timeCtrl.dispose();
    _locCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDobHoroscope() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _dobHoroscope ?? DateTime(now.year - 25, now.month, now.day),
      firstDate: DateTime(now.year - 100),
      lastDate: now,
    );
    if (picked == null) return;
    setState(() => _dobHoroscope = picked);
  }

  // Nothing on this screen is required — Submit saves whatever's filled in
  // (unset fields default to 0/empty), Skip saves nothing at all.
  void _handleSubmit() {
    FocusScope.of(context).unfocus();

    setState(() => _isSubmitting = true);
    final provider = context.read<RegisterProvider>();
    final dob = _dobHoroscope;
    final dobFormatted = dob == null
        ? ''
        : '${dob.day.toString().padLeft(2, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.year.toString().padLeft(4, '0')}';

    provider
        .horoscopeDetails(
      dobHoroscope: dobFormatted,
      birthTime: _timeCtrl.text.trim(),
      birthTimePeriod: _amPm,
      birthPlace: _locCtrl.text.trim(),
      starId: _birthStar?.id ?? 0,
      isSudhaJathakam: _sudha == 'Yes' ? 1 : 0,
      isDoshaJathakam: _dosha == 'Yes' ? 1 : 0,
      show: 1,
      matchTypeId: _matchTypeIds[_horoMatch] ?? 0,
      starMatch: _starOnly == 'Yes' ? 1 : 0,
      doshaType: _dosha ?? '',
    )
        .then((success) async {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      if (success) {
        await SharedPreferenceHelper.saveRegistrationComplete();
        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SubscriptionPlanScreen()),
        );
      } else {
        _showSnack(provider.horoscopeError ?? 'Something went wrong. Please try again');
      }
    });
  }

  void _handleSkip() async {
    await SharedPreferenceHelper.saveRegistrationComplete();
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SubscriptionPlanScreen()),
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

  void _showSuccess() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        backgroundColor: _Palette.subtleWhite,
        title: Row(
          children: [
            Icon(Icons.favorite_rounded, color: _Palette.coral),
            SizedBox(width: 8.w),
            Text(
              'Profile Created!',
              style: GoogleFonts.tasaOrbiter(
                color: _Palette.ink,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        content: Text(
          'Your registration is complete. Login to find your perfect match!',
          style: GoogleFonts.tasaOrbiter(
            color: _Palette.hintText,
            fontSize: 13.sp,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const SignInScreen()),
                (route) => false,
              );
            },
            child: Text(
              'Go to Login',
              style: GoogleFonts.tasaOrbiter(
                color: _Palette.coral,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
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
                      'Horoscope Details',
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w800,
                        color: _Palette.ink,
                        letterSpacing: -0.6,
                        height: 1.25,
                      ),
                    ),
                    SizedBox(height: 24.h),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _FieldLabel('Date of Birth as per horoscope'),
                              SizedBox(height: 8.h),
                              _buildDobField(),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _FieldLabel('Birth Star'),
                              SizedBox(height: 8.h),
                              Consumer<RegisterProvider>(
                                builder: (context, provider, _) {
                                  final stars = provider.starsModel?.stars ?? [];
                                  final loading = provider.loaderState == LoaderState.loading &&
                                      provider.starsModel == null;
                                  return _buildDropdownField<Star>(
                                    hint: loading ? 'Loading...' : 'Select Birth Star',
                                    value: _birthStar,
                                    items: stars,
                                    labelBuilder: (s) => s.name,
                                    loading: loading,
                                    onChanged: (v) =>
                                        setState(() => _birthStar = v),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _FieldLabel('Time of birth'),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: _buildTextField(
                                      controller: _timeCtrl,
                                      hint: '',
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  SizedBox(
                                    width: 78.w,
                                    child: _buildDropdownField<String>(
                                      hint: 'AM',
                                      value: _amPm,
                                      items: const ['AM', 'PM'],
                                      labelBuilder: (s) => s,
                                      onChanged: (v) =>
                                          setState(() => _amPm = v ?? 'AM'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _FieldLabel('Location of birth'),
                              SizedBox(height: 8.h),
                              _buildTextField(
                                controller: _locCtrl,
                                hint: 'Enter the location',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 28.h),
                    _buildRadioQuestion(
                      question: 'Having Sudha Jathakam',
                      options: const ['Yes', 'No', 'Dont Know'],
                      selected: _sudha,
                      onSelect: (v) => setState(() => _sudha = v),
                    ),

                    SizedBox(height: 18.h),
                    _buildRadioQuestion(
                      question: 'Having Dosha Jathakam',
                      options: const ['Yes', 'No', 'Dont Know'],
                      selected: _dosha,
                      onSelect: (v) => setState(() => _dosha = v),
                    ),

                    SizedBox(height: 18.h),
                    _buildRadioQuestion(
                      question: 'Looking for star match only?',
                      options: const ['Yes', 'No'],
                      selected: _starOnly,
                      onSelect: (v) => setState(() => _starOnly = v),
                    ),

                    SizedBox(height: 18.h),
                    _buildRadioQuestion(
                      question: 'Horoscope Matches',
                      options: const [
                        'Important',
                        'Preferable',
                        "Don't Want",
                        'Not Necessary',
                      ],
                      selected: _horoMatch,
                      onSelect: (v) => setState(() => _horoMatch = v),
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
              child: Icon(
                Icons.arrow_back_rounded,
                color: _Palette.ink,
                size: 18.sp,
              ),
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: LinearProgressIndicator(
                value: 8 / 8,
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
  }) {
    return Container(
      height: 44.h,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
        color: _Palette.fieldBg,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: TextField(
        controller: controller,
        style: GoogleFonts.tasaOrbiter(
          fontSize: 13.sp,
          color: _Palette.ink,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          isDense: true,
          isCollapsed: true,
          hintText: hint,
          hintStyle: GoogleFonts.tasaOrbiter(
            fontSize: 13.sp,
            color: _Palette.hintText,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Date of Birth (as per horoscope) — opens a calendar date picker
  // ---------------------------------------------------------------------
  Widget _buildDobField() {
    final text = _dobHoroscope == null
        ? 'DD-MM-YYYY'
        : '${_dobHoroscope!.day.toString().padLeft(2, '0')}-${_dobHoroscope!.month.toString().padLeft(2, '0')}-${_dobHoroscope!.year}';
    return GestureDetector(
      onTap: _pickDobHoroscope,
      child: Container(
        height: 44.h,
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        decoration: BoxDecoration(
          color: _Palette.fieldBg,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 13.sp,
                  fontWeight: _dobHoroscope == null ? FontWeight.w400 : FontWeight.w500,
                  color: _dobHoroscope == null ? _Palette.hintText : _Palette.ink,
                ),
              ),
            ),
            Icon(Icons.calendar_today_rounded, color: _Palette.ink, size: 16.sp),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Dropdown field (Birth Star, AM/PM)
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
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: _Palette.ink,
                  size: 22.sp,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                ),
                hint: Text(
                  hint,
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 13.sp,
                    color: _Palette.hintText,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 13.sp,
                  color: _Palette.ink,
                  fontWeight: FontWeight.w500,
                ),
                dropdownColor: _Palette.subtleWhite,
                borderRadius: BorderRadius.circular(14.r),
                items: items
                    .map(
                      (item) => DropdownMenuItem<T>(
                        value: item,
                        child: Text(labelBuilder(item), overflow: TextOverflow.ellipsis),
                      ),
                    )
                    .toList(),
                onChanged: enabled ? onChanged : null,
              ),
            ),
    );
  }

  // ---------------------------------------------------------------------
  // A labeled question with radio-button options, label on the left and
  // the options wrapping on the right — matches the reference design.
  // ---------------------------------------------------------------------
  Widget _buildRadioQuestion({
    required String question,
    required List<String> options,
    required String? selected,
    required ValueChanged<String?> onSelect,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: _FieldLabel(question),
          ),
        ),
        Expanded(
          flex: 3,
          child: Wrap(
            spacing: 4.w,
            runSpacing: 6.h,
            children: options.map((option) {
              final bool isSelected = selected == option;
              return GestureDetector(
                onTap: () => onSelect(option),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 20.w,
                      height: 40.w,
                      child: Radio<String>(
                        value: option,
                        groupValue: selected,
                        onChanged: onSelect,
                        activeColor: _Palette.coral,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      option,
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 12.sp,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: _Palette.ink,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------
  // Bottom area: Submit (filled) + Skip (outlined)
  // ---------------------------------------------------------------------
  Widget _buildBottomArea() {
    final bool busy = _isSubmitting;
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 20.h),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 40.h,
              child: ElevatedButton(
                onPressed: busy ? null : _handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _Palette.coral,
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
          SizedBox(width: 12.w),
          Expanded(
            child: SizedBox(
              height: 40.h,
              child: OutlinedButton(
                onPressed: busy ? null : _handleSkip,
                style: OutlinedButton.styleFrom(
                  foregroundColor: _Palette.coral,
                  disabledForegroundColor: _Palette.coral.withOpacity(0.6),
                  side: BorderSide(color: _Palette.coral, width: 1.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                ),
                child: Text(
                  'Skip & Submit',
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
        fontWeight: FontWeight.w700,
        color: _Palette.ink,
      ),
    );
  }
}
