// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:matrimony_app/view/basic_info_screen.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
// import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
// import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
// import 'package:matrimony_app/view/custom_widgets/top_bar.dart';


// class OtpVerifyScreen extends StatefulWidget {
//   final String mobile;
//   final Widget? nextScreen;
//   const OtpVerifyScreen({super.key, required this.mobile, this.nextScreen});

//   @override
//   State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
// }

// class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
//   final List<TextEditingController> _ctrl =
//       List.generate(6, (_) => TextEditingController());
//   final List<FocusNode> _focus = List.generate(6, (_) => FocusNode());
//   int _seconds = 30;

//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }

//   void _startTimer() async {
//     while (_seconds > 0 && mounted) {
//       await Future.delayed(const Duration(seconds: 1));
//       if (mounted) setState(() => _seconds--);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlushScaffold(
//       child: Column(
//         children: [
//           TopBar(),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 16),
//                   // Icon circle
//                   Container(
//                     width: 80, height: 80,
//                     decoration: BoxDecoration(
//                       color: AppColors.kAccent.withOpacity(0.12),
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                           color: AppColors.kAccent.withOpacity(0.3), width: 2),
//                     ),
//                     child: const Icon(Icons.message_rounded,
//                         color: AppColors.kAccent, size: 34),
//                   ),
//                   const SizedBox(height: 20),
//                   // const SectionHeader(
//                   //   tag: 'VERIFY',
//                   //   title: 'Check your messages',
//                   //   subtitle: 'We sent a 6-digit code to',
//                   // ),
//                   Column( children: [
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                       decoration: BoxDecoration(
//                         color: AppColors.kAccent.withOpacity(0.12),
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color: AppColors.kAccent.withOpacity(0.3)),
//                       ),
//                       child: Text("VERIFY",
//                           style: const TextStyle(
//                             fontSize: 10,
//                             fontWeight: FontWeight.w700,
//                             letterSpacing: 2,
//                             color: AppColors.kAccent,
//                           )),
//                     ),
//                     const SizedBox(height: 8),
//                     Text('Check your messages',
//                         style: const TextStyle(
//                           fontFamily: 'Georgia',
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.kDarkSlate,
//                           height: 1.2,
//                         )),
//                     const SizedBox(height: 4),
//                     Text('We sent a 4-digit code to',
//                         style: const TextStyle(
//                             fontSize: 12, color: AppColors.kTextMuted, height: 1.4)),
//                   ]),
//                   const SizedBox(height: 4),
//                   Text(
//                     '+91 ${widget.mobile.isEmpty ? "XXXXXXXXXX" : widget.mobile}',
//                     style: const TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.kAccent,
//                     ),
//                   ),
//                   const SizedBox(height: 28),
//                   FloatingCard(
//                     child: Column(children: [
//                       // OTP boxes
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: List.generate(4, (i) {
//                           return Container(
//                             width: 44, height: 52,
//                             margin: const EdgeInsets.symmetric(horizontal: 4),
//                             child: TextField(
//                               controller: _ctrl[i],
//                               focusNode: _focus[i],
//                               textAlign: TextAlign.center,
//                               keyboardType: TextInputType.number,
//                               maxLength: 1,
//                               inputFormatters: [
//                                 FilteringTextInputFormatter.digitsOnly
//                               ],
//                               style: const TextStyle(
//                                   fontSize: 22,
//                                   fontWeight: FontWeight.bold,
//                                   color: AppColors.kDarkSlate),
//                               decoration: InputDecoration(
//                                 counterText: '',
//                                 contentPadding: EdgeInsets.zero,
//                                 filled: true,
//                                 fillColor: AppColors.kCardBg,
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                   borderSide:
//                                       const BorderSide(color: AppColors.kBorder),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                   borderSide: const BorderSide(
//                                       color: AppColors.kAccent, width: 2),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                   borderSide:
//                                       const BorderSide(color: AppColors.kBorder),
//                                 ),
//                               ),
//                               onChanged: (val) {
//                                 if (val.isNotEmpty && i < 5) {
//                                   _focus[i + 1].requestFocus();
//                                 } else if (val.isEmpty && i > 0) {
//                                   _focus[i - 1].requestFocus();
//                                 }
//                               },
//                             ),
//                           );
//                         }),
//                       ),
//                       const SizedBox(height: 28),
//                       CTAButton(
//                         label: 'Verify & Continue',
//                         onTap: () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (_) =>
//                                   widget.nextScreen ?? const BasicInfoScreen()),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       _seconds > 0
//                           ? Text('Resend OTP in ${_seconds}s',
//                               style: const TextStyle(
//                                   fontSize: 13, color: AppColors.kTextMuted))
//                           : GestureDetector(
//                               onTap: () {
//                                 setState(() => _seconds = 30);
//                                 _startTimer();
//                               },
//                               child: const Text('Resend OTP',
//                                   style: TextStyle(
//                                       color: AppColors.kAccent,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 13)),
//                             ),
//                     ]),
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
import 'package:matrimony_app/provider/register_provider.dart';
import 'package:matrimony_app/view/basic_info_screen.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:provider/provider.dart';

class OtpVerifyScreen extends StatefulWidget {
  final String mobile;
  final Widget? nextScreen;
  const OtpVerifyScreen({super.key, required this.mobile, this.nextScreen});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final List<TextEditingController> _ctrl =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focus = List.generate(4, (_) => FocusNode());
  int _seconds = 90;
  bool _isSubmitting = false;

  // Step position in the overall flow — adjust to match your real step count.
  static const int _currentStep = 1;
  static const int _totalSteps = 8;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  bool get _isFormValid => _ctrl.every((c) => c.text.trim().isNotEmpty);

  void _handleContinue() {
    setState(() => _isSubmitting = true);
    String otpString = _ctrl.map((e) => e.text).join();
    int otp = int.parse(otpString);
    context.read<RegisterProvider>().verifyOtp(widget.mobile, otp).then((success) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      if (success) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => widget.nextScreen ?? const BasicInfoScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              context.read<RegisterProvider>().verifyOtpError ??
                  'Invalid OTP. Please try again',
            ),
            backgroundColor: AppColors.error,
          ),
        );
      }
    });
  }

  void _startTimer() async {
    while (_seconds > 0 && mounted) {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) setState(() => _seconds--);
    }
  }

  @override
  void dispose() {
    for (final c in _ctrl) {
      c.dispose();
    }
    for (final f in _focus) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.subtleWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button + progress bar
              Row(
                children: [
                  _BackButton(onTap: () => Navigator.of(context).pop()),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _ProgressBar(
                      current: _currentStep,
                      total: _totalSteps,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // Headline
               Text(
                "Let's Verify Your Number",
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: AppColors.ink,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "We'll sent a 4 digit code to verify\n+91 ${widget.mobile.isEmpty ? "XXXXXXXXXX" : widget.mobile}",
                style:  GoogleFonts.tasaOrbiter(
                  fontSize: 14,
                  color: AppColors.ink.withOpacity(0.55),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),

              // OTP boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (i) {
                  return _OtpBox(
                    controller: _ctrl[i],
                    focusNode: _focus[i],
                    onChanged: (val) => setState(() {
                      if (val.isNotEmpty && i < 3) {
                        _focus[i + 1].requestFocus();
                      } else if (val.isEmpty && i > 0) {
                        _focus[i - 1].requestFocus();
                      }
                    }),
                  );
                }),
              ),
              const SizedBox(height: 28),

              _buildBottomArea(),
              const SizedBox(height: 20),

              // _CTAButton(
              //   label: 'Continue',
              //   isEnabled: _isFormValid,
              //   isLoading: _isSubmitting,
              //   onTap: _isSubmitting ? null : _handleContinue,
              // ),
              const SizedBox(height: 20),

              Center(
                child: _seconds > 0
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "Didn't receive a code?",
                            style:  GoogleFonts.tasaOrbiter(
                              fontSize: 13,
                              color: AppColors.ink.withOpacity(0.45),
                            ),
                          ),
                          Text(
                            " Resend OTP in ${_seconds}s",
                            style:  GoogleFonts.tasaOrbiter(
                              fontSize: 13,
                              color: Colors.blue),
                            ),
                      ],
                    )
                    : GestureDetector(
                        onTap: () {
                          setState(() => _seconds = 30);
                          _startTimer();
                        },
                        child:  Text(
                          'Resend OTP',
                          style:  GoogleFonts.tasaOrbiter(
                            color: AppColors.coral,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
              ),
              // Center(
              //   child: Text("By proceeding with verification, you agree to be bound by our Terms of Use and acknowledge our Privacy Policy.",
              //   style:  GoogleFonts.tasaOrbiter(
              //     fontSize: 13,
              //     color: AppColors.ink.withOpacity(0.45),
              //   ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

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
                  'Verify Otp ',
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



// ── Shared local widgets ─────────────────────────────────────────

class _BackButton extends StatelessWidget {
  final VoidCallback onTap;
  const _BackButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: const Color(0xFFF3F3F5),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.arrow_back_rounded,
            color: AppColors.ink, size: 20),
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final int current;
  final int total;
  const _ProgressBar({required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    final fraction = (current / total).clamp(0.0, 1.0);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Container(
                height: 6,
                width: constraints.maxWidth,
                color: const Color(0xFFF0F0F0),
              ),
              Container(
                height: 6,
                width: constraints.maxWidth * fraction,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.coral, AppColors.coralDark],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _OtpBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  const _OtpBox({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 68,
      height: 64,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        style:  GoogleFonts.tasaOrbiter(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.ink,
        ),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: const Color(0xFFF3F3F5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppColors.coral, width: 2),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

class _CTAButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool isEnabled;
  final bool isLoading;
  const _CTAButton({
    required this.label,
    required this.onTap,
    this.isEnabled = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isEnabled ? AppColors.coral : AppColors.grey,         
          borderRadius: BorderRadius.circular(28),
          boxShadow: isEnabled
              ? [
                  BoxShadow(
                    color: AppColors.coral.withOpacity(0.35),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: isLoading
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.4,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.subtleWhite,
                  ),
                ),
              )
            : Text(
                label,
                style: const TextStyle(
                  color: AppColors.subtleWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
    );
  }
}