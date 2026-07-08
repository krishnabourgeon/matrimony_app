// import 'package:flutter/material.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';

// class VerifyProfileScreen extends StatefulWidget {
//   const VerifyProfileScreen({super.key});

//   @override
//   State<VerifyProfileScreen> createState() => _VerifyProfileScreenState();
// }

// class _VerifyProfileScreenState extends State<VerifyProfileScreen> {
//   final _phoneCtrl = TextEditingController();
//   final _phoneOtpCtrl = TextEditingController();
//   bool _phoneCodeSent = false;
//   bool _phoneVerified = false;

//   final _emailCtrl = TextEditingController();
//   final _emailOtpCtrl = TextEditingController();
//   bool _emailCodeSent = false;
//   bool _emailVerified = false;

//   @override
//   void dispose() {
//     _phoneCtrl.dispose();
//     _phoneOtpCtrl.dispose();
//     _emailCtrl.dispose();
//     _emailOtpCtrl.dispose();
//     super.dispose();
//   }

//   void _sendPhoneCode() {
//     if (_phoneCtrl.text.trim().isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter your number')),
//       );
//       return;
//     }
//     setState(() => _phoneCodeSent = true);
//   }

//   void _verifyPhoneCode() {
//     if (_phoneOtpCtrl.text.trim().isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter the code')),
//       );
//       return;
//     }
//     setState(() => _phoneVerified = true);
//   }

//   void _sendEmailCode() {
//     if (_emailCtrl.text.trim().isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter your email')),
//       );
//       return;
//     }
//     setState(() => _emailCodeSent = true);
//   }

//   void _verifyEmailCode() {
//     if (_emailOtpCtrl.text.trim().isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter the code')),
//       );
//       return;
//     }
//     setState(() => _emailVerified = true);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           'Verify your Profile',
//           style: TextStyle(fontFamily: 'Georgia',
//             fontSize: 17,
//             fontWeight: FontWeight.bold,
//             color: AppColors.kDarkSlate,),
//         ),
//         leading: InkWell(
//           onTap: () => Navigator.pop(context),
//           child: Icon(Icons.arrow_back_ios, color: AppColors.kDarkSlate,size: 17,)),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               padding: EdgeInsets.all(20),
//               height: 180,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 gradient: LinearGradient(colors: [
//                   const Color.fromARGB(255, 245, 136, 165),
//                   AppColors.primaryMid
//                 ])
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text("Verify Your Profile",style: TextStyle(fontFamily: 'Georgia',
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,)),
//                           SizedBox(height: 15,),
//                         Text("Your safety is our priority. To ensure a secure & positive experience, please follow these guidelines",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontFamily: 'Georgia',
//                           color: Colors.white,
//                         ),)
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Icon(
//                     Icons.verified_user,
//                     color: Colors.white,
//                     size: 70,
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(height: 20,),
//             Container(
//               padding: EdgeInsets.all(20),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Colors.white,
//                   border: Border.all(color: Colors.grey.shade400)
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text("ID Verification",
//                       style: TextStyle(
//                         fontFamily: 'Georgia',
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black),
//                     ),
//                     SizedBox(height: 15,),
//                     Text.rich(
//                       TextSpan(
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontFamily: 'Georgia',
//                           color: Colors.black,
//                         ),
//                         children: [
//                           TextSpan(
//                             text: "Sent any of the below mentioned documents to verify your identity information. The documents chosen by you will not be shown to other members. ",
//                           ),
//                           TextSpan(
//                             text: "License, Pan Card, Aadhar Card, Passport",
//                             style: TextStyle(
//                               color: AppColors.primary,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//             ),
//             const SizedBox(height: 20),
//             _buildPhoneVerificationCard(),
//             const SizedBox(height: 20),
//             _buildEmailVerificationCard(),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPhoneVerificationCard() {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.white,
//         border: Border.all(color: Colors.grey.shade400),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Text('Phone Number Verification',
//               style: TextStyle(
//                   fontFamily: 'Georgia',
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black)),
//           const SizedBox(height: 10),
//           if (_phoneVerified)
//             _VerifiedNotice(
//               label: _phoneCtrl.text,
//               verifiedText: 'Your Phone Number has been successfully verified',
//             )
//           else ...[
//             Text(
//               _phoneCodeSent
//                   ? 'Enter the code that was sent to your mobile number.'
//                   : 'Verify your phone number by entering the code that is sent to your mobile number.',
//               style: const TextStyle(
//                 fontSize: 14,
//                 fontFamily: 'Georgia',
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 15),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _phoneCodeSent ? _phoneOtpCtrl : _phoneCtrl,
//                     keyboardType:
//                         _phoneCodeSent ? TextInputType.number : TextInputType.phone,
//                     decoration: InputDecoration(
//                       hintText: _phoneCodeSent ? 'Enter OTP' : 'Enter your Number',
//                       contentPadding:
//                           const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: Colors.grey.shade400),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: Colors.grey.shade400),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide:
//                             const BorderSide(color: AppColors.primary, width: 1.5),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 GestureDetector(
//                   onTap: _phoneCodeSent ? _verifyPhoneCode : _sendPhoneCode,
//                   child: Container(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
//                     decoration: BoxDecoration(
//                       color: AppColors.primary,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Text(
//                       _phoneCodeSent ? 'Verify' : 'Send Code',
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ],
//       ),
//     );
//   }

