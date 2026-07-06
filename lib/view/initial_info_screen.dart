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
//   final _nameCtrl = TextEditingController();
//   final _mobileCtrl = TextEditingController();

//   final _options = [
//     'Myself', 'Son', 'Daughter', 'Brother', 'Sister', 'Friend / Relative'
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
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/field.dart';
import 'package:matrimony_app/view/custom_widgets/field_warp.dart';
import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
import 'package:matrimony_app/view/custom_widgets/section_header.dart';
import 'package:matrimony_app/view/custom_widgets/top_bar.dart';
import 'package:matrimony_app/view/login_screen.dart';
import 'package:matrimony_app/view/otp_verify_screen.dart';

class InitialInfoScreen extends StatefulWidget {
  const InitialInfoScreen({super.key});

  @override
  State<InitialInfoScreen> createState() => _InitialInfoScreenState();
}

class _InitialInfoScreenState extends State<InitialInfoScreen> {
  String? _createdFor;
  String? _motherTongue;
  final _nameCtrl = TextEditingController();
  final _mobileCtrl = TextEditingController();

  final _options = [
    'Myself', 'Son', 'Daughter', 'Brother', 'Sister', 'Friend / Relative'
  ];

  final _motherTongues = [
    'Hindi',
    'Malayalam',
    'Tamil',
    'Telugu',
    'Kannada',
    'Marathi',
    'Gujarati',
    'Punjabi',
    'Bengali',
    'Odia',
    'Urdu',
    'Konkani',
    'Tulu',
    'English',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return BlushScaffold(
      child: Column(
        children: [
          TopBar(
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
                  const SectionHeader(
                    tag: 'STEP 1',
                    title: "Discover the better\nhalf of your life",
                    subtitle: 'Create your profile in just a few steps',
                  ),
                  const SizedBox(height: 24),
                  FloatingCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Created for
                        FieldWrap('Profile Created For',
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
                        FieldWrap('Full Name',
                            required: true,
                            child: Field(
                                hint: 'Enter your full name',
                                controller: _nameCtrl)),
                        const SizedBox(height: 14),

                        // Mother Tongue
                        FieldWrap('Mother Tongue',
                            required: true,
                            child: DropdownButtonFormField<String>(
                              value: _motherTongue,
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.kTextMuted),
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: AppColors.kDarkSlate,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Select mother tongue',
                                hintStyle: const TextStyle(
                                    fontSize: 13,
                                    color: AppColors.kTextMuted,
                                    fontWeight: FontWeight.w400),
                                filled: true,
                                fillColor: AppColors.kCardBg,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 14),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      const BorderSide(color: AppColors.kBorder),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      const BorderSide(color: AppColors.kBorder),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      const BorderSide(color: AppColors.kAccent),
                                ),
                              ),
                              dropdownColor: AppColors.kCardBg,
                              borderRadius: BorderRadius.circular(12),
                              items: _motherTongues
                                  .map((lang) => DropdownMenuItem(
                                        value: lang,
                                        child: Text(lang),
                                      ))
                                  .toList(),
                              onChanged: (val) =>
                                  setState(() => _motherTongue = val),
                            )),
                        const SizedBox(height: 14),

                        // Mobile
                        FieldWrap('Mobile Number',
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
                                  child: Field(
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

                        CTAButton(
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