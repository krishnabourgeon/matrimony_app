// // // // ═══════════════════════════════════════════════════════════════
// // // //  3a. BASIC INFORMATION
// // // // ═══════════════════════════════════════════════════════════════

// // // import 'package:flutter/material.dart';
// // // import 'package:matrimony_app/view/communtiy_location_screen.dart';
// // // import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// // // import 'package:matrimony_app/view/custom_widgets/field.dart';
// // // import 'package:matrimony_app/view/custom_widgets/field_warp.dart';
// // // import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
// // // import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
// // // import 'package:matrimony_app/view/custom_widgets/progress_indicator.dart';
// // // import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
// // // import 'package:matrimony_app/view/custom_widgets/section_header.dart';
// // // import 'package:matrimony_app/view/custom_widgets/toggle_button.dart';
// // // import 'package:matrimony_app/view/custom_widgets/top_bar.dart';

// // // class BasicInfoScreen extends StatefulWidget {
// // //   const BasicInfoScreen({super.key});

// // //   @override
// // //   State<BasicInfoScreen> createState() => _BasicInfoState();
// // // }

// // // class _BasicInfoState extends State<BasicInfoScreen> {
// // //   String _gender = 'Male';
// // //   bool _showPass = false;
// // //   bool _showConfirm = false;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return BlushScaffold(
// // //       child: Column(
// // //         children: [
// // //           TopBar(),
// // //           Padding(
// // //             padding: const EdgeInsets.symmetric(horizontal: 20),
// // //             child: StepBar(current: 1, total: 8),
// // //           ),
// // //           const SizedBox(height: 14),
// // //           Expanded(
// // //             child: SingleChildScrollView(
// // //               padding: const EdgeInsets.symmetric(horizontal: 20),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   const SectionHeader(
// // //                     tag: 'STEP 1 OF 8',
// // //                     title: 'Basic\nInformation',
// // //                     subtitle:
// // //                         'Provide your basic information to get started',
// // //                   ),
// // //                   const SizedBox(height: 20),
// // //                   FloatingCard(
// // //                     child: Column(
// // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // //                         children: [
// // //                           // DOB + Gender
// // //                           Row(children: [
// // //                             Expanded(
// // //                               child: FieldWrap('Date of Birth',
// // //                                   required: true,
// // //                                   child: Field(
// // //                                       hint: 'DD-MM-YYYY',
// // //                                       keyboardType:
// // //                                           TextInputType.datetime)),
// // //                             ),
// // //                             const SizedBox(width: 12),
// // //                             Expanded(
// // //                               child: FieldWrap('Gender',
// // //                                   required: true,
// // //                                   child: Row(children: [
// // //                                     Expanded(
// // //                                       child: Pill(
// // //                                         label: 'Male',
// // //                                         selected: _gender == 'Male',
// // //                                         onTap: () => setState(
// // //                                             () => _gender = 'Male'),
// // //                                       ),
// // //                                     ),
// // //                                     const SizedBox(width: 6),
// // //                                     Expanded(
// // //                                       child: Pill(
// // //                                         label: 'Female',
// // //                                         selected: _gender == 'Female',
// // //                                         onTap: () => setState(
// // //                                             () => _gender = 'Female'),
// // //                                       ),
// // //                                     ),
// // //                                   ])),
// // //                             ),
// // //                           ]),
// // //                           const SizedBox(height: 14),

// // //                           // // Religion + Mother Tongue
// // //                           // Row(children: [
// // //                           //   Expanded(
// // //                           //     child: FieldWrap('Religion',
// // //                           //         required: true,
// // //                           //         child: Drop(
// // //                           //             hint: 'Select',
// // //                           //             items: const [
// // //                           //               'Hindu', 'Muslim', 'Christian',
// // //                           //               'Sikh', 'Jain', 'Buddhist', 'Other'
// // //                           //             ])),
// // //                           //   ),
// // //                           //   const SizedBox(width: 12),
// // //                           //   Expanded(
// // //                           //     child: FieldWrap('Mother Tongue',
// // //                           //         required: true,
// // //                           //         child: Drop(hint: 'Select', items: const [
// // //                           //           'Malayalam', 'Hindi', 'Tamil',
// // //                           //           'Telugu', 'Kannada', 'Punjabi', 'Other'
// // //                           //         ])),
// // //                           //   ),
// // //                           // ]),
// // //                           // const SizedBox(height: 14),