//   Widget _buildEmailVerificationCard() {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.white,
//         border: Border.all(color: Colors.grey.shade400),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Text('Email Verification',
//               style: TextStyle(
//                   fontFamily: 'Georgia',
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black)),
//           const SizedBox(height: 10),
//           if (_emailVerified)
//             _VerifiedNotice(
//               label: _emailCtrl.text.toUpperCase(),
//               verifiedText: 'Your Email has been successfully verified',
//             )
//           else ...[
//             Text(
//               _emailCodeSent
//                   ? 'Enter the code that was sent to your Email.'
//                   : 'Verify your Email by entering the code that is sent to your Email.',
//               style: const TextStyle(
//                 fontSize: 14,
//                 fontFamily: 'Georgia',
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 15),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _emailCodeSent ? _emailOtpCtrl : _emailCtrl,
//                     keyboardType:
//                         _emailCodeSent ? TextInputType.number : TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                       hintText: _emailCodeSent ? 'Enter OTP' : 'Enter your Email',
//                       contentPadding:
//                           const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: Colors.grey.shade400),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: Colors.grey.shade400),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide:
//                             const BorderSide(color: AppColors.primary, width: 1.5),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 GestureDetector(
//                   onTap: _emailCodeSent ? _verifyEmailCode : _sendEmailCode,
//                   child: Container(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
//                     decoration: BoxDecoration(
//                       color: AppColors.primary,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Text(
//                       _emailCodeSent ? 'Verify' : 'Send Code',
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }

// /// Shown once a phone number / email has been verified —
// /// e.g. "ASDF@GMAIL.COM  Your Email has been successfully verified"
// class _VerifiedNotice extends StatelessWidget {
//   final String label;
//   final String verifiedText;
//   const _VerifiedNotice({required this.label, required this.verifiedText});

//   @override
//   Widget build(BuildContext context) {
//     return Text.rich(
//       TextSpan(
//         style: const TextStyle(fontSize: 14, fontFamily: 'Georgia'),
//         children: [
//           if (label.isNotEmpty)
//             TextSpan(text: '$label  ', style: const TextStyle(color: Colors.black87)),
//           TextSpan(
//             text: verifiedText,
//             style: const TextStyle(color: AppColors.purple, fontWeight: FontWeight.w600),
//           ),
//         ],
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

class VerifyProfileScreen extends StatefulWidget {
  const VerifyProfileScreen({super.key});

  @override
  State<VerifyProfileScreen> createState() => _VerifyProfileScreenState();
}

class _VerifyProfileScreenState extends State<VerifyProfileScreen> {
  final _phoneCtrl = TextEditingController();
  final _phoneOtpCtrl = TextEditingController();
  bool _phoneCodeSent = false;
  bool _phoneVerified = false;

  final _emailCtrl = TextEditingController();
  final _emailOtpCtrl = TextEditingController();
  bool _emailCodeSent = false;
  bool _emailVerified = false;

  @override
  void dispose() {
    _phoneCtrl.dispose();
    _phoneOtpCtrl.dispose();
    _emailCtrl.dispose();
    _emailOtpCtrl.dispose();
    super.dispose();
  }

