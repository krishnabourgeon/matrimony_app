// // ════════════════════════════════════════════════════════════════
// //  STEP 7 — HOBBIES & INTERESTS
// // ════════════════════════════════════════════════════════════════

// import 'package:flutter/material.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
// import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
// import 'package:matrimony_app/view/custom_widgets/progress_indicator.dart';
// import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
// import 'package:matrimony_app/view/custom_widgets/section_header.dart';
// import 'package:matrimony_app/view/custom_widgets/top_bar.dart';
// import 'package:matrimony_app/view/horoscope_details.dart';

// class HobbiesScreen extends StatefulWidget {
//   const HobbiesScreen({super.key});

//   @override
//   State<HobbiesScreen> createState() => _HobbiesState();
// }

// class _HobbiesState extends State<HobbiesScreen> {
//   final Set<String> _selected = {};

//   final _hobbies = [
//     'Writing',    'Reading',       'Badminton',  'Cricket',
//     'Football',   'Tennis',        'Chess',      'Kabadi',
//     'Caroms',     'Billiards',     'Swimming',   'Travelling',
//     'Trucking',   'Cinema',        'Watching TV','Gaming',
//     'Cooking',    'Photography',   'Painting',   'Yoga',
//     'Music',      'Dancing',       'Gardening',  'Cycling',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return BlushScaffold(
//       child: Column(
//         children: [
//           TopBar(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: StepBar(current: 7, total: 8),
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
//                     tag: 'STEP 7 OF 8',
//                     title: 'Hobbies & Interests',
//                     subtitle:
//                         'Select all that apply — helps find like-minded matches',
//                   ),
//                   const SizedBox(height: 20),
//                   FloatingCard(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // selection count
//                         Row(children: [
//                           const Text('Hobbies & Interests',
//                               style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w700,
//                                   color: AppColors.kDarkSlate)),
//                           const Spacer(),
//                           if (_selected.isNotEmpty)
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 4),
//                               decoration: BoxDecoration(
//                                 color: AppColors.kAccent.withOpacity(0.12),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: Text('${_selected.length} selected',
//                                   style: const TextStyle(
//                                       fontSize: 11,
//                                       color: AppColors.kAccent,
//                                       fontWeight: FontWeight.w600)),
//                             ),
//                         ]),
//                         const SizedBox(height: 14),

//                         Wrap(
//                           spacing: 8,
//                           runSpacing: 10,
//                           children: _hobbies.map((h) {
//                             final sel = _selected.contains(h);
//                             return GestureDetector(
//                               onTap: () => setState(() =>
//                                   sel ? _selected.remove(h) : _selected.add(h)),
//                               child: AnimatedContainer(
//                                 duration: const Duration(milliseconds: 180),
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 16, vertical: 9),
//                                 decoration: BoxDecoration(
//                                   color: sel
//                                       ? AppColors.kDarkSlate
//                                       : AppColors.kCardBg,
//                                   borderRadius: BorderRadius.circular(10),
//                                   border: Border.all(
//                                     color: sel
//                                         ? AppColors.kDarkSlate
//                                         : AppColors.kBorder,
//                                     width: 1.3,
//                                   ),
//                                   boxShadow: sel
//                                       ? [
//                                           BoxShadow(
//                                               color: AppColors.kDarkSlate
//                                                   .withOpacity(0.2),
//                                               blurRadius: 6,
//                                               offset: const Offset(0, 2))
//                                         ]
//                                       : [],
//                                 ),
//                                 child: Text(h,
//                                     style: TextStyle(
//                                         fontSize: 12,
//                                         fontWeight: sel
//                                             ? FontWeight.w600
//                                             : FontWeight.w400,
//                                         color: sel
//                                             ? Colors.white
//                                             : AppColors.kTextMuted)),
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                         const SizedBox(height: 24),

