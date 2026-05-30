import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

class _BlushScaffold extends StatelessWidget {
  final Widget child;
  const _BlushScaffold({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.kBgGradient),
        child: SafeArea(child: child),
      ),
    );
  }
}

/// Top app-bar row
class _TopBar extends StatelessWidget {
  final String? title;
  final bool showBack;
  final VoidCallback? onBack;
  final Widget? trailing;
  const _TopBar({this.title, this.showBack = true, this.onBack, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          if (showBack)
            GestureDetector(
              onTap: onBack ?? () => Navigator.maybePop(context),
              child: Container(
                width: 38, height: 38,
                decoration: BoxDecoration(
                  color: AppColors.kWhite.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.kBorder),
                ),
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    size: 16, color: AppColors.kAccent),
              ),
            ),
          if (showBack) const SizedBox(width: 12),
          // Brand logo
          Row(children: [
            Container(
              width: 30, height: 30,
              decoration: BoxDecoration(
                color: AppColors.kAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.favorite_rounded,
                  color: AppColors.kWhite, size: 16),
            ),
            const SizedBox(width: 8),
            const Text('VivahBharath',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kDarkSlate,
                )),
          ]),
          const Spacer(),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

/// White floating card
class _FloatingCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  const _FloatingCard({required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.kAccent.withOpacity(0.12),
            blurRadius: 32,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: padding ?? const EdgeInsets.all(24),
      child: child,
    );
  }
}

/// Section header with accent underline
class _SectionHeader extends StatelessWidget {
  final String tag;
  final String title;
  final String subtitle;
  const _SectionHeader(
      {required this.tag, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.kAccent.withOpacity(0.12),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.kAccent.withOpacity(0.3)),
        ),
        child: Text(tag,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              color: AppColors.kAccent,
            )),
      ),
      const SizedBox(height: 8),
      Text(title,
          style: const TextStyle(
            fontFamily: 'Georgia',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.kDarkSlate,
            height: 1.2,
          )),
      const SizedBox(height: 4),
      Text(subtitle,
          style: const TextStyle(
              fontSize: 12, color: AppColors.kTextMuted, height: 1.4)),
    ]);
  }
}

/// Labelled field wrapper
class _FieldWrap extends StatelessWidget {
  final String label;
  final bool required;
  final Widget child;
  const _FieldWrap(this.label,
      {this.required = false, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      RichText(
        text: TextSpan(
          text: label,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.kSlate,
              fontFamily: 'Georgia'),
          children: required
              ? const [
                  TextSpan(
                      text: ' *',
                      style: TextStyle(color: AppColors.kAccent))
                ]
              : [],
        ),
      ),
      const SizedBox(height: 6),
      child,
    ]);
  }
}

/// Styled text field
class _Field extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscure;
  final Widget? suffix;
  final int maxLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;

  const _Field({
    required this.hint,
    this.controller,
    this.keyboardType,
    this.obscure = false,
    this.suffix,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscure,
      maxLines: maxLines,
      maxLength: maxLength,
      style: const TextStyle(fontSize: 13, color: AppColors.kDarkSlate, fontFamily: 'Georgia'),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.kTextMuted, fontSize: 13),
        suffixIcon: suffix,
        counterText: '',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        filled: true,
        fillColor: AppColors.kCardBg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.kBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.kBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.kAccent, width: 1.5),
        ),
      ),
    );
  }
}

/// Styled dropdown
class _Drop extends StatefulWidget {
  final String hint;
  final List<String> items;
  const _Drop({required this.hint, required this.items});

  @override
  State<_Drop> createState() => _DropState();
}

class _DropState extends State<_Drop> {
  String? _val;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.kCardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.kBorder),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _val,
          hint: Text(widget.hint,
              style: const TextStyle(color: AppColors.kTextMuted, fontSize: 13)),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.kAccent),
          style: const TextStyle(color: AppColors.kDarkSlate, fontSize: 13, fontFamily: 'Georgia'),
          dropdownColor: AppColors.kBgTop,
          items: widget.items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (v) => setState(() => _val = v),
        ),
      ),
    );
  }
}