  void _sendPhoneCode() {
    if (_phoneCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your number')),
      );
      return;
    }
    setState(() => _phoneCodeSent = true);
  }

  void _verifyPhoneCode() {
    if (_phoneOtpCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the code')),
      );
      return;
    }
    setState(() => _phoneVerified = true);
  }

  void _sendEmailCode() {
    if (_emailCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email')),
      );
      return;
    }
    setState(() => _emailCodeSent = true);
  }

  void _verifyEmailCode() {
    if (_emailOtpCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the code')),
      );
      return;
    }
    setState(() => _emailVerified = true);
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: _appBar(context, top)),
          SliverToBoxAdapter(child: _heroBanner()),
          SliverToBoxAdapter(
            child: _InfoCard(
              icon: Icons.badge_outlined,
              iconColor: AppColors.primary,
              iconBg: AppColors.primaryLight,
              title: "ID Verification",
              child: Text.rich(
                TextSpan(
                  style: const TextStyle(fontSize: 12.5, color: AppColors.textHint, height: 1.5),
                  children: [
                    const TextSpan(
                      text: "Send any of the below mentioned documents to verify your identity. Documents chosen by you will not be shown to other members. ",
                    ),
                    TextSpan(
                      text: "License, PAN Card, Aadhar Card, Passport",
                      style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: _buildPhoneVerificationCard()),
          SliverToBoxAdapter(child: _buildEmailVerificationCard()),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context, double top) => Container(
    color: AppColors.surface,
    padding: EdgeInsets.fromLTRB(16, top + 14, 16, 14),
    child: Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.arrow_back_ios_new_rounded, size: 16, color: AppColors.textSecondary),
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Verify Your Profile',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: AppColors.textPrimary, letterSpacing: -0.3),
        ),
      ],
    ),
  );

  Widget _heroBanner() => Container(
    margin: const EdgeInsets.fromLTRB(16, 14, 16, 0),
    padding: const EdgeInsets.fromLTRB(20, 22, 20, 22),
    decoration: BoxDecoration(
      gradient: AppColors.gradHero,
      borderRadius: BorderRadius.circular(AppColors.r24),
      boxShadow: AppColors.shadowPrimary,
    ),
    child: Stack(
      children: [
        Positioned(
          top: -20,
          right: -20,
          child: Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.06)),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withOpacity(0.3)),
              ),
              child: const Icon(Icons.verified_user_rounded, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Verify Your Profile",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: -0.3),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Verified profiles get more trust & responses. Follow these steps to complete yours.",
                    style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.85), height: 1.4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );

  Widget _buildPhoneVerificationCard() {
    return _InfoCard(
      icon: Icons.phone_iphone_rounded,
      iconColor: AppColors.blue,
      iconBg: AppColors.blueLight,
      title: 'Phone Number Verification',
      trailing: _phoneVerified ? const _VerifiedBadge() : null,
      child: _phoneVerified
          ? Text(
              _phoneCtrl.text,
              style: const TextStyle(fontSize: 12.5, color: AppColors.textPrimary, fontWeight: FontWeight.w700),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _phoneCodeSent
                      ? 'Enter the code that was sent to your mobile number.'
                      : 'Verify your phone number by entering the code that is sent to your mobile number.',
                  style: const TextStyle(fontSize: 12.5, color: AppColors.textHint, height: 1.5),
                ),
                const SizedBox(height: 14),
                _VerifyRow(
                  controller: _phoneCodeSent ? _phoneOtpCtrl : _phoneCtrl,
                  keyboardType: _phoneCodeSent ? TextInputType.number : TextInputType.phone,
                  hintText: _phoneCodeSent ? 'Enter OTP' : 'Enter your Number',
                  buttonLabel: _phoneCodeSent ? 'Verify' : 'Send Code',
                  onPressed: _phoneCodeSent ? _verifyPhoneCode : _sendPhoneCode,
                ),
              ],
            ),
    );
  }

  Widget _buildEmailVerificationCard() {
    return _InfoCard(
      icon: Icons.email_outlined,
      iconColor: AppColors.success,
      iconBg: AppColors.successLight,
      title: 'Email Verification',
      trailing: _emailVerified ? const _VerifiedBadge() : null,
      child: _emailVerified
          ? Text(
              _emailCtrl.text.toUpperCase(),
              style: const TextStyle(fontSize: 12.5, color: AppColors.textPrimary, fontWeight: FontWeight.w700),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _emailCodeSent
                      ? 'Enter the code that was sent to your email.'
                      : 'Verify your email by entering the code that is sent to your email.',
                  style: const TextStyle(fontSize: 12.5, color: AppColors.textHint, height: 1.5),
                ),
                const SizedBox(height: 14),
                _VerifyRow(
                  controller: _emailCodeSent ? _emailOtpCtrl : _emailCtrl,
                  keyboardType: _emailCodeSent ? TextInputType.number : TextInputType.emailAddress,
                  hintText: _emailCodeSent ? 'Enter OTP' : 'Enter your Email',
                  buttonLabel: _emailCodeSent ? 'Verify' : 'Send Code',
                  onPressed: _emailCodeSent ? _verifyEmailCode : _sendEmailCode,
                ),
              ],
            ),
    );
  }
}

/// Standard icon-badged surface card used across verification sections.
class _InfoCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String title;
  final Widget child;
  final Widget? trailing;

  const _InfoCard({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.title,
    required this.child,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppColors.r20),
        boxShadow: AppColors.shadowSm,
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(10)),
                child: Icon(icon, color: iconColor, size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.textPrimary, letterSpacing: -0.2),
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

/// Compact "Verified" pill shown next to a card title once complete.
class _VerifiedBadge extends StatelessWidget {
  const _VerifiedBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(color: AppColors.successLight, borderRadius: BorderRadius.circular(20)),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle_rounded, color: AppColors.success, size: 12),
          SizedBox(width: 4),
          Text('Verified', style: TextStyle(color: AppColors.success, fontSize: 10, fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }
}

/// Text field + action button row shared by the phone/email verification cards.
class _VerifyRow extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final String buttonLabel;
  final VoidCallback onPressed;

  const _VerifyRow({
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.buttonLabel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            style: const TextStyle(fontSize: 13, color: AppColors.textPrimary),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: AppColors.textHint, fontSize: 13),
              filled: true,
              fillColor: AppColors.surfaceVariant,
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppColors.r16),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppColors.r16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppColors.r16),
                borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            decoration: BoxDecoration(
              gradient: AppColors.gradPrimary,
              borderRadius: BorderRadius.circular(AppColors.r16),
            ),
            child: Text(
              buttonLabel,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }
}