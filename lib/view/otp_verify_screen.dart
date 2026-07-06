import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matrimony_app/view/basic_info_screen.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
import 'package:matrimony_app/view/custom_widgets/section_header.dart';
import 'package:matrimony_app/view/custom_widgets/top_bar.dart';


class OtpVerifyScreen extends StatefulWidget {
  final String mobile;
  final Widget? nextScreen;
  const OtpVerifyScreen({super.key, required this.mobile, this.nextScreen});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final List<TextEditingController> _ctrl =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focus = List.generate(6, (_) => FocusNode());
  int _seconds = 30;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() async {
    while (_seconds > 0 && mounted) {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) setState(() => _seconds--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlushScaffold(
      child: Column(
        children: [
          TopBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  // Icon circle
                  Container(
                    width: 80, height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.kAccent.withOpacity(0.12),
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppColors.kAccent.withOpacity(0.3), width: 2),
                    ),
                    child: const Icon(Icons.message_rounded,
                        color: AppColors.kAccent, size: 34),
                  ),
                  const SizedBox(height: 20),
                  // const SectionHeader(
                  //   tag: 'VERIFY',
                  //   title: 'Check your messages',
                  //   subtitle: 'We sent a 6-digit code to',
                  // ),
                  Column( children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.kAccent.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.kAccent.withOpacity(0.3)),
                      ),
                      child: Text("VERIFY",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2,
                            color: AppColors.kAccent,
                          )),
                    ),
                    const SizedBox(height: 8),
                    Text('Check your messages',
                        style: const TextStyle(
                          fontFamily: 'Georgia',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.kDarkSlate,
                          height: 1.2,
                        )),
                    const SizedBox(height: 4),
                    Text('We sent a 6-digit code to',
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.kTextMuted, height: 1.4)),
                  ]),
                  const SizedBox(height: 4),
                  Text(
                    '+91 ${widget.mobile.isEmpty ? "XXXXXXXXXX" : widget.mobile}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kAccent,
                    ),
                  ),
                  const SizedBox(height: 28),
                  FloatingCard(
                    child: Column(children: [
                      // OTP boxes
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(6, (i) {
                          return Container(
                            width: 44, height: 52,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            child: TextField(
                              controller: _ctrl[i],
                              focusNode: _focus[i],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.kDarkSlate),
                              decoration: InputDecoration(
                                counterText: '',
                                contentPadding: EdgeInsets.zero,
                                filled: true,
                                fillColor: AppColors.kCardBg,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      const BorderSide(color: AppColors.kBorder),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: AppColors.kAccent, width: 2),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      const BorderSide(color: AppColors.kBorder),
                                ),
                              ),
                              onChanged: (val) {
                                if (val.isNotEmpty && i < 5) {
                                  _focus[i + 1].requestFocus();
                                } else if (val.isEmpty && i > 0) {
                                  _focus[i - 1].requestFocus();
                                }
                              },
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 28),
                      CTAButton(
                        label: 'Verify & Continue',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  widget.nextScreen ?? const BasicInfoScreen()),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _seconds > 0
                          ? Text('Resend OTP in ${_seconds}s',
                              style: const TextStyle(
                                  fontSize: 13, color: AppColors.kTextMuted))
                          : GestureDetector(
                              onTap: () {
                                setState(() => _seconds = 30);
                                _startTimer();
                              },
                              child: const Text('Resend OTP',
                                  style: TextStyle(
                                      color: AppColors.kAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13)),
                            ),
                    ]),
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