/// Pill toggle button
class _Pill extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _Pill(
      {required this.label,
      required this.selected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? AppColors.kAccent : AppColors.kWhite,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: selected ? AppColors.kAccent : AppColors.kBorder, width: 1.4),
          boxShadow: selected
              ? [
                  BoxShadow(
                      color: AppColors.kAccent.withOpacity(0.25),
                      blurRadius: 8,
                      offset: const Offset(0, 3))
                ]
              : [],
        ),
        child: Text(label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: selected ? AppColors.kWhite : AppColors.kTextMuted,
            )),
      ),
    );
  }
}

/// Primary CTA button
class _CTAButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool outlined;
  const _CTAButton(
      {required this.label,
      required this.onTap,
      this.outlined = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: outlined ? AppColors.kWhite : AppColors.kAccent,
          borderRadius: BorderRadius.circular(14),
          border: outlined ? Border.all(color: AppColors.kAccent, width: 1.5) : null,
          boxShadow: outlined
              ? []
              : [
                  BoxShadow(
                    color: AppColors.kAccent.withOpacity(0.35),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  )
                ],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.4,
            color: outlined ? AppColors.kAccent : AppColors.kWhite,
          ),
        ),
      ),
    );
  }
}

/// Step progress indicator
class _StepBar extends StatelessWidget {
  final int current; // 1-based
  final int total;
  const _StepBar({required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(total, (i) {
        final done = i < current;
        final active = i == current - 1;
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(right: i < total - 1 ? 4 : 0),
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: done || active
                  ? AppColors.kAccent
                  : AppColors.kAccent.withOpacity(0.2),
            ),
          ),
        );
      }),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//  1. INITIAL INFO SCREEN
// ═══════════════════════════════════════════════════════════════

class InitialInfoScreen extends StatefulWidget {
  const InitialInfoScreen({super.key});

  @override
  State<InitialInfoScreen> createState() => _InitialInfoScreenState();
}

class _InitialInfoScreenState extends State<InitialInfoScreen> {
  String? _createdFor;
  final _nameCtrl = TextEditingController();
  final _mobileCtrl = TextEditingController();

  final _options = [
    'Myself', 'Son', 'Daughter', 'Brother', 'Sister', 'Friend / Relative'
  ];

  @override
  Widget build(BuildContext context) {
    return _BlushScaffold(
      child: Column(
        children: [
          _TopBar(
            showBack: false,
            trailing: TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const LoginScreen())),
              child: const Text('Login',
                  style: TextStyle(
                      color: AppColors.kAccent,
                      fontWeight: FontWeight.w700,
                      fontSize: 14)),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _SectionHeader(
                    tag: 'STEP 1',
                    title: "Let's get\nyou started",
                    subtitle: 'Create your profile in just a few steps',
                  ),
                  const SizedBox(height: 24),
                  _FloatingCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Created for
                        _FieldWrap('Profile Created For',
                            required: true,
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: _options.map((o) {
                                final sel = _createdFor == o;
                                return GestureDetector(
                                  onTap: () =>
                                      setState(() => _createdFor = o),
                                  child: AnimatedContainer(
                                    duration:
                                        const Duration(milliseconds: 200),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 8),
                                    decoration: BoxDecoration(
                                      color:
                                          sel ? AppColors.kAccent : AppColors.kCardBg,
                                      borderRadius:
                                          BorderRadius.circular(20),
                                      border: Border.all(
                                          color: sel
                                              ? AppColors.kAccent
                                              : AppColors.kBorder),
                                    ),
                                    child: Text(o,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: sel
                                              ? AppColors.kWhite
                                              : AppColors.kTextMuted,
                                        )),
                                  ),
                                );
                              }).toList(),
                            )),
                        const SizedBox(height: 16),

                        // Name
                        _FieldWrap('Full Name',
                            required: true,
                            child: _Field(
                                hint: 'Enter your full name',
                                controller: _nameCtrl)),
                        const SizedBox(height: 14),