// // //                           // Email
// // //                           FieldWrap('Email',
// // //                               required: true,
// // //                               child: Field(
// // //                                   hint: 'Your email address',
// // //                                   keyboardType: TextInputType.emailAddress)),
// // //                           const SizedBox(height: 14),

// // //                           // Password
// // //                           FieldWrap('Password',
// // //                               child: Field(
// // //                                 hint: '••••••••',
// // //                                 obscure: !_showPass,
// // //                                 suffix: IconButton(
// // //                                   icon: Icon(
// // //                                     _showPass
// // //                                         ? Icons.visibility_outlined
// // //                                         : Icons.visibility_off_outlined,
// // //                                     color: AppColors.kTextMuted, size: 20,
// // //                                   ),
// // //                                   onPressed: () => setState(
// // //                                       () => _showPass = !_showPass),
// // //                                 ),
// // //                               )),
// // //                           const SizedBox(height: 4),
// // //                           const Text(
// // //                               'eg. Abcd@123 Â· min 8 characters â€“ max 20',
// // //                               style: TextStyle(
// // //                                   fontSize: 10, color: AppColors.kTextMuted)),
// // //                           const SizedBox(height: 14),

// // //                           // Confirm password
// // //                           FieldWrap('Confirm Password',
// // //                               child: Field(
// // //                                 hint: '••••••••',
// // //                                 obscure: !_showConfirm,
// // //                                 suffix: IconButton(
// // //                                   icon: Icon(
// // //                                     _showConfirm
// // //                                         ? Icons.visibility_outlined
// // //                                         : Icons.visibility_off_outlined,
// // //                                     color: AppColors.kTextMuted, size: 20,
// // //                                   ),
// // //                                   onPressed: () => setState(
// // //                                       () => _showConfirm = !_showConfirm),
// // //                                 ),
// // //                               )),
// // //                           const SizedBox(height: 22),
// // //                           CTAButton(
// // //                             label: 'Continue →',
// // //                             onTap: () => Navigator.push(
// // //                               context,
// // //                               MaterialPageRoute(
// // //                                   builder: (_) =>
// // //                                       const CommunityLocationScreen()),
// // //                             ),
// // //                           ),
// // //                         ]),
// // //                   ),
// // //                   const SizedBox(height: 32),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // ═══════════════════════════════════════════════════════════════
// //  3a. BASIC INFORMATION
// // ═══════════════════════════════════════════════════════════════

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:matrimony_app/view/communtiy_location_screen.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';

// class BasicInfoScreen extends StatefulWidget {
//   const BasicInfoScreen({super.key});

//   @override
//   State<BasicInfoScreen> createState() => _BasicInfoState();
// }

// class _BasicInfoState extends State<BasicInfoScreen> {
//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _dobController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();

//   String? _gender;
//   DateTime? _dob;
//   String? _maritalStatus;
//   String? _religion;
//   String? _motherTongue;

//   String? _fullNameError;
//   String? _emailError;
//   String? _passwordError;
//   String? _confirmPasswordError;

//   bool _obscurePassword = true;
//   bool _obscureConfirmPassword = true;

//   final List<String> _maritalStatusOptions = const [
//     'Never Married',
//     'Divorced',
//     'Widowed',
//     'Separated',
//   ];

//   final List<String> _religionOptions = const [
//     'Hindu',
//     'Muslim',
//     'Christian',
//     'Sikh',
//     'Jain',
//     'Buddhist',
//     'Other',
//   ];

//   final List<String> _motherTongueOptions = const [
//     'Malayalam',
//     'Tamil',
//     'Telugu',
//     'Kannada',
//     'Hindi',
//     'Marathi',
//     'Bengali',
//     'Gujarati',
//     'Punjabi',
//     'English',
//     'Other',
//   ];

//   @override
//   void dispose() {
//     _fullNameController.dispose();
//     _dobController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   Future<void> _pickDob() async {
//     final now = DateTime.now();
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: _dob ?? DateTime(now.year - 21, now.month, now.day),
//       firstDate: DateTime(now.year - 100),
//       lastDate: DateTime(now.year - 18, now.month, now.day),
//     );
//     if (picked == null) return;
//     setState(() {
//       _dob = picked;
//       _dobController.text =
//           '${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}';
//     });
//   }

//   bool _isValidEmail(String value) {
//     return RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[\w\-]{2,4}$').hasMatch(value);
//   }

//   void _handleContinue() {
//     FocusScope.of(context).unfocus();

//     setState(() {
//       _fullNameError = _fullNameController.text.trim().isEmpty ? 'Please enter full name' : null;

