// // Bandhan 2026 — Premium Edit Profile Screen
// import 'package:flutter/material.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';

// class EditProfileScreen extends StatefulWidget {
//   const EditProfileScreen({super.key});
//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   final _formKey = GlobalKey<FormState>();

//   final Map<String, bool> _expanded = {
//     'About Me': true, 'Family Details': false, 'Education & Career': false,
//     'Lifestyle': false, 'Preferences': false, 'Partner Expectations': false,
//   };

//   // ── About Me ──
//   final _ageCtrl = TextEditingController(text: '27');
//   final _heightCtrl = TextEditingController(text: "5'5\"");
//   final _motherTongueCtrl = TextEditingController(text: 'Malayalam');
//   final _aboutCtrl = TextEditingController(
//     text: 'A passionate software engineer who loves music, travel and good food. Looking for a life partner with similar values and a caring heart.',
//   );
//   String _maritalStatus = 'Never Married';

//   // ── Family Details ──
//   final _fatherCtrl = TextEditingController(text: 'Dr. Rajesh Menon · Retired');
//   final _motherCtrl = TextEditingController(text: 'Suja Menon · Homemaker');
//   final _siblingsCtrl = TextEditingController(text: '1 brother (married)');
//   String _familyType = 'Nuclear Family';
//   String _familyValues = 'Moderate / Traditional';
//   String _familyStatus = 'Upper Middle Class';

//   // ── Education & Career ──
//   final _educationCtrl = TextEditingController(text: 'M.Tech — Computer Science');
//   final _collegeCtrl = TextEditingController(text: 'IIT Madras');
//   final _occupationCtrl = TextEditingController(text: 'Software Engineer');
//   final _employerCtrl = TextEditingController(text: 'Infosys Limited');
//   final _incomeCtrl = TextEditingController(text: '12–15 Lakhs');
//   final _workLocationCtrl = TextEditingController(text: 'Bengaluru, Karnataka');

//   // ── Lifestyle ──
//   String _diet = 'Vegetarian';
//   String _smoking = 'Non-Smoker';
//   String _drinking = 'Non-Drinker';
//   final _hobbiesCtrl = TextEditingController(text: 'Classical music, Trekking, Cooking, Reading');
//   final _languagesCtrl = TextEditingController(text: 'Malayalam, Hindi, English, Tamil');

//   // ── Preferences ──
//   final _ageRangeCtrl = TextEditingController(text: '27–33 years');
//   final _heightRangeCtrl = TextEditingController(text: '5\'7" – 6\'1"');
//   String _religion = 'Hindu';
//   final _communityCtrl = TextEditingController(text: 'Nair / Open to all Hindu');
//   final _prefEducationCtrl = TextEditingController(text: 'Graduate & above');
//   final _prefOccupationCtrl = TextEditingController(text: 'Any');
//   final _prefLocationCtrl = TextEditingController(text: 'Kerala / Bengaluru preferred');

//   // ── Partner Expectations ──
//   final _expectationCtrl = TextEditingController(
//     text: 'Looking for someone who is caring, family-oriented and respects cultural values. Must love travel and have a good sense of humour. Open to working couples.',
//   );

//   @override
//   void dispose() {
//     for (final c in [
//       _ageCtrl, _heightCtrl, _motherTongueCtrl, _aboutCtrl,
//       _fatherCtrl, _motherCtrl, _siblingsCtrl,
//       _educationCtrl, _collegeCtrl, _occupationCtrl, _employerCtrl, _incomeCtrl, _workLocationCtrl,
//       _hobbiesCtrl, _languagesCtrl,
//       _ageRangeCtrl, _heightRangeCtrl, _communityCtrl, _prefEducationCtrl, _prefOccupationCtrl, _prefLocationCtrl,
//       _expectationCtrl,
//     ]) {
//       c.dispose();
//     }
//     super.dispose();
//   }