                        // Mobile
                        _FieldWrap('Mobile Number',
                            required: true,
                            child: Row(children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 14),
                                decoration: BoxDecoration(
                                  color: AppColors.kCardBg,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: AppColors.kBorder),
                                ),
                                child: const Text('+91',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.kDarkSlate)),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                  child: _Field(
                                      hint: 'Enter mobile number',
                                      controller: _mobileCtrl,
                                      keyboardType:
                                          TextInputType.phone)),
                            ])),
                        const SizedBox(height: 4),
                        const Text(
                            'An OTP will be sent to verify your number',
                            style: TextStyle(
                                fontSize: 11, color: AppColors.kTextMuted)),
                        const SizedBox(height: 22),

                        _CTAButton(
                          label: 'Send OTP →',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => OtpVerifyScreen(
                                    mobile: _mobileCtrl.text)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const LoginScreen()),
                      ),
                      child: RichText(
                        text: const TextSpan(
                          text: 'Already have an account? ',
                          style:
                              TextStyle(fontSize: 13, color: AppColors.kTextMuted),
                          children: [
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                  color: AppColors.kAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
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

// ═══════════════════════════════════════════════════════════════
//  2. OTP VERIFY SCREEN
// ═══════════════════════════════════════════════════════════════

class OtpVerifyScreen extends StatefulWidget {
  final String mobile;
  const OtpVerifyScreen({super.key, required this.mobile});

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
    return _BlushScaffold(
      child: Column(
        children: [
          _TopBar(),
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
                  const _SectionHeader(
                    tag: 'VERIFY',
                    title: 'Check your\nmessages',
                    subtitle: 'We sent a 6-digit code to',
                  ),
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
                  _FloatingCard(
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
                      _CTAButton(
                        label: 'Verify & Continue',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const BasicInfoScreen()),
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

// ═══════════════════════════════════════════════════════════════
//  3a. BASIC INFORMATION
// ═══════════════════════════════════════════════════════════════

class BasicInfoScreen extends StatefulWidget {
  const BasicInfoScreen({super.key});

  @override
  State<BasicInfoScreen> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfoScreen> {
  String _gender = 'Male';
  bool _showPass = false;
  bool _showConfirm = false;

  @override
  Widget build(BuildContext context) {
    return _BlushScaffold(
      child: Column(
        children: [
          _TopBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _StepBar(current: 1, total: 4),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _SectionHeader(
                    tag: 'STEP 1 OF 4',
                    title: 'Basic\nInformation',
                    subtitle:
                        'Provide your basic information to get started',
                  ),
                  const SizedBox(height: 20),
                  _FloatingCard(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // DOB + Gender
                          Row(children: [
                            Expanded(
                              child: _FieldWrap('Date of Birth',
                                  required: true,
                                  child: _Field(
                                      hint: 'DD-MM-YYYY',
                                      keyboardType:
                                          TextInputType.datetime)),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _FieldWrap('Gender',
                                  required: true,
                                  child: Row(children: [
                                    Expanded(
                                      child: _Pill(
                                        label: 'Male',
                                        selected: _gender == 'Male',
                                        onTap: () => setState(
                                            () => _gender = 'Male'),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Expanded(
                                      child: _Pill(
                                        label: 'Female',
                                        selected: _gender == 'Female',
                                        onTap: () => setState(
                                            () => _gender = 'Female'),
                                      ),
                                    ),
                                  ])),
                            ),
                          ]),
                          const SizedBox(height: 14),

                          // Religion + Mother Tongue
                          Row(children: [
                            Expanded(
                              child: _FieldWrap('Religion',
                                  required: true,
                                  child: _Drop(
                                      hint: 'Select',
                                      items: const [
                                        'Hindu', 'Muslim', 'Christian',
                                        'Sikh', 'Jain', 'Buddhist', 'Other'
                                      ])),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _FieldWrap('Mother Tongue',
                                  required: true,
                                  child: _Drop(hint: 'Select', items: const [
                                    'Malayalam', 'Hindi', 'Tamil',
                                    'Telugu', 'Kannada', 'Punjabi', 'Other'
                                  ])),
                            ),
                          ]),
                          const SizedBox(height: 14),

                          // Email
                          _FieldWrap('Email',
                              required: true,
                              child: _Field(
                                  hint: 'Your email address',
                                  keyboardType: TextInputType.emailAddress)),
                          const SizedBox(height: 14),

                          // Password
                          _FieldWrap('Password',
                              child: _Field(
                                hint: '••••••••',
                                obscure: !_showPass,
                                suffix: IconButton(
                                  icon: Icon(
                                    _showPass
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: AppColors.kTextMuted, size: 20,
                                  ),
                                  onPressed: () => setState(
                                      () => _showPass = !_showPass),
                                ),
                              )),
                          const SizedBox(height: 4),
                          const Text(
                              'eg. Abcd@123 · min 8 characters – max 20',
                              style: TextStyle(
                                  fontSize: 10, color: AppColors.kTextMuted)),
                          const SizedBox(height: 14),

                          // Confirm password
                          _FieldWrap('Confirm Password',
                              child: _Field(
                                hint: '••••••••',
                                obscure: !_showConfirm,
                                suffix: IconButton(
                                  icon: Icon(
                                    _showConfirm
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: AppColors.kTextMuted, size: 20,
                                  ),
                                  onPressed: () => setState(
                                      () => _showConfirm = !_showConfirm),
                                ),
                              )),
                          const SizedBox(height: 22),
                          _CTAButton(
                            label: 'Continue →',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      const CommunityLocationScreen()),
                            ),
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

// ═══════════════════════════════════════════════════════════════
//  3b. COMMUNITY & LOCATION
// ═══════════════════════════════════════════════════════════════

class CommunityLocationScreen extends StatefulWidget {
  const CommunityLocationScreen({super.key});

  @override
  State<CommunityLocationScreen> createState() =>
      _CommunityLocationState();
}

class _CommunityLocationState extends State<CommunityLocationScreen> {
  String _currentAddr = 'Yes';
  int _ancestorCount = 0;

  @override
  Widget build(BuildContext context) {
    return _BlushScaffold(
      child: Column(
        children: [
          _TopBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _StepBar(current: 2, total: 4),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _SectionHeader(
                    tag: 'STEP 2 OF 4',
                    title: 'Community\n& Location',
                    subtitle: 'Tell us about your roots and where you live',
                  ),
                  const SizedBox(height: 20),
                  _FloatingCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Religion + Caste
                        Row(children: [
                          Expanded(
                            child: _FieldWrap('Religion',
                                required: true,
                                child: _Drop(hint: 'Hindu', items: const [
                                  'Hindu', 'Muslim', 'Christian',
                                  'Sikh', 'Jain', 'Buddhist', 'Other'
                                ])),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _FieldWrap('Caste',
                                required: true,
                                child: _Drop(
                                    hint: 'Select Caste',
                                    items: const [
                                      'Nair', 'Ezhava', 'Brahmin',
                                      'Kshatriya', 'Other'
                                    ])),
                          ),
                        ]),
                        const SizedBox(height: 14),

                        // Other castes
                        _FieldWrap(
                          'Looking for matches from other castes?',
                          child: _Drop(hint: 'No', items: const ['No', 'Yes']),
                        ),
                        const SizedBox(height: 14),

                        // SubCaste + Gotra
                        Row(children: [
                          Expanded(
                            child: _FieldWrap('SubCaste',
                                child: _Drop(hint: 'Select', items: const ['Select', 'N/A'])),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _FieldWrap('Gotra',
                                child: _Drop(
                                    hint: "Don't Know",
                                    items: const ["Don't Know", 'N/A'])),
                          ),
                        ]),
                        const SizedBox(height: 14),

                        // Native Place
                        _FieldWrap('Native Place / Ancestral Origin',
                            child: Column(children: [
                              Row(children: [
                                Expanded(
                                    child: _Drop(hint: 'Country', items: const ['India', 'Other'])),
                                const SizedBox(width: 8),
                                Expanded(
                                    child: _Drop(hint: 'State', items: const [
                                      'Kerala', 'Tamil Nadu', 'Karnataka',
                                      'Maharashtra', 'Delhi'
                                    ])),
                                const SizedBox(width: 8),
                                Expanded(
                                    child: _Drop(hint: 'District', items: const [
                                      'Thrissur', 'Ernakulam',
                                      'Thiruvananthapuram', 'Kozhikode'
                                    ])),
                              ]),
                              const SizedBox(height: 8),
                              TextField(
                                maxLines: 3,
                                maxLength: 255,
                                style: const TextStyle(
                                    fontSize: 13, color: AppColors.kDarkSlate),
                                onChanged: (v) => setState(
                                    () => _ancestorCount = v.length),
                                decoration: InputDecoration(
                                  hintText: 'Tell about your ancestral origin',
                                  hintStyle: const TextStyle(
                                      color: AppColors.kTextMuted, fontSize: 12),
                                  contentPadding: const EdgeInsets.all(12),
                                  filled: true,
                                  fillColor: AppColors.kCardBg,
                                  counterText: '${_ancestorCount}/255',
                                  counterStyle: const TextStyle(
                                      fontSize: 10, color: AppColors.kTextMuted),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          const BorderSide(color: AppColors.kBorder)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          const BorderSide(color: AppColors.kBorder)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: AppColors.kAccent, width: 1.5)),
                                ),
                              ),
                            ])),
                        const SizedBox(height: 14),

                        // Permanent Residence
                        _FieldWrap('Permanent Residence',
                            required: true,
                            child: Column(children: [
                              Row(children: [
                                Expanded(
                                    child: _Drop(hint: 'Country', items: const ['India', 'Other'])),
                                const SizedBox(width: 8),
                                Expanded(
                                    child: _Drop(hint: 'State', items: const [
                                      'Kerala', 'Tamil Nadu', 'Karnataka'
                                    ])),
                              ]),
                              const SizedBox(height: 8),
                              Row(children: [
                                Expanded(
                                    child: _Drop(hint: 'District', items: const [
                                      'Thrissur', 'Ernakulam', 'Kozhikode'
                                    ])),
                                const SizedBox(width: 8),
                                Expanded(
                                    child: _Field(
                                        hint: 'ZIP Code',
                                        keyboardType: TextInputType.number)),
                              ]),
                            ])),
                        const SizedBox(height: 14),

                        // Home Address
                        _FieldWrap('Home Address',
                            required: true,
                            child: _Field(hint: 'Enter home address')),
                        const SizedBox(height: 14),

                        // Current address toggle
                        Row(children: [
                          const Text('Is this your current address?',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.kSlate,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(width: 12),
                          ...['Yes', 'No'].map((s) => Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: _Pill(
                                  label: s,
                                  selected: _currentAddr == s,
                                  onTap: () =>
                                      setState(() => _currentAddr = s),
                                ),
                              )),
                        ]),
                        const SizedBox(height: 22),
                        _CTAButton(
                          label: 'Continue →',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const ProfessionalDetailsScreen()),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Center(
                          child: Text(
                            'You can edit your profile anytime from your dashboard',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 10, color: AppColors.kTextMuted),
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

// ═══════════════════════════════════════════════════════════════
//  3c. PROFESSIONAL DETAILS
// ═══════════════════════════════════════════════════════════════

class ProfessionalDetailsScreen extends StatefulWidget {
  const ProfessionalDetailsScreen({super.key});

  @override
  State<ProfessionalDetailsScreen> createState() =>
      _ProfessionalDetailsState();
}

class _ProfessionalDetailsState extends State<ProfessionalDetailsScreen> {
  final _empOptions = [
    'Healthcare', 'Information Technology', 'Farmer', 'Defence',
    'Government/PSU', 'Private sector', 'Business', 'Others',
  ];
  final Set<String> _selected = {};

  @override
  Widget build(BuildContext context) {
    return _BlushScaffold(
      child: Column(
        children: [
          _TopBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _StepBar(current: 3, total: 4),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _SectionHeader(
                    tag: 'STEP 3 OF 4',
                    title: 'Professional\nDetails',
                    subtitle:
                        'Helps us find you the most compatible match',
                  ),
                  const SizedBox(height: 20),
                  _FloatingCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Highest education
                        _FieldWrap('Highest Education',
                            required: true,
                            child: _Drop(
                                hint: 'Select Education',
                                items: const [
                                  'High School', 'Diploma', "Bachelor's",
                                  "Master's", 'PhD', 'Other'
                                ])),
                        const SizedBox(height: 14),

                        // Education in detail
                        _FieldWrap('Education in Detail',
                            child: _Field(
                                hint: 'Write a brief description',
                                maxLines: 3,
                                maxLength: 255)),
                        const SizedBox(height: 14),

                        // Languages
                        _FieldWrap('Languages Known',
                            child: _Field(hint: 'Select languages')),
                        const SizedBox(height: 14),

                        // Employed in chips
                        _FieldWrap('Employed In',
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: _empOptions.map((e) {
                                final sel = _selected.contains(e);
                                return GestureDetector(
                                  onTap: () => setState(() => sel
                                      ? _selected.remove(e)
                                      : _selected.add(e)),
                                  child: AnimatedContainer(
                                    duration:
                                        const Duration(milliseconds: 180),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: sel
                                          ? AppColors.kAccent.withOpacity(0.1)
                                          : AppColors.kCardBg,
                                      borderRadius:
                                          BorderRadius.circular(8),
                                      border: Border.all(
                                          color: sel ? AppColors.kAccent : AppColors.kBorder,
                                          width: 1.3),
                                    ),
                                    child: Text(e,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: sel
                                              ? AppColors.kAccent
                                              : AppColors.kTextMuted,
                                          fontWeight: sel
                                              ? FontWeight.w600
                                              : FontWeight.w400,
                                        )),
                                  ),
                                );
                              }).toList(),
                            )),
                        const SizedBox(height: 14),

                        // Occupation + Working Country
                        Row(children: [
                          Expanded(
                            child: _FieldWrap('Occupation',
                                required: true,
                                child: _Drop(hint: 'Select', items: const [
                                  'Engineer', 'Doctor', 'Teacher',
                                  'Lawyer', 'Accountant', 'Other'
                                ])),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _FieldWrap('Working Country',
                                child: _Drop(hint: 'Select', items: const [
                                  'India', 'UAE', 'USA', 'UK', 'Other'
                                ])),
                          ),
                        ]),
                        const SizedBox(height: 14),

                        // State + City
                        Row(children: [
                          Expanded(
                            child: _FieldWrap('State',
                                child: _Drop(hint: 'Select State', items: const [
                                  'Kerala', 'Tamil Nadu', 'Karnataka',
                                  'Maharashtra', 'Delhi'
                                ])),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _FieldWrap('City',
                                child: _Drop(hint: 'Select', items: const [
                                  'Thrissur', 'Kochi', 'Kozhikode',
                                  'Thiruvananthapuram'
                                ])),
                          ),
                        ]),
                        const SizedBox(height: 14),

                        // Residential Status + Annual Income
                        Row(children: [
                          Expanded(
                            child: _FieldWrap('Residential Status',
                                child: _Drop(hint: 'Select', items: const [
                                  'Resident',
                                  'Non-Resident Indian',
                                  'Overseas Citizen'
                                ])),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _FieldWrap('Annual Income',
                                child: Row(children: [
                                  Expanded(
                                      child: _Drop(hint: 'Currency', items: const [
                                        'INR', 'USD', 'AED'
                                      ])),
                                  const SizedBox(width: 4),
                                  Expanded(
                                      child: _Drop(hint: 'Range', items: const [
                                        'Below 2L', '2-5L', '5-10L',
                                        '10-20L', '20L+'
                                      ])),
                                ])),
                          ),
                        ]),
                        const SizedBox(height: 22),
                        _CTAButton(
                          label: 'Continue →',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const PersonalPhysicalScreen()),
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

// ═══════════════════════════════════════════════════════════════
//  3d. PERSONAL & PHYSICAL
// ═══════════════════════════════════════════════════════════════

class PersonalPhysicalScreen extends StatefulWidget {
  const PersonalPhysicalScreen({super.key});

  @override
  State<PersonalPhysicalScreen> createState() =>
      _PersonalPhysicalState();
}

class _PersonalPhysicalState extends State<PersonalPhysicalScreen> {
  String _marital = 'Unmarried';
  String _surgery = 'No';
  String _pets = 'No';
  int _children = 0;
  int _descCount = 0;

  @override
  Widget build(BuildContext context) {
    return _BlushScaffold(
      child: Column(
        children: [
          _TopBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _StepBar(current: 4, total: 4),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _SectionHeader(
                    tag: 'STEP 4 OF 4',
                    title: 'Personal &\nPhysical',
                    subtitle: 'A few last details to complete your profile',
                  ),
                  const SizedBox(height: 20),
                  _FloatingCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Marital status
                        _FieldWrap('Marital Status',
                            child: Row(children: [
                              ...['Unmarried', 'Divorcee'].map((s) =>
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(right: 8),
                                    child: _Pill(
                                      label: s,
                                      selected: _marital == s,
                                      onTap: () =>
                                          setState(() => _marital = s),
                                    ),
                                  )),
                            ])),
                        const SizedBox(height: 14),

                        // Number of children
                        _FieldWrap('Number of Children',
                            child: Row(children: [
                              _CountBtn(
                                  '-',
                                  () => setState(() {
                                        if (_children > 0) _children--;
                                      })),
                              Container(
                                width: 48,
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.kCardBg,
                                  border: Border.symmetric(
                                      horizontal: const BorderSide(
                                          color: AppColors.kBorder)),
                                ),
                                child: Text('$_children',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.kDarkSlate)),
                              ),
                              _CountBtn('+',
                                  () => setState(() => _children++)),
                            ])),
                        const SizedBox(height: 14),

                        // Physical details
                        const Text('Physical Details',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.kSlate)),
                        const SizedBox(height: 8),
                        Row(children: [
                          Expanded(
                              child: _Drop(hint: 'Height (cm)', items: const [
                                '150', '155', '160', '165', '170',
                                '175', '180', '185', '190'
                              ])),
                          const SizedBox(width: 8),
                          Expanded(
                              child: _Drop(hint: 'Weight (Kg)', items: const [
                                '45', '50', '55', '60', '65',
                                '70', '75', '80', '85', '90+'
                              ])),
                        ]),
                        const SizedBox(height: 8),
                        Row(children: [
                          Expanded(
                              child: _Drop(hint: 'Skin Color', items: const [
                                'Fair', 'Wheatish', 'Dusky', 'Dark'
                              ])),
                          const SizedBox(width: 8),
                          Expanded(
                              child: _Drop(hint: 'Body Type', items: const [
                                'Slim', 'Athletic', 'Average', 'Heavy'
                              ])),
                        ]),
                        const SizedBox(height: 8),
                        Row(children: [
                          Expanded(
                              child: _Drop(hint: 'Blood Group', items: const [
                                'A+', 'A-', 'B+', 'B-',
                                'O+', 'O-', 'AB+', 'AB-'
                              ])),
                          const SizedBox(width: 8),
                          Expanded(
                              child: _Drop(
                                  hint: 'Any disability',
                                  items: const ['No', 'Yes'])),
                        ]),
                        const SizedBox(height: 8),
                        TextField(
                          maxLines: 3,
                          maxLength: 255,
                          style: const TextStyle(
                              fontSize: 13, color: AppColors.kDarkSlate),
                          onChanged: (v) =>
                              setState(() => _descCount = v.length),
                          decoration: InputDecoration(
                            hintText: 'Write a brief description',
                            hintStyle: const TextStyle(
                                color: AppColors.kTextMuted, fontSize: 12),
                            contentPadding: const EdgeInsets.all(12),
                            filled: true,
                            fillColor: AppColors.kCardBg,
                            counterText: '${_descCount}/255',
                            counterStyle: const TextStyle(
                                fontSize: 10, color: AppColors.kTextMuted),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: AppColors.kBorder)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: AppColors.kBorder)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: AppColors.kAccent, width: 1.5)),
                          ),
                        ),
                        const SizedBox(height: 14),

                        // Surgery
                        _FieldWrap(
                            'Any major surgical treatment or organ replacing done?',
                            child: Row(children: [
                              ...['No', 'Yes'].map((s) => Padding(
                                    padding:
                                        const EdgeInsets.only(right: 8),
                                    child: _Pill(
                                      label: s,
                                      selected: _surgery == s,
                                      onTap: () =>
                                          setState(() => _surgery = s),
                                    ),
                                  )),
                            ])),
                        const SizedBox(height: 14),

                        // Diet + Smoking + Drinking
                        Row(children: [
                          Expanded(
                            child: _FieldWrap('Diet',
                                child: _Drop(hint: 'Diet', items: const [
                                  'Vegetarian', 'Non-Vegetarian',
                                  'Vegan', 'Jain'
                                ])),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _FieldWrap('Smoking',
                                child: _Drop(hint: 'Smoking', items: const [
                                  'No', 'Occasionally', 'Yes'
                                ])),
                          ),
                        ]),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 180,
                          child: _FieldWrap('Drinking',
                              child: _Drop(hint: 'Drinking', items: const [
                                'No', 'Occasionally', 'Yes'
                              ])),
                        ),
                        const SizedBox(height: 14),

                        // Pets
                        _FieldWrap('Do you have any pets?',
                            child: Row(children: [
                              ...['No', 'Yes'].map((s) => Padding(
                                    padding:
                                        const EdgeInsets.only(right: 8),
                                    child: _Pill(
                                      label: s,
                                      selected: _pets == s,
                                      onTap: () =>
                                          setState(() => _pets = s),
                                    ),
                                  )),
                            ])),
                        const SizedBox(height: 22),

                        // Two buttons
                        Row(children: [
                          Expanded(
                            child: _CTAButton(
                              label: 'Continue',
                              outlined: true,
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const LoginScreen()),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _CTAButton(
                              label: 'Submit ✓',
                              onTap: () => showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)),
                                  backgroundColor: AppColors.kBgTop,
                                  title: const Row(children: [
                                    Icon(Icons.favorite_rounded,
                                        color: AppColors.kAccent),
                                    SizedBox(width: 8),
                                    Text('Profile Created!',
                                        style: TextStyle(
                                            color: AppColors.kDarkSlate,
                                            fontSize: 18)),
                                  ]),
                                  content: const Text(
                                    'Your registration is complete. Login to find your perfect match!',
                                    style: TextStyle(
                                        color: AppColors.kTextMuted, fontSize: 13),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const LoginScreen()),
                                          (r) => false,
                                        );
                                      },
                                      child: const Text('Go to Login',
                                          style: TextStyle(
                                              color: AppColors.kAccent,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                        const SizedBox(height: 10),
                        const Center(
                          child: Text(
                            'You can edit your profile anytime from your dashboard',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 10, color: AppColors.kTextMuted),
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

// Counter button helper
class _CountBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _CountBtn(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40, height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.kAccent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.kAccent.withOpacity(0.3)),
        ),
        child: Text(label,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.kAccent)),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//  4. LOGIN SCREEN
// ═══════════════════════════════════════════════════════════════

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPass = false;
  String _loginWith = 'Email';

  @override
  Widget build(BuildContext context) {
    return _BlushScaffold(
      child: Column(
        children: [
          _TopBar(showBack: false),
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

                  const _SectionHeader(
                    tag: 'WELCOME BACK',
                    title: 'Login to your\naccount',
                    subtitle:
                        'Continue your journey to find your perfect match',
                  ),
                  const SizedBox(height: 24),

                  _FloatingCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Email / Mobile toggle
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColors.kCardBg,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.kBorder),
                          ),
                          child: Row(
                            children: ['Email', 'Mobile'].map((opt) {
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
                                    child: Text(opt,
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

                        // Email or mobile field
                        _FieldWrap(
                          _loginWith == 'Email'
                              ? 'Email Address'
                              : 'Mobile Number',
                          required: true,
                          child: _Field(
                            hint: _loginWith == 'Email'
                                ? 'Enter your email'
                                : 'Enter mobile number',
                            keyboardType: _loginWith == 'Email'
                                ? TextInputType.emailAddress
                                : TextInputType.phone,
                          ),
                        ),
                        const SizedBox(height: 14),

                        // Password
                        _FieldWrap('Password',
                            required: true,
                            child: _Field(
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

                        _CTAButton(label: 'Login', onTap: () {}),
                        const SizedBox(height: 18),

                        // Divider
                        Row(children: [
                          Expanded(
                              child: Divider(
                                  color: AppColors.kAccent.withOpacity(0.2))),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12),
                            child: Text('or',
                                style: TextStyle(
                                    color: AppColors.kTextMuted.withOpacity(0.6),
                                    fontSize: 12)),
                          ),
                          Expanded(
                              child: Divider(
                                  color: AppColors.kAccent.withOpacity(0.2))),
                        ]),
                        const SizedBox(height: 16),

                        _CTAButton(
                          label: 'Create New Account',
                          outlined: true,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const InitialInfoScreen()),
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