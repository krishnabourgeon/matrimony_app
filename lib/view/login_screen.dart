// ═══════════════════════════════════════════════════════════════
//  4. LOGIN SCREEN
// ═══════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/field.dart';
import 'package:matrimony_app/view/custom_widgets/field_warp.dart';
import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
import 'package:matrimony_app/view/custom_widgets/section_header.dart';
import 'package:matrimony_app/view/custom_widgets/top_bar.dart';
import 'package:matrimony_app/view/initial_info_screen.dart';
import 'package:matrimony_app/view/otp_verify_screen.dart';
import 'package:matrimony_app/view/subscription_plan_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPass = false;
  String _loginWith = 'OTP'; // 'OTP' or 'Password'

  final _phoneCtrl = TextEditingController();
  final _identifierCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void dispose() {
    _phoneCtrl.dispose();
    _identifierCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  void _sendOtp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OtpVerifyScreen(
          mobile: _phoneCtrl.text,
          nextScreen: const SubscriptionPlanScreen(),
        ),
      ),
    );
  }

  void _loginWithPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SubscriptionPlanScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlushScaffold(
      child: Column(
        children: [
          TopBar(showBack: false),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 12),

                  // Heart icon
                  Container(
                    width: 72, height: 72,
                    decoration: BoxDecoration(
                      color: AppColors.kAccent.withOpacity(0.12),
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppColors.kAccent.withOpacity(0.3), width: 2),
                    ),
                    child: const Icon(Icons.favorite_rounded,
                        color: AppColors.kAccent, size: 34),
                  ),
                  const SizedBox(height: 16),

                  const SectionHeader(
                    tag: 'WELCOME BACK',
                    title: 'Login to Your\nAccount',
                    subtitle:
                        'Continue your journey to find your perfect match',
                  ),
                  const SizedBox(height: 24),

                  FloatingCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // OTP / Password toggle
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColors.kCardBg,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.kBorder),
                          ),
                          child: Row(
                            children: ['OTP', 'Password'].map((opt) {
                              final sel = _loginWith == opt;
                              return Expanded(
                                child: GestureDetector(
                                  onTap: () =>
                                      setState(() => _loginWith = opt),
                                  child: AnimatedContainer(
                                    duration:
                                        const Duration(milliseconds: 200),
                                    height: 38,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: sel ? AppColors.kAccent : Colors.transparent,
                                      borderRadius:
                                          BorderRadius.circular(10),
                                      boxShadow: sel
                                          ? [
                                              BoxShadow(
                                                  color: AppColors.kAccent
                                                      .withOpacity(0.3),
                                                  blurRadius: 8,
                                                  offset:
                                                      const Offset(0, 3))
                                            ]
                                          : [],
                                    ),
                                    child: Text('Login with $opt',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: sel
                                              ? AppColors.kWhite
                                              : AppColors.kTextMuted,
                                        )),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(height: 18),

                        if (_loginWith == 'OTP') ...[
                          // Phone number field
                          FieldWrap(
                            'Phone Number',
                            required: true,
                            child: Field(
                              controller: _phoneCtrl,
                              hint: 'Enter mobile number',
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                          const SizedBox(height: 20),

                          CTAButton(label: 'Send OTP', onTap: _sendOtp),
                        ] else ...[
                          // Phone / email field
                          FieldWrap(
                            'Phone Number / Email',
                            required: true,
                            child: Field(
                              controller: _identifierCtrl,
                              hint: 'you@example.com or +91XXXXXXXXXX',
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          const SizedBox(height: 14),

                          // Password
                          FieldWrap('Enter Password',
                              required: true,
                              child: Field(
                                controller: _passwordCtrl,
                                hint: '••••••••',
                                obscure: !_showPass,
                                suffix: IconButton(
                                  icon: Icon(
                                    _showPass
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: AppColors.kTextMuted, size: 20,
                                  ),
                                  onPressed: () =>
                                      setState(() => _showPass = !_showPass),
                                ),
                              )),
                          const SizedBox(height: 8),

                          // Forgot password
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {},
                              child: const Text('Forgot Password?',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.kAccent,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                          const SizedBox(height: 20),

                          CTAButton(
                              label: 'Proceed', onTap: _loginWithPassword),
                        ],
                        const SizedBox(height: 20),

                        Center(
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const InitialInfoScreen()),
                            ),
                            child: RichText(
                              text: const TextSpan(
                                text: 'Not a member? ',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.kTextMuted),
                                children: [
                                  TextSpan(
                                    text: 'Register Free',
                                    style: TextStyle(
                                        color: AppColors.kAccent,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