//       final email = _emailController.text.trim();
//       if (email.isEmpty) {
//         _emailError = 'Please enter your email id';
//       } else if (!_isValidEmail(email)) {
//         _emailError = 'Please enter a valid email id';
//       } else {
//         _emailError = null;
//       }

//       final password = _passwordController.text;
//       if (password.isEmpty) {
//         _passwordError = 'Please enter a password';
//       } else if (password.length < 8 || password.length > 20) {
//         _passwordError = 'Password must be 8-20 characters';
//       } else {
//         _passwordError = null;
//       }

//       final confirmPassword = _confirmPasswordController.text;
//       if (confirmPassword.isEmpty) {
//         _confirmPasswordError = 'Please confirm your password';
//       } else if (confirmPassword != password) {
//         _confirmPasswordError = 'Passwords do not match';
//       } else {
//         _confirmPasswordError = null;
//       }
//     });

//     if (_fullNameError != null) return;

//     if (_gender == null) {
//       _showSnack('Please select gender');
//       return;
//     }
//     if (_dob == null) {
//       _showSnack('Please select date of birth');
//       return;
//     }
//     if (_emailError != null) return;
//     if (_passwordError != null) return;
//     if (_confirmPasswordError != null) return;

//     if (_maritalStatus == null) {
//       _showSnack('Please select marital status');
//       return;
//     }
//     if (_religion == null) {
//       _showSnack('Please select religion');
//       return;
//     }
//     if (_motherTongue == null) {
//       _showSnack('Please select mother tongue');
//       return;
//     }

//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => const CommunityLocationScreen()),
//     );
//   }

//   void _showSnack(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: AppColors.ink,
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.subtleWhite,
//       body: SafeArea(
//         child: Column(
//           children: [
//             _buildTopBar(),
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: EdgeInsets.symmetric(horizontal: 24.w),
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 35.h),
//                     Text(
//                       'Provide your basic information',
//                       style: GoogleFonts.tasaOrbiter(
//                         fontSize: 24.sp,
//                         fontWeight: FontWeight.w800,
//                         color: AppColors.ink,
//                         letterSpacing: -0.6,
//                         height: 1.25,
//                       ),
//                     ),
//                     SizedBox(height: 6.h),
//                     // Text(
//                     //   'Provide your basic information to get started',
//                     //   style: GoogleFonts.tasaOrbiter(
//                     //     fontSize: 14.sp,
//                     //     fontWeight: FontWeight.w400,
//                     //     color: AppColors.hintText,
//                     //   ),
//                     // ),
//                     SizedBox(height: 20.h),

//                     // _FieldLabel('Full Name', required: true),
//                     // SizedBox(height: 8.h),
//                     // _buildTextField(
//                     //   controller: _fullNameController,
//                     //   hint: 'Enter Full Name',
//                     //   keyboardType: TextInputType.name,
//                     //   textCapitalization: TextCapitalization.words,
//                     //   errorText: _fullNameError,
//                     //   onChanged: (_) {
//                     //     if (_fullNameError != null) setState(() => _fullNameError = null);
//                     //   },
//                     // ),

//                     //SizedBox(height: 20.h),

//                     // â”€â”€ Gender + Date of Birth (side by side) â”€â”€
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _FieldLabel('Gender', required: true),
//                           SizedBox(height: 10.h),
//                           _buildGenderSelector(),
//                         ],
//                       ),
//                     ),
//                     SizedBox(width: 16.w),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _FieldLabel('Date of Birth', required: true),
//                           SizedBox(height: 8.h),
//                           _buildDateField(),
//                         ],
//                       ),
//                     ),

//                     SizedBox(height: 20.h),
//                     _FieldLabel('Email', required: true),
//                     SizedBox(height: 8.h),
//                     _buildTextField(
//                       controller: _emailController,
//                       hint: 'Your Email',
//                       keyboardType: TextInputType.emailAddress,
//                       errorText: _emailError,
//                       onChanged: (_) {
//                         if (_emailError != null) setState(() => _emailError = null);
//                       },
//                     ),
//                     if (_emailError == null) ...[
//                       SizedBox(height: 6.h),
//                       Text(
//                         'Enter your email id',
//                         style: GoogleFonts.tasaOrbiter(
//                           fontSize: 11.sp,
//                           color: AppColors.hintText,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ],

//                     SizedBox(height: 20.h),

