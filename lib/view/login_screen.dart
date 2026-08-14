// // ═══════════════════════════════════════════════════════════════
// //  4. LOGIN SCREEN
// // ═══════════════════════════════════════════════════════════════

// import 'package:flutter/material.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// import 'package:matrimony_app/view/custom_widgets/field.dart';
// import 'package:matrimony_app/view/custom_widgets/field_warp.dart';
// import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
// import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
// import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
// import 'package:matrimony_app/view/custom_widgets/top_bar.dart';
// import 'package:matrimony_app/view/initial_info_screen.dart';
// import 'package:matrimony_app/view/otp_verify_screen.dart';
// import 'package:matrimony_app/view/subscription_plan_screen.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool _showPass = false;
//   String _loginWith = 'OTP'; // 'OTP' or 'Password'

//   final _phoneCtrl = TextEditingController();
//   final _identifierCtrl = TextEditingController();
//   final _passwordCtrl = TextEditingController();

//   @override
//   void dispose() {
//     _phoneCtrl.dispose();
//     _identifierCtrl.dispose();
//     _passwordCtrl.dispose();
//     super.dispose();
//   }

//   void _sendOtp() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => OtpVerifyScreen(
//           mobile: _phoneCtrl.text,
//           nextScreen: const SubscriptionPlanScreen(),
//         ),
//       ),
//     );
//   }

//   void _loginWithPassword() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => const SubscriptionPlanScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlushScaffold(
//       child: Column(
//         children: [
//           TopBar(showBack: false),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 12),

//                   // Heart icon
//                   Container(
//                     width: 72, height: 72,
//                     decoration: BoxDecoration(
//                       color: AppColors.kAccent.withOpacity(0.12),
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                           color: AppColors.kAccent.withOpacity(0.3), width: 2),
//                     ),
//                     child: const Icon(Icons.favorite_rounded,
//                         color: AppColors.kAccent, size: 34),
//                   ),
//                   const SizedBox(height: 16),

//                   // const SectionHeader(
//                   //   tag: 'WELCOME BACK',
//                   //   title: 'Login to Your\nAccount',
//                   //   subtitle:
//                   //       'Continue your journey to find your perfect match',
//                   //   centerAligned: true,
//                   // ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                         decoration: BoxDecoration(
//                           color: AppColors.kAccent.withOpacity(0.12),
//                             borderRadius: BorderRadius.circular(20),
//                           border: Border.all(color: AppColors.kAccent.withOpacity(0.3)),
//                         ),
//                         child: Text('WELCOME BACK',
//                             style: const TextStyle(
//                               fontSize: 10,
//                               fontWeight: FontWeight.w700,
//                               letterSpacing: 2,
//                               color: AppColors.kAccent,
//                             )),
//                       ),
//                   const SizedBox(height: 8),
//                   Text('Login to Your Account',
//                       style: const TextStyle(
//                         fontFamily: 'Georgia',
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.kDarkSlate,
//                         height: 1.2,
//                       )),
//                   const SizedBox(height: 4),
//                   Text('Continue your journey to find your perfect match',
//                       style: const TextStyle(
//                           fontSize: 12, color: AppColors.kTextMuted, height: 1.4)),
//                 ]),
//                   const SizedBox(height: 24),

//                   FloatingCard(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // OTP / Password toggle
//                         Container(
//                           padding: const EdgeInsets.all(4),
//                           decoration: BoxDecoration(
//                             color: AppColors.kCardBg,
//                             borderRadius: BorderRadius.circular(12),
//                             border: Border.all(color: AppColors.kBorder),
//                           ),
//                           child: Row(
//                             children: ['OTP', 'Password'].map((opt) {
//                               final sel = _loginWith == opt;
//                               return Expanded(
//                                 child: GestureDetector(
//                                   onTap: () =>
//                                       setState(() => _loginWith = opt),
//                                   child: AnimatedContainer(
//                                     duration:
//                                         const Duration(milliseconds: 200),
//                                     height: 38,
//                                     alignment: Alignment.center,
//                                     decoration: BoxDecoration(
//                                       color: sel ? AppColors.kAccent : Colors.transparent,
//                                       borderRadius:
//                                           BorderRadius.circular(10),
//                                       boxShadow: sel
//                                           ? [
//                                               BoxShadow(
//                                                   color: AppColors.kAccent
//                                                       .withOpacity(0.3),
//                                                   blurRadius: 8,
//                                                   offset:
//                                                       const Offset(0, 3))
//                                             ]
//                                           : [],
//                                     ),
//                                     child: Text('Login with $opt',
//                                         style: TextStyle(
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w600,
//                                           color: sel
//                                               ? AppColors.kWhite
//                                               : AppColors.kTextMuted,
//                                         )),
//                                   ),
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                         const SizedBox(height: 18),

//                         if (_loginWith == 'OTP') ...[
//                           // Phone number field
//                           FieldWrap(
//                             'Phone Number',
//                             required: true,
//                             child: Field(
//                               controller: _phoneCtrl,
//                               hint: 'Enter mobile number',
//                               keyboardType: TextInputType.phone,
//                             ),
//                           ),
//                           const SizedBox(height: 20),

//                           CTAButton(label: 'Send OTP', onTap: _sendOtp),
//                         ] else ...[
//                           // Phone / email field
//                           FieldWrap(
//                             'Phone Number / Email',
//                             required: true,
//                             child: Field(
//                               controller: _identifierCtrl,
//                               hint: 'you@example.com or +91XXXXXXXXXX',
//                               keyboardType: TextInputType.emailAddress,
//                             ),
//                           ),
//                           const SizedBox(height: 14),

