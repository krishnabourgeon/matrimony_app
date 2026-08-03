// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// // import 'package:matrimony_app/view/custom_widgets/field.dart';
// // import 'package:matrimony_app/view/custom_widgets/field_warp.dart';
// // import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
// // import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
// // import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
// // import 'package:matrimony_app/view/custom_widgets/section_header.dart';
// // import 'package:matrimony_app/view/custom_widgets/top_bar.dart';
// // import 'package:matrimony_app/view/login_screen.dart';
// // import 'package:matrimony_app/view/otp_verify_screen.dart';

// // class InitialInfoScreen extends StatefulWidget {
// //   const InitialInfoScreen({super.key});

// //   @override
// //   State<InitialInfoScreen> createState() => _InitialInfoScreenState();
// // }

// // class _InitialInfoScreenState extends State<InitialInfoScreen> {
// //   String? _createdFor;
// //   final _nameCtrl = TextEditingController();
// //   final _mobileCtrl = TextEditingController();

// //   final _options = [
// //     'Myself', 'Son', 'Daughter', 'Brother', 'Sister', 'Friend / Relative'
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlushScaffold(
// //       child: Column(
// //         children: [
// //           TopBar(
// //             showBack: false,
// //             trailing: TextButton(
// //               onPressed: () => Navigator.push(context,
// //                   MaterialPageRoute(builder: (_) => const LoginScreen())),
// //               child: const Text('Login',
// //                   style: TextStyle(
// //                       color: AppColors.kAccent,
// //                       fontWeight: FontWeight.w700,
// //                       fontSize: 14)),
// //             ),
// //           ),
// //           Expanded(
// //             child: SingleChildScrollView(
// //               padding: const EdgeInsets.symmetric(horizontal: 20),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   const SectionHeader(
// //                     tag: 'STEP 1',
// //                     title: "Discover the better\nhalf of your life",
// //                     subtitle: 'Create your profile in just a few steps',
// //                   ),
// //                   const SizedBox(height: 24),
// //                   FloatingCard(
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         // Created for
// //                         FieldWrap('Profile Created For',
// //                             required: true,
// //                             child: Wrap(
// //                               spacing: 8,
// //                               runSpacing: 8,
// //                               children: _options.map((o) {
// //                                 final sel = _createdFor == o;
// //                                 return GestureDetector(
// //                                   onTap: () =>
// //                                       setState(() => _createdFor = o),
// //                                   child: AnimatedContainer(
// //                                     duration:
// //                                         const Duration(milliseconds: 200),
// //                                     padding: const EdgeInsets.symmetric(
// //                                         horizontal: 14, vertical: 8),
// //                                     decoration: BoxDecoration(
// //                                       color:
// //                                           sel ? AppColors.kAccent : AppColors.kCardBg,
// //                                       borderRadius:
// //                                           BorderRadius.circular(20),
// //                                       border: Border.all(
// //                                           color: sel
// //                                               ? AppColors.kAccent
// //                                               : AppColors.kBorder),
// //                                     ),
// //                                     child: Text(o,
// //                                         style: TextStyle(
// //                                           fontSize: 12,
// //                                           fontWeight: FontWeight.w500,
// //                                           color: sel
// //                                               ? AppColors.kWhite
// //                                               : AppColors.kTextMuted,
// //                                         )),
// //                                   ),
// //                                 );
// //                               }).toList(),
// //                             )),
// //                         const SizedBox(height: 16),

// //                         // Name
// //                         FieldWrap('Full Name',
// //                             required: true,
// //                             child: Field(
// //                                 hint: 'Enter your full name',
// //                                 controller: _nameCtrl)),
// //                         const SizedBox(height: 14),

// //                         // Mobile
// //                         FieldWrap('Mobile Number',
// //                             required: true,
// //                             child: Row(children: [
// //                               Container(
// //                                 padding: const EdgeInsets.symmetric(
// //                                     horizontal: 12, vertical: 14),
// //                                 decoration: BoxDecoration(
// //                                   color: AppColors.kCardBg,
// //                                   borderRadius: BorderRadius.circular(12),
// //                                   border: Border.all(color: AppColors.kBorder),
// //                                 ),
// //                                 child: const Text('+91',
// //                                     style: TextStyle(
// //                                         fontSize: 13,
// //                                         fontWeight: FontWeight.w700,
// //                                         color: AppColors.kDarkSlate)),
// //                               ),
// //                               const SizedBox(width: 8),
// //                               Expanded(
// //                                   child: Field(
// //                                       hint: 'Enter mobile number',
// //                                       controller: _mobileCtrl,
// //                                       keyboardType:
// //                                           TextInputType.phone)),
// //                             ])),
// //                         const SizedBox(height: 4),
// //                         const Text(
// //                             'An OTP will be sent to verify your number',
// //                             style: TextStyle(
// //                                 fontSize: 11, color: AppColors.kTextMuted)),
// //                         const SizedBox(height: 22),

// //                         CTAButton(
// //                           label: 'Send OTP →',
// //                           onTap: () => Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                                 builder: (_) => OtpVerifyScreen(
// //                                     mobile: _mobileCtrl.text)),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   const SizedBox(height: 24),
// //                   Center(
// //                     child: GestureDetector(
// //                       onTap: () => Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                             builder: (_) => const LoginScreen()),
// //                       ),
// //                       child: RichText(
// //                         text: const TextSpan(
// //                           text: 'Already have an account? ',
// //                           style:
// //                               TextStyle(fontSize: 13, color: AppColors.kTextMuted),
// //                           children: [
// //                             TextSpan(
// //                               text: 'Login',
// //                               style: TextStyle(
// //                                   color: AppColors.kAccent,
// //                                   fontWeight: FontWeight.bold),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 32),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// import 'package:matrimony_app/view/custom_widgets/field.dart';
// import 'package:matrimony_app/view/custom_widgets/field_warp.dart';
// import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
// import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
// import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
// import 'package:matrimony_app/view/custom_widgets/section_header.dart';
// import 'package:matrimony_app/view/custom_widgets/top_bar.dart';
// import 'package:matrimony_app/view/login_screen.dart';
// import 'package:matrimony_app/view/otp_verify_screen.dart';

// class InitialInfoScreen extends StatefulWidget {
//   const InitialInfoScreen({super.key});

//   @override
//   State<InitialInfoScreen> createState() => _InitialInfoScreenState();
// }

// class _InitialInfoScreenState extends State<InitialInfoScreen> {
//   String? _createdFor;
//   String? _motherTongue;
//   final _nameCtrl = TextEditingController();
//   final _mobileCtrl = TextEditingController();

//   final _options = [
//     'Myself', 'Son', 'Daughter', 'Brother', 'Sister', 'Friend / Relative'
//   ];

//   final _motherTongues = [
//     'Hindi',
//     'Malayalam',
//     'Tamil',
//     'Telugu',
//     'Kannada',
//     'Marathi',
//     'Gujarati',
//     'Punjabi',
//     'Bengali',
//     'Odia',
//     'Urdu',
//     'Konkani',
//     'Tulu',
//     'English',
//     'Other',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return BlushScaffold(
//       child: Column(
//         children: [
//           TopBar(
//             showBack: false,
//             trailing: TextButton(
//               onPressed: () => Navigator.push(context,
//                   MaterialPageRoute(builder: (_) => const LoginScreen())),
//               child: const Text('Login',
//                   style: TextStyle(
//                       color: AppColors.kAccent,
//                       fontWeight: FontWeight.w700,
//                       fontSize: 14)),
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SectionHeader(
//                     tag: 'STEP 1',
//                     title: "Discover the better\nhalf of your life",
//                     subtitle: 'Create your profile in just a few steps',
//                   ),
//                   const SizedBox(height: 24),
//                   FloatingCard(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Created for
//                         FieldWrap('Profile Created For',
//                             required: true,
//                             child: Wrap(
//                               spacing: 8,
//                               runSpacing: 8,
//                               children: _options.map((o) {
//                                 final sel = _createdFor == o;
//                                 return GestureDetector(
//                                   onTap: () =>
//                                       setState(() => _createdFor = o),
//                                   child: AnimatedContainer(
//                                     duration:
//                                         const Duration(milliseconds: 200),
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 14, vertical: 8),
//                                     decoration: BoxDecoration(
//                                       color:
//                                           sel ? AppColors.kAccent : AppColors.kCardBg,
//                                       borderRadius:
//                                           BorderRadius.circular(20),
//                                       border: Border.all(
//                                           color: sel
//                                               ? AppColors.kAccent
//                                               : AppColors.kBorder),
//                                     ),
//                                     child: Text(o,
//                                         style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w500,
//                                           color: sel
//                                               ? AppColors.kWhite
//                                               : AppColors.kTextMuted,
//                                         )),
//                                   ),
//                                 );
//                               }).toList(),
//                             )),
//                         const SizedBox(height: 16),

//                         // Name
//                         FieldWrap('Full Name',
//                             required: true,
//                             child: Field(
//                                 hint: 'Enter your full name',
//                                 controller: _nameCtrl)),
//                         const SizedBox(height: 14),

//                         // Mother Tongue
//                         FieldWrap('Mother Tongue',
//                             required: true,
//                             child: DropdownButtonFormField<String>(
//                               value: _motherTongue,
//                               isExpanded: true,
//                               icon: const Icon(Icons.keyboard_arrow_down_rounded,
//                                   color: AppColors.kTextMuted),
//                               style: const TextStyle(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w500,
//                                 color: AppColors.kDarkSlate,
//                               ),
//                               decoration: InputDecoration(
//                                 hintText: 'Select mother tongue',
//                                 hintStyle: const TextStyle(
//                                     fontSize: 13,
//                                     color: AppColors.kTextMuted,
//                                     fontWeight: FontWeight.w400),
//                                 filled: true,
//                                 fillColor: AppColors.kCardBg,
//                                 contentPadding: const EdgeInsets.symmetric(
//                                     horizontal: 14, vertical: 14),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                   borderSide:
//                                       const BorderSide(color: AppColors.kBorder),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                   borderSide:
//                                       const BorderSide(color: AppColors.kBorder),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                   borderSide:
//                                       const BorderSide(color: AppColors.kAccent),
//                                 ),
//                               ),
//                               dropdownColor: AppColors.kCardBg,
//                               borderRadius: BorderRadius.circular(12),
//                               items: _motherTongues
//                                   .map((lang) => DropdownMenuItem(
//                                         value: lang,
//                                         child: Text(lang),
//                                       ))
//                                   .toList(),
//                               onChanged: (val) =>
//                                   setState(() => _motherTongue = val),
//                             )),
//                         const SizedBox(height: 14),

//                         // Mobile
//                         FieldWrap('Mobile Number',
//                             required: true,
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
//                                   child: Field(
//                                       hint: 'Enter mobile number',
//                                       controller: _mobileCtrl,
//                                       keyboardType:
//                                           TextInputType.phone)),
//                             ])),
//                         const SizedBox(height: 4),
//                         const Text(
//                             'An OTP will be sent to verify your number',
//                             style: TextStyle(
//                                 fontSize: 11, color: AppColors.kTextMuted)),
//                         const SizedBox(height: 22),

//                         CTAButton(
//                           label: 'Send OTP →',
//                           onTap: () => Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => OtpVerifyScreen(
//                                     mobile: _mobileCtrl.text)),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   Center(
//                     child: GestureDetector(
//                       onTap: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (_) => const LoginScreen()),
//                       ),
//                       child: RichText(
//                         text: const TextSpan(
//                           text: 'Already have an account? ',
//                           style:
//                               TextStyle(fontSize: 13, color: AppColors.kTextMuted),
//                           children: [
//                             TextSpan(
//                               text: 'Login',
//                               style: TextStyle(
//                                   color: AppColors.kAccent,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ),
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
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/otp_verify_screen.dart';

// /// Brand colors used on this screen.
// class _Palette {
//   _Palette._();
//   static const Color coral = Color(0xFFFF3356);
//   static const Color coralDark = Color(0xFFE01F42);
//   static const Color ink = Color(0xFF1A1A1A);
//   static const Color subtleWhite = Color(0xFFFFFFFF);

//   static const Color fieldBg = Color(0xFFF5F5F7);
//   static const Color hintText = Color(0xFF8A8A8E);
//   static const Color trackBg = Color(0xFFECECEE);
//   static const Color error = Color(0xFFE53935);
// }

class InitialInfoScreen extends StatefulWidget {
  const InitialInfoScreen({super.key});

  @override
  State<InitialInfoScreen> createState() => _InitialInfoScreenState();
}

class _InitialInfoScreenState extends State<InitialInfoScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  String? _profileFor;
  String? _motherTongue;

  String? _fullNameError;
  String? _mobileError;

  bool _isSubmitting = false;

  final List<String> _profileForOptions = const [
    'Myself',
    'My Son',
    'My Daughter',
    'Brother',
    'Sister',
    'Friend',
    'Relative',
    'Uncle',
    'Mother'
  ];

  final List<String> _motherTongueOptions = const [
    'Malayalam',
    'Tamil',
    'Telugu',
    'Kannada',
    'Hindi',
    'Marathi',
    'Bengali',
    'Gujarati',
    'Punjabi',
    'English',
    'Other',
  ];

  @override
  void dispose() {
    _fullNameController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  // Drives the Send OTP button's coral/grey state.
  bool get _isFormValid {
    if (_fullNameController.text.trim().isEmpty) return false;
    if (_profileFor == null) return false;
    if (_motherTongue == null) return false;
    if (_mobileController.text.trim().length != 10) return false;
    return true;
  }

  void _handleSendOtp() {
    FocusScope.of(context).unfocus();

    // final mobileValue = _mobileController.text.trim();
    // setState(() {
    //   _fullNameError = _fullNameController.text.trim().isEmpty
    //       ? 'Please enter full name'
    //       : null;
    //   if (mobileValue.isEmpty) {
    //     _mobileError = 'Please enter mobile number';
    //   } else if (mobileValue.length != 10) {
    //     _mobileError = 'Enter a valid 10-digit number';
    //   } else {
    //     _mobileError = null;
    //   }
    // });
    // if (_fullNameError != null || _mobileError != null) return;

    // if (_profileFor == null) {
    //   _showSnack('Please select who you are creating this profile for');
    //   return;
    // }
    // if (_motherTongue == null) {
    //   _showSnack('Please select mother tongue');
    //   return;
    // }

    setState(() => _isSubmitting = true);

    // TODO: wire up actual send-OTP API call here.
    Future.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpVerifyScreen(mobile: ""),
        ),
      );
    });
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.ink,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.subtleWhite,
      body: SafeArea(
        child: Column(
          children: [
           // _buildTopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 35.h),
                    Text(
                      'Let\'s Find Your Perfect Match',
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.ink,
                        letterSpacing: -0.6,
                        height: 1.25,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "Create your profile in just a few steps",
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.hintText,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    _FieldLabel('Create Profile For'),
                    SizedBox(height: 10.h),
                    _buildProfileForSelector(),

                    SizedBox(height: 20.h),
                    _FieldLabel("Bride's/Groom's Name "),
                    SizedBox(height: 8.h),
                    _buildTextField(
                      controller: _fullNameController,
                      hint: 'Enter Full Name',
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      errorText: _fullNameError,
                      onChanged: (_) => setState(() {
                        if (_fullNameError != null) _fullNameError = null;
                      }),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Mother Tongue'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      hint: 'Select Mother Tongue',
                      value: _motherTongue,
                      items: _motherTongueOptions,
                      onChanged: (value) =>
                          setState(() => _motherTongue = value),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Mobile Number'),
                    SizedBox(height: 8.h),
                    _buildMobileField(errorText: _mobileError),

                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
            _buildBottomArea(context),
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.r),
        child: LinearProgressIndicator(
          value: 0.33,
          minHeight: 6.h,
          backgroundColor: AppColors.trackBg,
          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.coral),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Profile-for chip selector
  // ---------------------------------------------------------------------
  Widget _buildProfileForSelector() {
    return Wrap(
      spacing: 10.w,
      runSpacing: 10.h,
      children: _profileForOptions.map((option) {
        final bool selected = _profileFor == option;
        return GestureDetector(
          onTap: () => setState(() => _profileFor = option),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
            decoration: BoxDecoration(
              color: selected ? AppColors.coral : AppColors.fieldBg,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(
                color: selected ? AppColors.coral : Colors.transparent,
                width: 1.2,
              ),
            ),
            child: Text(
              option,
              style: GoogleFonts.tasaOrbiter(
                fontSize: 10.5.sp,
                fontWeight: FontWeight.w600,
                color: selected ? AppColors.subtleWhite : AppColors.ink,
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
            color: AppColors.fieldBg,
            borderRadius: BorderRadius.circular(14.r),
            border: errorText != null
                ? Border.all(color: AppColors.error, width: 1.2)
                : null,
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            onChanged: onChanged,
            style: GoogleFonts.tasaOrbiter(
              fontSize: 13.sp,
              color: AppColors.ink,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.tasaOrbiter(
                fontSize: 13.sp,
                color: AppColors.hintText,
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              isDense: true,
              isCollapsed: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 18.w,
                vertical: 10.h,
              ),
            ),
          ),
        ),
        if (errorText != null) ...[
          SizedBox(height: 6.h),
          Text(
            errorText,
            style: GoogleFonts.tasaOrbiter(
              fontSize: 11.sp,
              color: AppColors.error,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }

  // ---------------------------------------------------------------------
  // Mobile number field with +91 prefix
  // ---------------------------------------------------------------------
  Widget _buildMobileField({String? errorText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 44.h,
          decoration: BoxDecoration(
            color: AppColors.fieldBg,
            borderRadius: BorderRadius.circular(14.r),
            border: errorText != null
                ? Border.all(color: AppColors.error, width: 1.2)
                : null,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 18.w),
                child: Text(
                  '+91',
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.ink,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Container(width: 1, height: 22.h, color: AppColors.trackBg),
              Expanded(
                child: TextFormField(
                  controller: _mobileController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  onChanged: (_) => setState(() {
                    if (_mobileError != null) _mobileError = null;
                  }),
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 13.sp,
                    color: AppColors.ink,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: 'Enter Mobile Number',
                    hintStyle: GoogleFonts.tasaOrbiter(
                      fontSize: 13.sp,
                      color: AppColors.hintText,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    isDense: true,
                    isCollapsed: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 10.h,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (errorText != null) ...[
          SizedBox(height: 6.h),
          Text(
            errorText,
            style: GoogleFonts.tasaOrbiter(
              fontSize: 11.sp,
              color: AppColors.error,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }

  // ---------------------------------------------------------------------
  // Dropdown field (Mother Tongue)
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
        color: AppColors.fieldBg,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          initialValue: value,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.ink,
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
              color: AppColors.hintText,
              fontWeight: FontWeight.w400,
            ),
          ),
          style: GoogleFonts.tasaOrbiter(
            fontSize: 13.sp,
            color: AppColors.ink,
            fontWeight: FontWeight.w500,
          ),
          dropdownColor: AppColors.subtleWhite,
          borderRadius: BorderRadius.circular(14.r),
          items: items
              .map(
                (item) =>
                    DropdownMenuItem<String>(value: item, child: Text(item)),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Bottom area: Send OTP button + login link
  // ---------------------------------------------------------------------
  Widget _buildBottomArea(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            height: 40.h,
            child: ElevatedButton(
              onPressed: _isSubmitting ? null : _handleSendOtp,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isFormValid ? AppColors.coral : AppColors.grey,
                disabledBackgroundColor: AppColors.coral.withOpacity(0.6),
                foregroundColor: AppColors.subtleWhite,
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
                          AppColors.subtleWhite,
                        ),
                      ),
                    )
                  : Text(
                      'Send OTP',
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.1,
                      ),
                    ),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account? ',
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 13.5.sp,
                  color: AppColors.hintText,
                  fontWeight: FontWeight.w400,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push to LoginScreen goes here.
                },
                child: Text(
                  'Login',
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 13.5.sp,
                    color: AppColors.coralDark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
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
        color: AppColors.ink,
      ),
    );
  }
}