//                     // â”€â”€ Password + Confirm Password (side by side) â”€â”€
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _FieldLabel('Password', required: true),
//                           SizedBox(height: 8.h),
//                           _buildPasswordField(
//                             controller: _passwordController,
//                             obscure: _obscurePassword,
//                             errorText: _passwordError,
//                             onToggleObscure: () =>
//                                 setState(() => _obscurePassword = !_obscurePassword),
//                             onChanged: (_) {
//                               if (_passwordError != null) setState(() => _passwordError = null);
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(width: 16.w),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _FieldLabel('Confirm Password', required: true),
//                           SizedBox(height: 8.h),
//                           _buildPasswordField(
//                             controller: _confirmPasswordController,
//                             obscure: _obscureConfirmPassword,
//                             errorText: _confirmPasswordError,
//                             onToggleObscure: () => setState(
//                                 () => _obscureConfirmPassword = !_obscureConfirmPassword),
//                             onChanged: (_) {
//                               if (_confirmPasswordError != null) {
//                                 setState(() => _confirmPasswordError = null);
//                               }
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                     if (_passwordError == null && _confirmPasswordError == null) ...[
//                       SizedBox(height: 6.h),
//                       Text(
//                         'eg. Abcdefgh minimum 8 characters - maximum 20',
//                         style: GoogleFonts.tasaOrbiter(
//                           fontSize: 11.sp,
//                           color: AppColors.hintText,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ],

//                     SizedBox(height: 20.h),
//                     _FieldLabel('Marital Status', required: true),
//                     SizedBox(height: 8.h),
//                     _buildDropdownField(
//                       hint: 'Select Marital Status',
//                       value: _maritalStatus,
//                       items: _maritalStatusOptions,
//                       onChanged: (value) => setState(() => _maritalStatus = value),
//                     ),

//                     // SizedBox(height: 20.h),
//                     // _FieldLabel('Religion', required: true),
//                     // SizedBox(height: 8.h),
//                     // _buildDropdownField(
//                     //   hint: 'Select Religion',
//                     //   value: _religion,
//                     //   items: _religionOptions,
//                     //   onChanged: (value) => setState(() => _religion = value),
//                     // ),

//                     // SizedBox(height: 20.h),
//                     // _FieldLabel('Mother Tongue', required: true),
//                     // SizedBox(height: 8.h),
//                     // _buildDropdownField(
//                     //   hint: 'Select Mother Tongue',
//                     //   value: _motherTongue,
//                     //   items: _motherTongueOptions,
//                     //   onChanged: (value) => setState(() => _motherTongue = value),
//                     // ),

//                     SizedBox(height: 32.h),
//                   ],
//                 ),
//               ),
//             ),
//             _buildBottomArea(),
//           ],
//         ),
//       ),
//     );
//   }

//   // ---------------------------------------------------------------------
//   // Top bar: back button + progress track
//   // ---------------------------------------------------------------------
//   Widget _buildTopBar() {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 0),
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: () => Navigator.of(context).pop(),
//             child: Container(
//               width: 36.w,
//               height: 36.w,
//               decoration: const BoxDecoration(
//                 color: AppColors.fieldBg,
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(Icons.arrow_back_rounded, color: AppColors.ink, size: 18.sp),
//             ),
//           ),
//           SizedBox(width: 14.w),
//           Expanded(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(4.r),
//               child: LinearProgressIndicator(
//                 // Onboarding → Initial Info (1st) → OTP Verify (2nd) → Basic Info (3rd)
//                 value: 2 / 8,
//                 minHeight: 6.h,
//                 backgroundColor: AppColors.trackBg,
//                 valueColor: const AlwaysStoppedAnimation<Color>(AppColors.coral),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ---------------------------------------------------------------------
//   // Gender chip selector
//   // ---------------------------------------------------------------------
//   Widget _buildGenderSelector() {
//     return Wrap(
//       spacing: 10.w,
//       runSpacing: 10.h,
//       children: ['Male', 'Female'].map((option) {
//         final bool selected = _gender == option;
//         return GestureDetector(
//           onTap: () => setState(() => _gender = option),
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 150),
//             padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
//             decoration: BoxDecoration(
//               color: selected ? AppColors.coral : AppColors.subtleWhite,
//               borderRadius: BorderRadius.circular(24.r),
//               border: Border.all(
//                 color: AppColors.coral,
//                 width: 1.2,
//               ),
//             ),
//             child: Text(
//               option,
//               style: GoogleFonts.tasaOrbiter(
//                 fontSize: 10.5.sp,
//                 fontWeight: FontWeight.w600,
//                 color: selected ? AppColors.subtleWhite : AppColors.coral,
//               ),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   // ---------------------------------------------------------------------
//   // Text field
//   // ---------------------------------------------------------------------
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hint,
//     TextInputType? keyboardType,
//     TextCapitalization textCapitalization = TextCapitalization.none,
//     String? errorText,
//     ValueChanged<String>? onChanged,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           height: 52.h,
//           alignment: Alignment.centerLeft,
//           decoration: BoxDecoration(
//             color: AppColors.fieldBg,
//             borderRadius: BorderRadius.circular(14.r),
//             border: errorText != null ? Border.all(color: AppColors.error, width: 1.2) : null,
//           ),
//           child: TextFormField(
//             controller: controller,
//             keyboardType: keyboardType,
//             textCapitalization: textCapitalization,
//             onChanged: onChanged,
//             style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: AppColors.ink, fontWeight: FontWeight.w500),
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: AppColors.hintText, fontWeight: FontWeight.w400),
//               border: InputBorder.none,
//               errorBorder: InputBorder.none,
//               focusedBorder: InputBorder.none,
//               enabledBorder: InputBorder.none,
//               isDense: true,
//               isCollapsed: true,
//               contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
//             ),
//           ),
//         ),
//         if (errorText != null) ...[
//           SizedBox(height: 6.h),
//           Text(
//             errorText,
//             style: GoogleFonts.tasaOrbiter(fontSize: 11.sp, color: AppColors.error, fontWeight: FontWeight.w500),
//           ),
//         ],
//       ],
//     );
//   }