//                         // ── Buttons ──
//                         Row(children: [
//                           Expanded(
//                             child: CTAButton(
//                               label: 'Skip this section',
//                               outlined: true,
//                               onTap: () => Navigator.push(context,
//                                   MaterialPageRoute(
//                                       builder: (_) =>
//                                           const HoroscopeScreen())),
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: CTAButton(
//                               label: 'Continue →',
//                               onTap: () => Navigator.push(context,
//                                   MaterialPageRoute(
//                                       builder: (_) =>
//                                           const HoroscopeScreen())),
//                             ),
//                           ),
//                         ]),
//                         const SizedBox(height: 10),
//                         const Center(
//                           child: Text(
//                             'After completing the registration you can edit the profile from your personal dashboard.',
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





// ════════════════════════════════════════════════════════════════
//  HOBBIES & INTERESTS
// ════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:matrimony_app/model/hobbies_model.dart';
import 'package:matrimony_app/provider/register_provider.dart';
import 'package:matrimony_app/services/provider_helper_class.dart';
import 'package:matrimony_app/view/horoscope_details.dart';

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

class HobbiesScreen extends StatefulWidget {
  const HobbiesScreen({super.key});

  @override
  State<HobbiesScreen> createState() => _HobbiesState();
}

class _HobbiesState extends State<HobbiesScreen> {
  final Set<Hobby> _selected = {};

  final _otherCtrl = TextEditingController();
  int _otherCount = 0;

  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RegisterProvider>().getHobbies();
    });
  }

  @override
  void dispose() {
    _otherCtrl.dispose();
    super.dispose();
  }

  void _toggle(Hobby hobby) {
    setState(() {
      if (_selected.contains(hobby)) {
        _selected.remove(hobby);
      } else {
        _selected.add(hobby);
      }
    });
  }

  // Nothing on this screen is required — Continue saves whatever's selected
  // (possibly nothing), Skip saves nothing at all.
  void _handleContinue() {
    FocusScope.of(context).unfocus();

    setState(() => _isSubmitting = true);
    final provider = context.read<RegisterProvider>();
    provider
        .saveHobbies(
      hobbies: _selected.map((h) => h.id).toList(),
      otherHobbies: _otherCtrl.text.trim(),
    )
        .then((success) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      if (success) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const HoroscopeScreen()),
        );
      } else {
        _showSnack(provider.hobbyError ?? 'Something went wrong. Please try again');
      }
    });
  }

  void _handleSkip() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const HoroscopeScreen()),
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
                      'Hobbies & Interests',
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w800,
                        color: _Palette.ink,
                        letterSpacing: -0.6,
                        height: 1.25,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    _buildHobbyChips(),

                    SizedBox(height: 20.h),
                    _buildTextAreaField(
                      controller: _otherCtrl,
                      hint: 'Write about any other hobbies or interests not listed above',
                      maxLength: 255,
                      count: _otherCount,
                      onChanged: (v) => setState(() => _otherCount = v.length),
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
  // Hobby pills — outlined coral when unselected, filled coral when selected.
  // ---------------------------------------------------------------------
  Widget _buildHobbyChips() {
    return Consumer<RegisterProvider>(
      builder: (context, provider, _) {
        final hobbies = provider.hobbiesModel?.hobbies ?? [];
        final loading = provider.loaderState == LoaderState.loading && provider.hobbiesModel == null;
        if (loading) {
          return SizedBox(
            height: 40.h,
            child: Center(
              child: CircularProgressIndicator(strokeWidth: 2, color: _Palette.coral),
            ),
          );
        }
        return Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: hobbies.map((hobby) {
            final bool selected = _selected.contains(hobby);
            return GestureDetector(
              onTap: () => _toggle(hobby),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
                decoration: BoxDecoration(
                  color: selected ? _Palette.coral : _Palette.subtleWhite,
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(color: selected ? _Palette.coral : _Palette.hintText, width: 1.2),
                ),
                child: Text(
                  hobby.name,
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 12.5.sp,
                    fontWeight: FontWeight.w600,
                    color: selected ? _Palette.subtleWhite : _Palette.hintText,
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
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
        maxLines: 4,
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
          contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
          counterText: '$count/$maxLength',
          counterStyle: GoogleFonts.tasaOrbiter(fontSize: 10.sp, color: _Palette.hintText),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Bottom area: Continue (filled) + Skip (outlined) + helper caption
  // ---------------------------------------------------------------------
  Widget _buildBottomArea() {
    final bool busy = _isSubmitting;
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 20.h),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: busy ? null : _handleContinue,
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
                      'Skip',
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
          SizedBox(height: 10.h),
          Text(
            'After completing the registration, you can edit the profile from your personal dashboard.',
            textAlign: TextAlign.center,
            style: GoogleFonts.tasaOrbiter(
              fontSize: 10.5.sp,
              color: _Palette.hintText,
            ),
          ),
        ],
      ),
    );
  }
}