//                           // Password
//                           FieldWrap('Enter Password',
//                               required: true,
//                               child: Field(
//                                 controller: _passwordCtrl,
//                                 hint: '••••••••',
//                                 obscure: !_showPass,
//                                 suffix: IconButton(
//                                   icon: Icon(
//                                     _showPass
//                                         ? Icons.visibility_outlined
//                                         : Icons.visibility_off_outlined,
//                                     color: AppColors.kTextMuted, size: 20,
//                                   ),
//                                   onPressed: () =>
//                                       setState(() => _showPass = !_showPass),
//                                 ),
//                               )),
//                           const SizedBox(height: 8),

//                           // Forgot password
//                           Align(
//                             alignment: Alignment.centerRight,
//                             child: GestureDetector(
//                               onTap: () {},
//                               child: const Text('Forgot Password?',
//                                   style: TextStyle(
//                                       fontSize: 12,
//                                       color: AppColors.kAccent,
//                                       fontWeight: FontWeight.w600)),
//                             ),
//                           ),
//                           const SizedBox(height: 20),

//                           CTAButton(
//                               label: 'Proceed', onTap: _loginWithPassword),
//                         ],
//                         const SizedBox(height: 20),

//                         Center(
//                           child: GestureDetector(
//                             onTap: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (_) => const InitialInfoScreen()),
//                             ),
//                             child: RichText(
//                               text: const TextSpan(
//                                 text: 'Not a member? ',
//                                 style: TextStyle(
//                                     fontSize: 13,
//                                     color: AppColors.kTextMuted),
//                                 children: [
//                                   TextSpan(
//                                     text: 'Register Free',
//                                     style: TextStyle(
//                                         color: AppColors.kAccent,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ],
//                               ),
//                             ),
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
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:matrimony_app/provider/register_provider.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/main_screen.dart';
import 'package:matrimony_app/view/otp_verify_screen.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();

  bool _isSubmitting = false;

  bool get _isPhoneValid => _phoneController.text.trim().length == 10;

  @override
  void dispose() {
    _phoneController.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  void _onContinuePressed() {
    if (!_isPhoneValid) return;
    FocusScope.of(context).unfocus();

    setState(() => _isSubmitting = true);
    final provider = context.read<RegisterProvider>();
    final mobile = _phoneController.text.trim();
    provider.signIn(mobile).then((success) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      if (success) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OtpVerifyScreen(mobile: mobile, nextScreen: const MainShell()),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(provider.signInError ?? 'Something went wrong. Please try again'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),

              // // Top row: back button + progress bar
              // Row(
              //   children: [
              //     _buildBackButton(),
              //     SizedBox(width: 16.w),
              //     Expanded(child: _buildProgressBar(progress: 0.18)),
              //   ],
              // ),

              SizedBox(height: 32.h),

              // Title
              Text(
                "Let's Verify Your\nNumber",
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  height: 1.15,
                ),
              ),

              SizedBox(height: 12.h),

              // Subtitle
              Text(
                "We'll send you a 4 digit OTP to verify your identity.",
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),

              SizedBox(height: 28.h),

              // Phone number field
              _buildPhoneField(),

              SizedBox(height: 24.h),

              // Continue button
              _buildContinueButton(),

              SizedBox(height: 20.h),

              // Terms text
              _buildTermsText(),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return GestureDetector(
      onTap: () => Navigator.of(context).maybePop(),
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_back,
          size: 20.sp,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildProgressBar({required double progress}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: LinearProgressIndicator(
        value: progress,
        minHeight: 6.h,
        backgroundColor: const Color(0xFFEAEAEA),
        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.coral),
      ),
    );
  }

  Widget _buildPhoneField() {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          SizedBox(width: 14.w),
          _buildCountryCodePicker(),
          Container(
            width: 1,
            height: 24.h,
            color: Colors.black12,
            margin: EdgeInsets.symmetric(horizontal: 12.w),
          ),
          Expanded(
            child: TextField(
              controller: _phoneController,
              focusNode: _phoneFocusNode,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              onChanged: (_) => setState(() {}),
              style: GoogleFonts.tasaOrbiter(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                hintText: 'Mobile Number',
                hintStyle: GoogleFonts.tasaOrbiter(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black38,
                ),
              ),
            ),
          ),
          SizedBox(width: 14.w),
        ],
      ),
    );
  }

  Widget _buildCountryCodePicker() {
    return GestureDetector(
      onTap: () {
        // TODO: open country code picker
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(3.r),
            child: Container(
              width: 22.w,
              height: 15.h,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFF9933),
                    Colors.white,
                    Color(0xFF138808),
                  ],
                  stops: [0.33, 0.5, 0.67],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          SizedBox(width: 6.w),
          Text(
            '+91',
            style: GoogleFonts.tasaOrbiter(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Icon(Icons.keyboard_arrow_down, size: 18.sp, color: Colors.black54),
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: (_isPhoneValid && !_isSubmitting) ? _onContinuePressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.coral,
          disabledBackgroundColor: AppColors.coral.withOpacity(0.5),
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
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                'Continue',
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  Widget _buildTermsText() {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.tasaOrbiter(
          fontSize: 12.5.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black54,
          height: 1.5,
        ),
        children: [
          const TextSpan(text: 'By continuing, you agree to the '),
          TextSpan(
            text: 'Privacy Policy',
            style: const TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.black87,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // TODO: navigate to privacy policy
              },
          ),
          const TextSpan(text: ' and '),
          TextSpan(
            text: 'Terms of Service',
            style: const TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.black87,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // TODO: navigate to terms of service
              },
          ),
        ],
      ),
    );
  }
}