//   // ---------------------------------------------------------------------
//   // Password field (with show/hide toggle)
//   // ---------------------------------------------------------------------
//   Widget _buildPasswordField({
//     required TextEditingController controller,
//     required bool obscure,
//     required VoidCallback onToggleObscure,
//     String? errorText,
//     ValueChanged<String>? onChanged,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           height: 52.h,
//           alignment: Alignment.centerLeft,
//           decoration: BoxDecoration(
//             color: AppColors.fieldBg,
//             borderRadius: BorderRadius.circular(14.r),
//             border: errorText != null ? Border.all(color: AppColors.error, width: 1.2) : null,
//           ),
//           child: TextFormField(
//             controller: controller,
//             obscureText: obscure,
//             onChanged: onChanged,
//             style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: AppColors.ink, fontWeight: FontWeight.w500),
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               errorBorder: InputBorder.none,
//               focusedBorder: InputBorder.none,
//               enabledBorder: InputBorder.none,
//               isDense: true,
//               isCollapsed: true,
//               contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
//               suffixIcon: GestureDetector(
//                 onTap: onToggleObscure,
//                 child: Padding(
//                   padding: EdgeInsets.only(right: 14.w),
//                   child: Icon(
//                     obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
//                     color: AppColors.hintText,
//                     size: 18.sp,
//                   ),
//                 ),
//               ),
//               suffixIconConstraints: BoxConstraints(minWidth: 40.w, minHeight: 20.h),
//             ),
//           ),
//         ),
//         if (errorText != null) ...[
//           SizedBox(height: 6.h),
//           Text(
//             errorText,
//             style: GoogleFonts.tasaOrbiter(fontSize: 11.sp, color: AppColors.error, fontWeight: FontWeight.w500),
//           ),
//         ],
//       ],
//     );
//   }