//   void _save() {
//     // TODO: submit updated profile fields via API
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Profile updated successfully')),
//     );
//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final top = MediaQuery.of(context).padding.top;
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: Stack(
//         children: [
//           Form(
//             key: _formKey,
//             child: CustomScrollView(
//               physics: const BouncingScrollPhysics(),
//               slivers: [
//                 SliverToBoxAdapter(child: _buildCover(top)),
//                 SliverPadding(
//                   padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
//                   sliver: SliverList(delegate: SliverChildListDelegate([
//                     _buildSection('About Me', Icons.person_outline_rounded, [
//                       const _ReadOnlyRow('Profile ID', 'BN-482910'),
//                       _FormField(label: 'Age', controller: _ageCtrl, keyboardType: TextInputType.number),
//                       _FormField(label: 'Height', controller: _heightCtrl),
//                       _FormDropdown(
//                         label: 'Marital Status',
//                         value: _maritalStatus,
//                         options: const ['Never Married', 'Divorced', 'Widowed', 'Separated'],
//                         onChanged: (v) => setState(() => _maritalStatus = v),
//                       ),
//                       _FormField(label: 'Mother Tongue', controller: _motherTongueCtrl),
//                       _FormField(label: 'About', controller: _aboutCtrl, multiline: true),
//                     ]),
//                     _buildSection('Family Details', Icons.family_restroom_rounded, [
//                       _FormField(label: 'Father', controller: _fatherCtrl),
//                       _FormField(label: 'Mother', controller: _motherCtrl),
//                       _FormField(label: 'Siblings', controller: _siblingsCtrl),
//                       _FormDropdown(
//                         label: 'Family Type',
//                         value: _familyType,
//                         options: const ['Nuclear Family', 'Joint Family'],
//                         onChanged: (v) => setState(() => _familyType = v),
//                       ),
//                       _FormDropdown(
//                         label: 'Family Values',
//                         value: _familyValues,
//                         options: const ['Traditional', 'Moderate / Traditional', 'Liberal'],
//                         onChanged: (v) => setState(() => _familyValues = v),
//                       ),
//                       _FormDropdown(
//                         label: 'Family Status',
//                         value: _familyStatus,
//                         options: const ['Middle Class', 'Upper Middle Class', 'Affluent'],
//                         onChanged: (v) => setState(() => _familyStatus = v),
//                       ),
//                     ]),
//                     _buildSection('Education & Career', Icons.school_outlined, [
//                       _FormField(label: 'Education', controller: _educationCtrl),
//                       _FormField(label: 'College', controller: _collegeCtrl),
//                       _FormField(label: 'Occupation', controller: _occupationCtrl),
//                       _FormField(label: 'Employer', controller: _employerCtrl),
//                       _FormField(label: 'Annual Income', controller: _incomeCtrl),
//                       _FormField(label: 'Work Location', controller: _workLocationCtrl),
//                     ]),
//                     _buildSection('Lifestyle', Icons.self_improvement_rounded, [
//                       _FormDropdown(
//                         label: 'Dietary Habits',
//                         value: _diet,
//                         options: const ['Vegetarian', 'Non-Vegetarian', 'Eggetarian', 'Vegan'],
//                         onChanged: (v) => setState(() => _diet = v),
//                       ),
//                       _FormDropdown(
//                         label: 'Smoking',
//                         value: _smoking,
//                         options: const ['Non-Smoker', 'Occasional Smoker', 'Regular Smoker'],
//                         onChanged: (v) => setState(() => _smoking = v),
//                       ),
//                       _FormDropdown(
//                         label: 'Drinking',
//                         value: _drinking,
//                         options: const ['Non-Drinker', 'Social Drinker', 'Regular Drinker'],
//                         onChanged: (v) => setState(() => _drinking = v),
//                       ),
//                       _FormField(label: 'Hobbies', controller: _hobbiesCtrl),
//                       _FormField(label: 'Languages', controller: _languagesCtrl),
//                     ]),
//                     _buildSection('Preferences', Icons.tune_rounded, [
//                       _FormField(label: 'Age Range', controller: _ageRangeCtrl),
//                       _FormField(label: 'Height Range', controller: _heightRangeCtrl),
//                       _FormDropdown(
//                         label: 'Religion',
//                         value: _religion,
//                         options: const ['Hindu', 'Muslim', 'Christian', 'Sikh', 'Jain', 'Any'],
//                         onChanged: (v) => setState(() => _religion = v),
//                       ),
//                       _FormField(label: 'Community', controller: _communityCtrl),
//                       _FormField(label: 'Education', controller: _prefEducationCtrl),
//                       _FormField(label: 'Occupation', controller: _prefOccupationCtrl),
//                       _FormField(label: 'Location', controller: _prefLocationCtrl),
//                     ]),
//                     _buildSection('Partner Expectations', Icons.favorite_border_rounded, [
//                       _FormField(label: 'Expectation', controller: _expectationCtrl, multiline: true),
//                     ]),
//                   ])),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(left: 0, right: 0, bottom: 0, child: _saveBar(context)),
//         ],
//       ),
//     );
//   }

//   Widget _buildCover(double top) {
//     return Stack(children: [
//       Container(height: 190 + top, decoration: const BoxDecoration(gradient: AppColors.gradHero)),
//       Positioned(
//         bottom: 0, left: 0, right: 0,
//         child: Container(
//           height: 90,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Color(0x80000000)]),
//           ),
//         ),
//       ),
//       Positioned(
//         top: top + 10, left: 16, right: 16,
//         child: Row(children: [
//           _AppBarBtn(Icons.arrow_back_ios_new_rounded, () => Navigator.pop(context)),
//           const Spacer(),
//           const Text('Edit Profile', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: -0.2)),
//           const Spacer(),
//           const SizedBox(width: 36),
//         ]),
//       ),
//       Positioned(
//         bottom: 18, left: 0, right: 0,
//         child: Center(
//           child: Stack(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(3),
//                 decoration: BoxDecoration(gradient: AppColors.gradRoseGold, shape: BoxShape.circle, boxShadow: AppColors.shadowGold),
//                 child: ClipOval(
//                   child: Container(
//                     width: 92, height: 92, color: AppColors.primaryLight,
//                     child: Image.asset(
//                       'assets/image/arun.png', fit: BoxFit.cover,
//                       errorBuilder: (_, __, ___) => Container(color: AppColors.primaryLight, child: const Icon(Icons.person, color: AppColors.primary, size: 38)),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 right: 0, bottom: 0,
//                 child: GestureDetector(
//                   onTap: () {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Choose a new profile photo')),
//                     );
//                   },
//                   child: Container(
//                     width: 30, height: 30,
//                     decoration: BoxDecoration(
//                       gradient: AppColors.gradPrimary,
//                       shape: BoxShape.circle,
//                       border: Border.all(color: Colors.white, width: 2),
//                     ),
//                     child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 15),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ]);
//   }

//   Widget _saveBar(BuildContext context) => Container(
//     padding: EdgeInsets.fromLTRB(16, 12, 16, MediaQuery.of(context).padding.bottom + 12),
//     decoration: BoxDecoration(
//       color: AppColors.surface,
//       boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16, offset: const Offset(0, -4))],
//     ),
//     child: Row(children: [
//       Expanded(
//         child: GestureDetector(
//           onTap: () => Navigator.pop(context),
//           child: Container(
//             padding: const EdgeInsets.symmetric(vertical: 15),
//             decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(AppColors.r16)),
//             child: const Center(child: Text('Cancel', style: TextStyle(color: AppColors.textSecondary, fontSize: 14, fontWeight: FontWeight.w700))),
//           ),
//         ),
//       ),
//       const SizedBox(width: 12),
//       Expanded(
//         flex: 2,
//         child: GestureDetector(
//           onTap: _save,
//           child: Container(
//             padding: const EdgeInsets.symmetric(vertical: 15),
//             decoration: BoxDecoration(gradient: AppColors.gradPrimary, borderRadius: BorderRadius.circular(AppColors.r16), boxShadow: AppColors.shadowPrimary),
//             child: const Center(child: Text('Save Changes', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800, letterSpacing: 0.2))),
//           ),
//         ),
//       ),
//     ]),
//   );

//   Widget _buildSection(String title, IconData icon, List<Widget> fields) {
//     final open = _expanded[title] ?? false;
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppColors.r16), boxShadow: AppColors.shadowSm),
//       child: Column(children: [
//         GestureDetector(
//           onTap: () => setState(() => _expanded[title] = !open),
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Row(children: [
//               Container(
//                 width: 36, height: 36,
//                 decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(AppColors.r10)),
//                 child: Icon(icon, size: 18, color: AppColors.primary),
//               ),
//               const SizedBox(width: 12),
//               Expanded(child: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.textPrimary))),
//               Icon(open ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded, color: AppColors.textHint, size: 22),
//             ]),
//           ),
//         ),
//         if (open) ...[
//           const Divider(height: 1, color: AppColors.border, indent: 16, endIndent: 16),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
//             child: Column(children: fields),
//           ),
//         ],
//       ]),
//     );
//   }
// }

// /// Non-editable field (e.g. system-assigned Profile ID).
// class _ReadOnlyRow extends StatelessWidget {
//   final String label, value;
//   const _ReadOnlyRow(this.label, this.value);

//   @override
//   Widget build(BuildContext context) => Padding(
//     padding: const EdgeInsets.only(bottom: 14),
//     child: Row(children: [
//       Expanded(
//         flex: 5,
//         child: Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textHint, fontWeight: FontWeight.w500)),
//       ),
//       const SizedBox(width: 8),
//       Expanded(
//         flex: 6,
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//           decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(10)),
//           child: Text(value, style: const TextStyle(fontSize: 12.5, color: AppColors.textHint, fontWeight: FontWeight.w600)),
//         ),
//       ),
//     ]),
//   );
// }

// /// Labeled editable text field, styled to match the app's standard inputs.
// class _FormField extends StatelessWidget {
//   final String label;
//   final TextEditingController controller;
//   final bool multiline;
//   final TextInputType? keyboardType;

//   const _FormField({
//     required this.label,
//     required this.controller,
//     this.multiline = false,
//     this.keyboardType,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 14),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(label, style: const TextStyle(fontSize: 11.5, color: AppColors.textHint, fontWeight: FontWeight.w600)),
//           const SizedBox(height: 6),
//           TextFormField(
//             controller: controller,
//             keyboardType: keyboardType,
//             minLines: multiline ? 3 : 1,
//             maxLines: multiline ? 5 : 1,
//             style: const TextStyle(fontSize: 13, color: AppColors.textPrimary, fontWeight: FontWeight.w600, height: 1.4),
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: AppColors.surfaceVariant,
//               isDense: true,
//               contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//               border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppColors.r10), borderSide: BorderSide.none),
//               enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppColors.r10), borderSide: BorderSide.none),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(AppColors.r10),
//                 borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// Labeled dropdown field for enumerated values (marital status, diet, etc).
// class _FormDropdown extends StatelessWidget {
//   final String label;
//   final String value;
//   final List<String> options;
//   final ValueChanged<String> onChanged;

//   const _FormDropdown({
//     required this.label,
//     required this.value,
//     required this.options,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 14),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(label, style: const TextStyle(fontSize: 11.5, color: AppColors.textHint, fontWeight: FontWeight.w600)),
//           const SizedBox(height: 6),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 14),
//             decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(AppColors.r10)),
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton<String>(
//                 value: value,
//                 isExpanded: true,
//                 icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.textHint),
//                 style: const TextStyle(fontSize: 13, color: AppColors.textPrimary, fontWeight: FontWeight.w600),
//                 dropdownColor: AppColors.surface,
//                 borderRadius: BorderRadius.circular(AppColors.r16),
//                 items: options.map((o) => DropdownMenuItem(value: o, child: Text(o))).toList(),
//                 onChanged: (v) {
//                   if (v != null) onChanged(v);
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _AppBarBtn extends StatelessWidget {
//   final IconData icon;
//   final VoidCallback onTap;
//   const _AppBarBtn(this.icon, this.onTap);
//   @override
//   Widget build(BuildContext context) => GestureDetector(
//     onTap: onTap,
//     child: Container(
//       width: 36, height: 36,
//       decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
//       child: Icon(icon, color: Colors.white, size: 18),
//     ),
//   );
// }




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/custom_widgets/auto_changing_image.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F8),
      body: CustomScrollView(
        slivers: [
          _buildHeaderSliver(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
                  _buildStatsRow(),
                  SizedBox(height: 12.h),
                  _buildCompletionBar(),
                  SizedBox(height: 16.h),
                  _buildAboutSection(),
                  SizedBox(height: 14.h),
                  _buildBasicDetailsSection(),
                  SizedBox(height: 14.h),
                  _buildPhysicalAttributesSection(),
                  SizedBox(height: 14.h),
                  _buildEducationCareerSection(),
                  SizedBox(height: 14.h),
                  _buildFamilyDetailsSection(),
                  SizedBox(height: 14.h),
                  _buildHoroscopeSection(),
                  SizedBox(height: 18.h),
                  _buildPartnerPreferencesHeader(),
                  SizedBox(height: 10.h),
                  _buildPreferenceCard(
                    title: 'Basic Preferences',
                    rows: const [
                      _Row('Age Range', '25 - 32 yrs'),
                      _Row('Height', "5'2\" - 6'0\""),
                      _Row('Marital Status', 'Never Married'),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  _buildPreferenceCard(
                    title: 'Religious Preferences',
                    rows: const [
                      _Row('Religion', 'Hindu'),
                      _Row('Community', 'Any, Nair, Ezhava'),
                    ],
                    showViewMore: true,
                  ),
                  SizedBox(height: 10.h),
                  _buildPreferenceCard(
                    title: 'Lifestyle Preferences',
                    rows: const [
                      _Row('Diet', 'Any'),
                      _Row('Smoking', 'Non-Smoker'),
                      _Row('Drinking Habit', 'Occasionally'),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  _buildPreferenceCard(
                    title: 'Location Preferences',
                    rows: const [
                      _Row('Country', 'India'),
                      _Row('State', 'Kerala, Tamil Nadu'),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  _buildResidenceSection(),
                  SizedBox(height: 14.h),
                  _buildContactDetailsSection(),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- HEADER ----------------

  Widget _buildHeaderSliver(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 430.h,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: _circleIconButton(
          icon: Icons.arrow_back,
          onTap: () => Navigator.of(context).maybePop(),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: _circleIconButton(
            icon: Icons.camera_alt_outlined,
            onTap: () {
              // TODO: open photo upload/edit
            },
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            const AutoChangingImage(
              imageUrls: [
                'assets/image/person.png',
                'assets/image/person2.png'
              ],
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.65),
                  ],
                  stops: const [0.5, 1.0],
                ),
              ),
            ),
            Positioned(
              left: 16.w,
              right: 16.w,
              bottom: 16.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Aravind K.',
                              style: GoogleFonts.tasaOrbiter(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 5.w,),
                            Image.asset(
                          'assets/image/verified.png',
                          height: 20.h,
                          width: 20.w,
                        )
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'SH536637002',
                          style: GoogleFonts.tasaOrbiter(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // _pillTag(
                  //   icon: Icons.verified,
                  //   label: 'Verified',
                  //   bgColor: Colors.white,
                  //   fgColor: AppColors.coral,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleIconButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36.w,
        height: 36.w,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.35),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 18.sp, color: Colors.white),
      ),
    );
  }

  Widget _pillTag({
    required IconData icon,
    required String label,
    required Color bgColor,
    required Color fgColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13.sp, color: fgColor),
          SizedBox(width: 4.w),
          Text(
            label,
            style: GoogleFonts.tasaOrbiter(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: fgColor,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- STATS + COMPLETION ----------------

  Widget _buildStatsRow() {
    return Row(
      children: [
        Expanded(
          child: _statChip(
            image: 'assets/image/add_photo_alternate.png',
            value: 'Manage Photos',
            bgColor: const Color(0xFFEAF4FF),
            //iconColor: const Color(0xFF2E7DD7),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: _statChip(
            image: 'assets/image/planet.png',
            value: 'Manage Horoscope',
            bgColor: const Color(0xFFE8F8EE),
            //iconColor: const Color(0xFF2E9E5B),
          ),
        ),
      ],
    );
  }

  Widget _statChip({
    required String image,
    //required String label,
    required String value,
    required Color bgColor,
    //required Color iconColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          //Icon(icon, size: 16.sp, color: iconColor),
          Container(
            height: 57.h,
            width: 57.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17.r),
            ),
            child: Center(
              child: Image.asset(
                image,
                height: 24.h,
                width: 24.w,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletionBar() {
    const double completion = 0.72;
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF1F3),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Profile Completion',
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                '${(completion * 100).toInt()}%',
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.coral,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: LinearProgressIndicator(
              value: completion,
              minHeight: 6.h,
              backgroundColor: Colors.white,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.coral),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- ABOUT ----------------

  Widget _buildAboutSection() {
    return _SectionCard(
      title: 'About Aravind',
      onEdit: () {
        // TODO: navigate to edit about screen
      },
      child: Text(
        'A cheerful and ambitious software engineer who loves traveling, '
        'photography and spending time with family. Looking for a caring '
        'and like-minded life partner to share life\'s journey with.',
        style: GoogleFonts.tasaOrbiter(
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black54,
          height: 1.5,
        ),
      ),
    );
  }

  // ---------------- BASIC DETAILS ----------------

  Widget _buildBasicDetailsSection() {
    return _SectionCard(
      title: 'Basic Details',
      onEdit: () {
        // TODO: navigate to edit basic details screen
      },
      child: _DetailRows(rows: const [
        _Row('Full Name', 'Aravind Krishnan'),
        _Row('Gender', 'Male'),
        _Row('Date of Birth', '14 Jun 1997'),
        _Row('Age', '28 yrs'),
        _Row('Height', "5'9\" (175 cm)"),
        _Row('Marital Status', 'Never Married'),
        _Row('Mother Tongue', 'Malayalam'),
        _Row('Religion', 'Hindu'),
        _Row('Community', 'Nair'),
        _Row('Sub Caste', 'Vishwakarma'),
        _Row('Country', 'India'),
        _Row('State', 'Kerala'),
        _Row('City', 'Kochi'),
      ]),
    );
  }

  // ---------------- PHYSICAL ATTRIBUTES ----------------

  Widget _buildPhysicalAttributesSection() {
    return _SectionCard(
      title: 'Physical Attributes',
      onEdit: () {
        // TODO: navigate to edit physical attributes screen
      },
      child: _DetailRows(rows: const [
        _Row('Height', "5'9\" (175 cm)"),
        _Row('Weight', '72 kg'),
        _Row('Body Type', 'Athletic'),
        _Row('Complexion', 'Wheatish'),
        _Row('Blood Group', 'O+'),
        _Row('Physical Status', 'Normal'),
        _Row('Eating Habits', 'Non-Vegetarian'),
        _Row('Drinking Habits', 'Occasionally'),
        _Row('Smoking Habits', 'Non-Smoker'),
        _Row('Hobbies & Interests', 'Travel, Photography, Cricket'),
      ]),
    );
  }

  // ---------------- EDUCATION & CAREER ----------------

  Widget _buildEducationCareerSection() {
    return _SectionCard(
      title: 'Education & Career',
      onEdit: () {
        // TODO: navigate to edit education & career screen
      },
      child: _DetailRows(rows: const [
        _Row('Highest Education', 'M.Tech Computer Science'),
        _Row('Employed In', 'Private Company'),
        _Row('Occupation', 'Software Engineer'),
        _Row('Annual Income', '₹12,00,000 - ₹15,00,000'),
        _Row('Company', 'Tech Solutions Pvt Ltd'),
        _Row('Work Location', 'Kochi, Kerala'),
      ]),
    );
  }

  // ---------------- FAMILY DETAILS ----------------

  Widget _buildFamilyDetailsSection() {
    return _SectionCard(
      title: 'Family Details',
      onEdit: () {
        // TODO: navigate to edit family details screen
      },
      child: _DetailRows(rows: const [
        _Row('Father\'s Status', 'Employed'),
        _Row('Mother\'s Status', 'Homemaker'),
        _Row('Siblings', '1 Brother, 1 Sister'),
        _Row('Family Type', 'Nuclear Family'),
        _Row('Family Values', 'Traditional'),
        _Row('Family Location', 'Kochi, Kerala'),
      ]),
    );
  }

  // ---------------- HOROSCOPE ----------------

  Widget _buildHoroscopeSection() {
    return _SectionCard(
      title: 'Horoscope Details',
      onEdit: () {
        // TODO: navigate to edit horoscope screen
      },
      child: _DetailRows(rows: const [
        _Row('Place of Birth', 'Kochi, Kerala'),
        _Row('Time of Birth', '06:45 AM'),
        _Row('Star (Nakshatra)', 'Rohini'),
        _Row('Raasi (Moon Sign)', 'Vrishabha'),
        _Row('Gothram', 'Bharadwaja'),
        _Row('Dosham', 'None'),
        _Row('Horoscope Match Required', 'Yes'),
      ]),
    );
  }

  // ---------------- PARTNER PREFERENCES ----------------

  Widget _buildPartnerPreferencesHeader() {
    return Text(
      'Partner Preferences',
      style: GoogleFonts.tasaOrbiter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildPreferenceCard({
    required String title,
    required List<_Row> rows,
    bool showViewMore = false,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF1F3),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 13.5.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.coral,
                ),
              ),
              Icon(Icons.edit_outlined, size: 16.sp, color: AppColors.coral),
            ],
          ),
          SizedBox(height: 8.h),
          _DetailRows(rows: rows, dense: true),
          if (showViewMore) ...[
            SizedBox(height: 6.h),
            GestureDetector(
              onTap: () {
                // TODO: expand full preference list
              },
              child: Text(
                'View More',
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.coral,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ---------------- RESIDENCE ----------------

  Widget _buildResidenceSection() {
    return _SectionCard(
      title: 'Residence',
      onEdit: () {
        // TODO: navigate to edit residence screen
      },
      child: _DetailRows(rows: const [
        _Row('Citizenship', 'India'),
        _Row('Living Status', 'Living with Family'),
        _Row('Visa Status', 'Not Applicable'),
      ]),
    );
  }

  // ---------------- CONTACT DETAILS ----------------

  Widget _buildContactDetailsSection() {
    return _SectionCard(
      title: 'Contact Details',
      onEdit: () {
        // TODO: navigate to edit contact details screen
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _DetailRows(rows: const [
            _Row('Email', 'aravind.k@email.com'),
            _Row('Address', 'Kakkanad, Kochi, Kerala'),
          ]),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                'Phone Number',
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 12.5.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // TODO: reveal phone number
                },
                child: Text(
                  'View Number',
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 12.5.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.coral,
                    decoration: TextDecoration.underline,
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

// ---------------- REUSABLE WIDGETS ----------------

class _Row {
  final String label;
  final String value;
  const _Row(this.label, this.value);
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback onEdit;

  const _SectionCard({
    required this.title,
    required this.child,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              GestureDetector(
                onTap: onEdit,
                child: Icon(
                  Icons.edit_outlined,
                  size: 16.sp,
                  color: AppColors.coral,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          child,
        ],
      ),
    );
  }
}

class _DetailRows extends StatelessWidget {
  final List<_Row> rows;
  final bool dense;

  const _DetailRows({required this.rows, this.dense = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: rows
          .map(
            (r) => Padding(
              padding: EdgeInsets.only(bottom: dense ? 4.h : 8.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      r.label,
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 12.5.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      r.value,
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 12.5.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}