//   // ---------------------------------------------------------------------
//   // Date of Birth field (opens a date picker)
//   // ---------------------------------------------------------------------
//   Widget _buildDateField() {
//     return GestureDetector(
//       onTap: _pickDob,
//       child: Container(
//         height: 52.h,
//         padding: EdgeInsets.symmetric(horizontal: 18.w),
//         decoration: BoxDecoration(
//           color: AppColors.fieldBg,
//           borderRadius: BorderRadius.circular(14.r),
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Text(
//                 _dobController.text.isEmpty ? 'DD-MM-YYYY' : _dobController.text,
//                 style: GoogleFonts.tasaOrbiter(
//                   fontSize: 13.sp,
//                   fontWeight: _dobController.text.isEmpty ? FontWeight.w400 : FontWeight.w500,
//                   color: _dobController.text.isEmpty ? AppColors.hintText : AppColors.ink,
//                 ),
//               ),
//             ),
//             Icon(Icons.calendar_today_rounded, color: AppColors.ink, size: 16.sp),
//           ],
//         ),
//       ),
//     );
//   }

//   // ---------------------------------------------------------------------
//   // Dropdown field (Marital Status / Religion / Mother Tongue)
//   // ---------------------------------------------------------------------
//   Widget _buildDropdownField({
//     required String hint,
//     required String? value,
//     required List<String> items,
//     required ValueChanged<String?> onChanged,
//   }) {
//     return Container(
//       constraints: BoxConstraints(minHeight: 52.h),
//       padding: EdgeInsets.symmetric(horizontal: 18.w),
//       alignment: Alignment.centerLeft,
//       decoration: BoxDecoration(
//         color: AppColors.fieldBg,
//         borderRadius: BorderRadius.circular(14.r),
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButtonFormField<String>(
//           initialValue: value,
//           isExpanded: true,
//           icon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.ink, size: 22.sp),
//           decoration: InputDecoration(
//             border: InputBorder.none,
//             isDense: true,
//             contentPadding: EdgeInsets.symmetric(vertical: 14.h),
//           ),
//           hint: Text(
//             hint,
//             style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: AppColors.hintText, fontWeight: FontWeight.w400),
//           ),
//           style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: AppColors.ink, fontWeight: FontWeight.w500),
//           dropdownColor: AppColors.subtleWhite,
//           borderRadius: BorderRadius.circular(14.r),
//           items: items
//               .map((item) => DropdownMenuItem<String>(
//                     value: item,
//                     child: Text(item),
//                   ))
//               .toList(),
//           onChanged: onChanged,
//         ),
//       ),
//     );
//   }

//   // ---------------------------------------------------------------------
//   // Bottom area: Continue button
//   // ---------------------------------------------------------------------
//   Widget _buildBottomArea() {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 20.h),
//       child: SizedBox(
//         width: double.infinity,
//         height: 40.h,
//         child: ElevatedButton(
//           onPressed: _handleContinue,
//           style: ElevatedButton.styleFrom(
//             backgroundColor: AppColors.coral,
//             foregroundColor: AppColors.subtleWhite,
//             elevation: 0,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(28.r),
//             ),
//           ),
//           child: Text(
//             'Continue',
//             style: GoogleFonts.tasaOrbiter(
//               fontSize: 16.sp,
//               fontWeight: FontWeight.w700,
//               letterSpacing: 0.1,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// Small reusable field label used above every input on this screen.
// /// Pass [required] to append a red asterisk, matching the reference design.
// class _FieldLabel extends StatelessWidget {
//   final String text;
//   final bool required;
//   const _FieldLabel(this.text, {this.required = false});

//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//       text: TextSpan(
//         text: text,
//         style: GoogleFonts.tasaOrbiter(
//           fontSize: 13.sp,
//           fontWeight: FontWeight.w600,
//           color: AppColors.ink,
//         ),
//         children: required
//             ? [
//                 TextSpan(
//                   text: ' *',
//                   style: GoogleFonts.tasaOrbiter(
//                     fontSize: 13.sp,
//                     fontWeight: FontWeight.w600,
//                     color: AppColors.error,
//                   ),
//                 ),
//               ]
//             : null,
//       ),
//     );
//   }
// }

// ═══════════════════════════════════════════════════════════════
//  3a. BASIC INFORMATION
// ═══════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/model/gender_model.dart';
import 'package:matrimony_app/provider/register_provider.dart';
import 'package:matrimony_app/services/provider_helper_class.dart';
import 'package:matrimony_app/view/communtiy_location_screen.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:provider/provider.dart';

class BasicInfoScreen extends StatefulWidget {
  const BasicInfoScreen({super.key});

  @override
  State<BasicInfoScreen> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfoScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Gender? _gender;
  DateTime? _dob;
  String? _maritalStatus;
  String? _religion;
  String? _motherTongue;

  String? _fullNameError;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isSubmitting = false;

  final List<String> _maritalStatusOptions = const [
    'Never Married',
    'Divorced',
    'Widowed',
    'Separated',
  ];

  final List<String> _religionOptions = const [
    'Hindu',
    'Muslim',
    'Christian',
    'Sikh',
    'Jain',
    'Buddhist',
    'Other',
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<RegisterProvider>().getGenders();
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _dobController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _pickDob() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _dob ?? DateTime(now.year - 21, now.month, now.day),
      firstDate: DateTime(now.year - 100),
      lastDate: DateTime(now.year - 18, now.month, now.day),
    );
    if (picked == null) return;
    setState(() {
      _dob = picked;
      _dobController.text =
          '${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}';
    });
  }

  bool _isValidEmail(String value) {
    return RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[\w\-]{2,4}$').hasMatch(value);
  }

  // Drives the Continue button's coral/grey state. Only checks the fields
  // currently active on screen (Marital Status is commented out above).
  bool get _isFormValid {
    if (_gender == null || _dob == null) return false;
    final email = _emailController.text.trim();
    if (email.isEmpty || !_isValidEmail(email)) return false;
    final password = _passwordController.text;
    if (password.length < 8 || password.length > 20) return false;
    if (_confirmPasswordController.text != password) return false;
    return true;
  }

  void _handleContinue() {
    FocusScope.of(context).unfocus();

    setState(() {
      final email = _emailController.text.trim();
      if (email.isEmpty) {
        _emailError = 'Please enter your email id';
      } else if (!_isValidEmail(email)) {
        _emailError = 'Please enter a valid email id';
      } else {
        _emailError = null;
      }

      final password = _passwordController.text;
      if (password.isEmpty) {
        _passwordError = 'Please enter a password';
      } else if (password.length < 8 || password.length > 20) {
        _passwordError = 'Password must be 8-20 characters';
      } else {
        _passwordError = null;
      }

      final confirmPassword = _confirmPasswordController.text;
      if (confirmPassword.isEmpty) {
        _confirmPasswordError = 'Please confirm your password';
      } else if (confirmPassword != password) {
        _confirmPasswordError = 'Passwords do not match';
      } else {
        _confirmPasswordError = null;
      }
    });

    if (_gender == null) {
      _showSnack('Please select gender');
      return;
    }
    if (_dob == null) {
      _showSnack('Please select date of birth');
      return;
    }
    if (_emailError != null) return;
    if (_passwordError != null) return;
    if (_confirmPasswordError != null) return;

    setState(() => _isSubmitting = true);

    final dob = _dob!;
    // Backend expects PHP's d-m-Y format (day-month-year), not y-m-d.
    final dobFormatted =
        '${dob.day.toString().padLeft(2, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.year.toString().padLeft(4, '0')}';

    final provider = context.read<RegisterProvider>();
    provider
        .basicInfo(
      _emailController.text.trim(),
      _passwordController.text,
      _confirmPasswordController.text,
      dobFormatted,
      _gender!.id,
    )
        .then((success) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      if (success) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CommunityLocationScreen()),
        );
      } else {
        _showSnack(provider.basicInfoError ?? 'Something went wrong. Please try again');
      }
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
                      'Provide your basic information',
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.ink,
                        letterSpacing: -0.6,
                        height: 1.25,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // â”€â”€ Gender + Date of Birth (side by side) â”€â”€
                    // NOTE: Expanded only works when its immediate parent is a
                    // Row/Column with a BOUNDED main-axis size. This whole
                    // Column sits inside a SingleChildScrollView, which gives
                    // unbounded height â€” so the Expanded pair below MUST stay
                    // wrapped in a Row (bounded width). Removing that Row and
                    // leaving Expanded as a direct Column child is exactly
                    // what caused the "RenderFlex children have non-zero flex
                    // but incoming height constraints are unbounded" crash.
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _FieldLabel('Gender', required: true),
                        SizedBox(height: 10.h),
                        _buildGenderSelector(),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _FieldLabel('Date of Birth', required: true),
                        SizedBox(height: 8.h),
                        _buildDateField(),
                      ],
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Email', required: true),
                    SizedBox(height: 8.h),
                    _buildTextField(
                      controller: _emailController,
                      hint: 'Your Email',
                      keyboardType: TextInputType.emailAddress,
                      errorText: _emailError,
                      onChanged: (_) => setState(() {
                        if (_emailError != null) _emailError = null;
                      }),
                    ),
                    SizedBox(height: 20.h),

                    // â”€â”€ Password + Confirm Password (side by side) â”€â”€
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _FieldLabel('Password', required: true),
                        SizedBox(height: 8.h),
                        _buildPasswordField(
                          controller: _passwordController,
                          obscure: _obscurePassword,
                          errorText: _passwordError,
                          onToggleObscure: () => setState(
                            () => _obscurePassword = !_obscurePassword,
                          ),
                          onChanged: (_) => setState(() {
                            if (_passwordError != null) _passwordError = null;
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _FieldLabel('Confirm Password', required: true),
                        SizedBox(height: 8.h),
                        _buildPasswordField(
                          controller: _confirmPasswordController,
                          obscure: _obscureConfirmPassword,
                          errorText: _confirmPasswordError,
                          onToggleObscure: () => setState(
                            () => _obscureConfirmPassword =
                                !_obscureConfirmPassword,
                          ),
                          onChanged: (_) => setState(() {
                            if (_confirmPasswordError != null)
                              _confirmPasswordError = null;
                          }),
                        ),
                      ],
                    ),
                    if (_passwordError == null &&
                        _confirmPasswordError == null) ...[
                      SizedBox(height: 6.h),
                      Text(
                        'eg. Abcdefgh minimum 8 characters - maximum 20',
                        style: GoogleFonts.tasaOrbiter(
                          fontSize: 11.sp,
                          color: AppColors.hintText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],

                    // SizedBox(height: 20.h),
                    // _FieldLabel('Marital Status', required: true),
                    // SizedBox(height: 8.h),
                    // _buildDropdownField(
                    //   hint: 'Select Marital Status',
                    //   value: _maritalStatus,
                    //   items: _maritalStatusOptions,
                    //   onChanged: (value) => setState(() => _maritalStatus = value),
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
                color: AppColors.fieldBg,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back_rounded,
                color: AppColors.ink,
                size: 18.sp,
              ),
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: LinearProgressIndicator(
                // Onboarding → Initial Info (1st) → OTP Verify (2nd) → Basic Info (3rd)
                value: 2 / 8,
                minHeight: 6.h,
                backgroundColor: AppColors.trackBg,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.coral,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Gender chip selector
  // ---------------------------------------------------------------------
  Widget _buildGenderSelector() {
    return Consumer<RegisterProvider>(
      builder: (context,provider,child) {
        if(provider.loaderState == LoaderState.loading
        && provider.genderModel == null){
          return SizedBox(
            height: 40.h,
            child: Center(
              child: CircularProgressIndicator(color: AppColors.coralDark),
            ),
          );
        }
         final List<Gender> options =
            provider.genderModel?.genders ?? [];

        // Failed / empty state — let the user retry.
        if (options.isEmpty) {
          return GestureDetector(
            onTap: () => provider.createdFors(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColors.fieldBg,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Text(
                'Couldn\'t load options. Tap to retry',
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 12.sp,
                  color: AppColors.hintText,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }    
        return Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: options.map((option) {
            final bool selected = _gender?.id == option.id;
            return GestureDetector(
              onTap: () => setState(() => _gender = option),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
                decoration: BoxDecoration(
                  color: selected ? AppColors.coral : AppColors.subtleWhite,
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(color: AppColors.coral, width: 1.2),
                ),
                child: Text(
                  option.name,
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 10.5.sp,
                    fontWeight: FontWeight.w600,
                    color: selected ? AppColors.subtleWhite : AppColors.coral,
                  ),
                ),
              ),
            );
          }).toList(),
        );
      }
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
  // Password field (with show/hide toggle)
  // ---------------------------------------------------------------------
  Widget _buildPasswordField({
    required TextEditingController controller,
    required bool obscure,
    required VoidCallback onToggleObscure,
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
            obscureText: obscure,
            onChanged: onChanged,
            style: GoogleFonts.tasaOrbiter(
              fontSize: 13.sp,
              color: AppColors.ink,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
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
              suffixIcon: GestureDetector(
                onTap: onToggleObscure,
                child: Padding(
                  padding: EdgeInsets.only(right: 14.w),
                  child: Icon(
                    obscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.hintText,
                    size: 18.sp,
                  ),
                ),
              ),
              suffixIconConstraints: BoxConstraints(
                minWidth: 40.w,
                minHeight: 20.h,
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
  // Date of Birth field (opens a date picker)
  // ---------------------------------------------------------------------
  Widget _buildDateField() {
    return GestureDetector(
      onTap: _pickDob,
      child: Container(
        height: 44.h,
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        decoration: BoxDecoration(
          color: AppColors.fieldBg,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                _dobController.text.isEmpty
                    ? 'DD-MM-YYYY'
                    : _dobController.text,
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 13.sp,
                  fontWeight: _dobController.text.isEmpty
                      ? FontWeight.w400
                      : FontWeight.w500,
                  color: _dobController.text.isEmpty
                      ? AppColors.hintText
                      : AppColors.ink,
                ),
              ),
            ),
            Icon(
              Icons.calendar_today_rounded,
              color: AppColors.ink,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Dropdown field (Marital Status)
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
  // Bottom area: Continue button
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
            backgroundColor: _isFormValid ? AppColors.coral : AppColors.grey,
            disabledBackgroundColor: AppColors.coral,
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
/// Pass [required] to append a red asterisk, matching the reference design.
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
          color: AppColors.ink,
        ),
        children: required
            ? [
                TextSpan(
                  text: ' *',
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.error,
                  ),
                ),
              ]
            : null,
      ),
    );
  }
}
