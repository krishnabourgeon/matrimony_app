// // // ═══════════════════════════════════════════════════════════════
// // //  EDIT PARTNER PREFERENCE — tabbed Basic / Religious / Location /
// // //  Education & Professional / Horoscope preference form
// // // ═══════════════════════════════════════════════════════════════
// // import 'package:flutter/material.dart';
// // import 'package:matrimony_app/view/custom_widgets/app_color.dart';

// // class EditPartnerPreferenceScreen extends StatefulWidget {
// //   const EditPartnerPreferenceScreen({super.key});

// //   @override
// //   State<EditPartnerPreferenceScreen> createState() =>
// //       _EditPartnerPreferenceScreenState();
// // }

// // class _EditPartnerPreferenceScreenState
// //     extends State<EditPartnerPreferenceScreen>
// //     with SingleTickerProviderStateMixin {
// //   late final TabController _tabController;

// //   // ── Basic Preferences ──
// //   String? _ageFrom, _ageTo;
// //   String? _heightFrom, _heightTo;
// //   String? _weightFrom, _weightTo;
// //   String? _maritalStatus;
// //   String? _disabilityStatus = 'No';
// //   String? _surgeryPref;
// //   String? _familyStatus;
// //   String? _bodyType;
// //   String? _skinTone;
// //   String? _familyType;
// //   String? _foodType;
// //   String? _drinking;
// //   String? _smoking;

// //   // ── Religious Details ──
// //   String? _religion;
// //   String? _caste;
// //   String? _gotra;

// //   // ── Location Details ──
// //   String? _country;
// //   String? _state;
// //   String? _city;

// //   // ── Education & Professional Details ──
// //   String? _qualification;
// //   String? _employmentType;
// //   String? _occupation;
// //   String? _salary;
// //   String? _languagesKnown;
// //   String? _familyProperty;

// //   // ── Horoscope Details ──
// //   String? _withHoroscope;
// //   String? _withStar;
// //   String? _withSudhaJathakam;
// //   String? _withDoshaJathakam;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _tabController = TabController(length: 5, vsync: this);
// //   }

// //   @override
// //   void dispose() {
// //     _tabController.dispose();
// //     super.dispose();
// //   }

// //   List<String> _range(int start, int end, {String suffix = ''}) =>
// //       List.generate(end - start + 1, (i) => '${start + i}$suffix');

// //   void _submit() {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       const SnackBar(content: Text('Partner preferences saved')),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: AppColors.background,
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 0,
// //         iconTheme: const IconThemeData(color: AppColors.textPrimary),
// //         title: const Text('Edit Partner Preference',
// //             style: TextStyle(
// //                 color: AppColors.textPrimary,
// //                 fontSize: 16,
// //                 fontWeight: FontWeight.w800)),
// //         bottom: TabBar(
// //           controller: _tabController,
// //           isScrollable: true,
// //           labelColor: AppColors.primary,
// //           unselectedLabelColor: AppColors.textSecondary,
// //           indicatorColor: AppColors.primary,
// //           labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
// //           tabs: const [
// //             Tab(text: 'Basic details'),
// //             Tab(text: 'Religious details'),
// //             Tab(text: 'Location details'),
// //             Tab(text: 'Education & Professional details'),
// //             Tab(text: 'Horoscope details'),
// //           ],
// //         ),
// //       ),
// //       body: TabBarView(
// //         controller: _tabController,
// //         children: [
// //           _buildBasicTab(),
// //           _buildReligiousTab(),
// //           _buildLocationTab(),
// //           _buildEducationTab(),
// //           _buildHoroscopeTab(),
// //         ],
// //       ),
// //     );
// //   }

// //   // ── Shared card + row helpers ──

// //   Widget _card({required String title, required List<Widget> rows}) {
// //     return SingleChildScrollView(
// //       padding: const EdgeInsets.all(16),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Container(
// //             width: double.infinity,
// //             padding: const EdgeInsets.all(20),
// //             decoration: BoxDecoration(
// //               color: Colors.white,
// //               borderRadius: BorderRadius.circular(AppColors.r20),
// //               border: Border.all(color: AppColors.border),
// //             ),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(title,
// //                     style: const TextStyle(
// //                         fontSize: 18,
// //                         fontWeight: FontWeight.w800,
// //                         color: AppColors.primary)),
// //                 const SizedBox(height: 12),
// //                 const Divider(height: 1, color: AppColors.divider),
// //                 ...rows,
// //               ],
// //             ),
// //           ),
// //           const SizedBox(height: 20),
// //           Align(
// //             alignment: Alignment.centerRight,
// //             child: ElevatedButton(
// //               onPressed: _submit,
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: AppColors.primary,
// //                 foregroundColor: Colors.white,
// //                 padding:
// //                     const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
// //                 shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(AppColors.r32)),
// //               ),
// //               child: const Text('Submit',
// //                   style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _row(String label, Widget control) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Padding(
// //           padding: const EdgeInsets.symmetric(vertical: 14),
// //           child: Row(
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //               SizedBox(
// //                 width: 130,
// //                 child: Text(label,
// //                     style: const TextStyle(
// //                         fontSize: 13,
// //                         fontWeight: FontWeight.w600,
// //                         color: AppColors.textPrimary)),
// //               ),
// //               const SizedBox(width: 12),
// //               Expanded(child: control),
// //             ],
// //           ),
// //         ),
// //         const Divider(height: 1, color: AppColors.divider),
// //       ],
// //     );
// //   }

// //   Widget _dropdownBox(
// //       String? value, List<String> items, ValueChanged<String?> onChanged,
// //       {String hint = 'Select'}) {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 10),
// //       decoration: BoxDecoration(
// //         border: Border.all(color: AppColors.border),
// //         borderRadius: BorderRadius.circular(8),
// //       ),
// //       child: DropdownButtonHideUnderline(
// //         child: DropdownButton<String>(
// //           value: value,
// //           isExpanded: true,
// //           isDense: true,
// //           hint: Text(hint,
// //               style: const TextStyle(fontSize: 12, color: AppColors.textHint)),
// //           icon: const Icon(Icons.keyboard_arrow_down_rounded,
// //               size: 18, color: AppColors.textHint),
// //           style: const TextStyle(fontSize: 12, color: AppColors.textPrimary),
// //           items: items
// //               .map((v) => DropdownMenuItem(value: v, child: Text(v)))
// //               .toList(),
// //           onChanged: onChanged,
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _rangeRow(String? from, String? to, List<String> items,
// //       ValueChanged<String?> onFrom, ValueChanged<String?> onTo) {
// //     return Row(
// //       children: [
// //         Expanded(child: _dropdownBox(from, items, onFrom)),
// //         const Padding(
// //           padding: EdgeInsets.symmetric(horizontal: 8),
// //           child: Text('to',
// //               style: TextStyle(fontSize: 12, color: AppColors.textHint)),
// //         ),
// //         Expanded(child: _dropdownBox(to, items, onTo)),
// //       ],
// //     );
// //   }

// //   Widget _yesNoRadio(String? value, ValueChanged<String?> onChanged) {
// //     return Row(children: [
// //       Radio<String>(
// //         value: 'Yes',
// //         groupValue: value,
// //         activeColor: AppColors.primary,
// //         onChanged: onChanged,
// //         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
// //       ),
// //       const Text('Yes', style: TextStyle(fontSize: 13)),
// //       const SizedBox(width: 16),
// //       Radio<String>(
// //         value: 'No',
// //         groupValue: value,
// //         activeColor: AppColors.primary,
// //         onChanged: onChanged,
// //         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
// //       ),
// //       const Text('No', style: TextStyle(fontSize: 13)),
// //     ]);
// //   }

// //   // ── Tabs ──

// //   Widget _buildBasicTab() {
// //     return _card(title: 'Basic Preferences', rows: [
// //       _row(
// //           'Age',
// //           _rangeRow(_ageFrom, _ageTo, _range(18, 70),
// //               (v) => setState(() => _ageFrom = v), (v) => setState(() => _ageTo = v))),
// //       _row(
// //           'Height',
// //           _rangeRow(
// //               _heightFrom,
// //               _heightTo,
// //               _range(131, 210, suffix: 'cm'),
// //               (v) => setState(() => _heightFrom = v),
// //               (v) => setState(() => _heightTo = v))),
// //       _row(
// //           'Weight',
// //           _rangeRow(
// //               _weightFrom,
// //               _weightTo,
// //               _range(35, 150, suffix: 'kg'),
// //               (v) => setState(() => _weightFrom = v),
// //               (v) => setState(() => _weightTo = v))),
// //       _row(
// //           'Marital Status',
// //           _dropdownBox(
// //               _maritalStatus,
// //               const [
// //                 'Never Married',
// //                 'Divorced',
// //                 'Widow/er',
// //                 'Awaiting Divorce',
// //                 'Annulled'
// //               ],
// //               (v) => setState(() => _maritalStatus = v))),
// //       _row(
// //           'Disability Status',
// //           _dropdownBox(_disabilityStatus, const ['No', 'Yes'],
// //               (v) => setState(() => _disabilityStatus = v))),
// //       _row(
// //           'Are you preferring persons who have undergone major surgery or Organ transplantation',
// //           _yesNoRadio(_surgeryPref, (v) => setState(() => _surgeryPref = v))),
// //       _row(
// //           'Family Status',
// //           _dropdownBox(
// //               _familyStatus,
// //               const ['Upper Middle Class', 'Middle Class', 'Lower Middle Class'],
// //               (v) => setState(() => _familyStatus = v))),
// //       _row(
// //           'Body type',
// //           _dropdownBox(_bodyType, const ['Slim', 'Average', 'Athletic', 'Heavy'],
// //               (v) => setState(() => _bodyType = v))),
// //       _row(
// //           'Body skin tone',
// //           _dropdownBox(_skinTone, const ['Fair', 'Wheatish', 'Dusky', 'Dark'],
// //               (v) => setState(() => _skinTone = v))),
// //       _row(
// //           'Family type',
// //           _dropdownBox(_familyType, const ['Nuclear Family', 'Joint Family'],
// //               (v) => setState(() => _familyType = v))),
// //       _row(
// //           'Food type',
// //           _dropdownBox(
// //               _foodType,
// //               const ['Vegetarian', 'Non-Vegetarian', 'Vegan', 'Eggetarian'],
// //               (v) => setState(() => _foodType = v))),
// //       _row(
// //           'Drinking habits',
// //           _dropdownBox(_drinking, const ['Yes', 'No', "Don't Know"],
// //               (v) => setState(() => _drinking = v))),
// //       _row(
// //           'Smoking habits',
// //           _dropdownBox(_smoking, const ['Yes', 'No', "Don't Know"],
// //               (v) => setState(() => _smoking = v))),
// //     ]);
// //   }

// //   Widget _buildReligiousTab() {
// //     return _card(title: 'Religious Details', rows: [
// //       _row(
// //           'Religion',
// //           _dropdownBox(
// //               _religion,
// //               const ['Hindu', 'Muslim', 'Christian', 'Sikh', 'Jain', 'Buddhist'],
// //               (v) => setState(() => _religion = v))),
// //       _row(
// //           'Caste',
// //           _dropdownBox(_caste, const ['Nair', 'Thiyya', 'Ezhava', 'Sunni', 'Mujahid'],
// //               (v) => setState(() => _caste = v))),
// //       _row(
// //           'Gotra',
// //           _dropdownBox(_gotra, const ['Atreya', 'Gavishthira', 'Viswamithra'],
// //               (v) => setState(() => _gotra = v))),
// //     ]);
// //   }

// //   Widget _buildLocationTab() {
// //     return _card(title: 'Location Details', rows: [
// //       _row(
// //           'Country',
// //           _dropdownBox(_country, const ['India', 'USA', 'UK', 'UAE', 'Canada'],
// //               (v) => setState(() => _country = v))),
// //       _row(
// //           'State',
// //           _dropdownBox(
// //               _state, const ['Kerala', 'Gujarat', 'Tamil Nadu', 'Karnataka'],
// //               (v) => setState(() => _state = v))),
// //       _row(
// //           'City',
// //           _dropdownBox(
// //               _city,
// //               const ['Kozhikode', 'Palakkad', 'Surat', 'Malappuram'],
// //               (v) => setState(() => _city = v))),
// //     ]);
// //   }

// //   Widget _buildEducationTab() {
// //     return _card(title: 'Education & Professional Details', rows: [
// //       _row(
// //           'Qualification',
// //           _dropdownBox(
// //               _qualification,
// //               const ['Bachelors Degree', 'Masters Degree', 'Diploma', '10th', '12th'],
// //               (v) => setState(() => _qualification = v))),
// //       _row(
// //           'Employment type',
// //           _dropdownBox(
// //               _employmentType,
// //               const [
// //                 'Healthcare',
// //                 'Information Technology',
// //                 'Farmer',
// //                 'Defence',
// //                 'Government/PSU',
// //                 'Private Sector',
// //                 'Business',
// //                 'Others'
// //               ],
// //               (v) => setState(() => _employmentType = v))),
// //       _row(
// //           'Occupation',
// //           _dropdownBox(
// //               _occupation,
// //               const [
// //                 'Doctor',
// //                 'Software Developer',
// //                 'Teacher',
// //                 'Business',
// //                 'Engineer',
// //                 'Others'
// //               ],
// //               (v) => setState(() => _occupation = v))),
// //       _row(
// //           'Salary',
// //           _dropdownBox(
// //               _salary,
// //               const ['10L to 20L', '20L to 30L', '2L to 3L', '20K to 30K', '5K - 10K AED'],
// //               (v) => setState(() => _salary = v))),
// //       _row(
// //           'Languages known',
// //           _dropdownBox(
// //               _languagesKnown,
// //               const ['Malayalam', 'English', 'Hindi', 'Tamil', 'Telugu', 'Kannada'],
// //               (v) => setState(() => _languagesKnown = v))),
// //       _row(
// //           'Family property',
// //           _dropdownBox(
// //               _familyProperty,
// //               const ['10L to 20L', '20L to 30L', '2L to 3L', '20K to 30K', '5K - 10K AED'],
// //               (v) => setState(() => _familyProperty = v))),
// //     ]);
// //   }

// //   Widget _buildHoroscopeTab() {
// //     return _card(title: 'Horoscope Details', rows: [
// //       _row('Profile with horoscope',
// //           _yesNoRadio(_withHoroscope, (v) => setState(() => _withHoroscope = v))),
// //       _row('Profile with star',
// //           _yesNoRadio(_withStar, (v) => setState(() => _withStar = v))),
// //       _row(
// //           'Profile with sudha jathakam',
// //           _yesNoRadio(
// //               _withSudhaJathakam, (v) => setState(() => _withSudhaJathakam = v))),
// //       _row(
// //           'Profile with dosha jathakam',
// //           _yesNoRadio(
// //               _withDoshaJathakam, (v) => setState(() => _withDoshaJathakam = v))),
// //     ]);
// //   }
// // }










// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// /// ============================================================
// /// MODELS
// /// ============================================================

// class PreferenceRow {
//   final String label;
//   final String value;
//   const PreferenceRow(this.label, this.value);
// }

// class PreferenceSection {
//   final String title;
//   final List<PreferenceRow> rows;
//   final bool showMoreAvailable;

//   const PreferenceSection({
//     required this.title,
//     required this.rows,
//     this.showMoreAvailable = false,
//   });

//   /// A section is considered "empty" if the user hasn't filled any real
//   /// values yet (all rows missing or every value is empty/"Not Specified").
//   bool get isEmpty => rows.isEmpty ||
//       rows.every((r) => r.value.trim().isEmpty || r.value == 'Not Specified');
// }

// /// ============================================================
// /// SCREEN — handles BOTH filled and empty states automatically.
// /// Pass an empty `sections` list (or sections with no rows) to see
// /// the empty state; pass populated sections to see the filled state.
// /// ============================================================

// class PartnerPreferencesScreen extends StatelessWidget {
//   final List<PreferenceSection> sections;

//   const PartnerPreferencesScreen({super.key, required this.sections});

//   bool get _hasAnyData => sections.any((s) => !s.isEmpty);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: _buildAppBar(context),
//       body: _hasAnyData
//           ? _buildFilledState(context)
//           : _buildEmptyState(context),
//     );
//   }

//   PreferredSizeWidget _buildAppBar(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.white,
//       elevation: 0,
//       centerTitle: false,
//       leading: IconButton(
//         icon: Icon(Icons.arrow_back, size: 20.sp, color: Colors.black),
//         onPressed: () => Navigator.of(context).maybePop(),
//       ),
//       title: Text(
//         'Partner Preferences',
//         style: GoogleFonts.tasaOrbiter(
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w700,
//           color: Colors.black,
//         ),
//       ),
//     );
//   }

//   // ---------------- FILLED STATE ----------------

//   Widget _buildFilledState(BuildContext context) {
//     return SingleChildScrollView(
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Edit Preferences',
//                 style: GoogleFonts.tasaOrbiter(
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w700,
//                   color: Colors.black87,
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   // TODO: navigate to the editable preferences form
//                 },
//                 child: Icon(Icons.edit_outlined, size: 18.sp, color: AppColors.coral),
//               ),
//             ],
//           ),
//           SizedBox(height: 14.h),
//           for (final section in sections) ...[
//             _PreferenceSectionCard(section: section),
//             SizedBox(height: 12.h),
//           ],
//         ],
//       ),
//     );
//   }

//   // ---------------- EMPTY STATE ----------------

//   Widget _buildEmptyState(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 28.w),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Spacer(),
//           _buildEmptyIllustration(),
//           SizedBox(height: 24.h),
//           Text(
//             "You haven't set your\npartner preferences yet",
//             textAlign: TextAlign.center,
//             style: GoogleFonts.tasaOrbiter(
//               fontSize: 18.sp,
//               fontWeight: FontWeight.w700,
//               color: Colors.black87,
//               height: 1.3,
//             ),
//           ),
//           SizedBox(height: 8.h),
//           Text(
//             'Tell us what you\'re looking for in a partner to get better, '
//             'more relevant matches.',
//             textAlign: TextAlign.center,
//             style: GoogleFonts.tasaOrbiter(
//               fontSize: 13.sp,
//               fontWeight: FontWeight.w400,
//               color: Colors.black54,
//               height: 1.5,
//             ),
//           ),
//           SizedBox(height: 28.h),
//           SizedBox(
//             width: double.infinity,
//             height: 52.h,
//             child: ElevatedButton(
//               onPressed: () {
//                 // TODO: navigate to the add-preferences form
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.coral,
//                 elevation: 0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(26.r),
//                 ),
//               ),
//               child: Text(
//                 'Add Preferences',
//                 style: GoogleFonts.tasaOrbiter(
//                   fontSize: 15.sp,
//                   fontWeight: FontWeight.w700,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           const Spacer(),
//           SizedBox(height: 12.h),
//         ],
//       ),
//     );
//   }

//   Widget _buildEmptyIllustration() {
//     return Container(
//       width: 140.w,
//       height: 140.w,
//       decoration: BoxDecoration(
//         color: const Color(0xFFFFF1F3),
//         shape: BoxShape.circle,
//       ),
//       child: Icon(
//         Icons.favorite_border,
//         size: 56.sp,
//         color: AppColors.coral,
//       ),
//     );
//   }
// }

// /// ============================================================
// /// SECTION CARD (pink, matches the filled-state screenshot)
// /// ============================================================

// class _PreferenceSectionCard extends StatefulWidget {
//   final PreferenceSection section;
//   const _PreferenceSectionCard({required this.section});

//   @override
//   State<_PreferenceSectionCard> createState() => _PreferenceSectionCardState();
// }

// class _PreferenceSectionCardState extends State<_PreferenceSectionCard> {
//   bool _expanded = false;

//   @override
//   Widget build(BuildContext context) {
//     final section = widget.section;

//     // Individual sections can still be empty even if others aren't —
//     // show an inline "not added" prompt rather than the full-screen state.
//     if (section.isEmpty) {
//       return _buildEmptySectionCard(section.title);
//     }

//     final visibleRows = (!_expanded && section.showMoreAvailable && section.rows.length > 3)
//         ? section.rows.take(3).toList()
//         : section.rows;

//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(14.w),
//       decoration: BoxDecoration(
//         color: const Color(0xFFFFF1F3),
//         borderRadius: BorderRadius.circular(14.r),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             section.title,
//             style: GoogleFonts.tasaOrbiter(
//               fontSize: 13.5.sp,
//               fontWeight: FontWeight.w700,
//               color: AppColors.coral,
//             ),
//           ),
//           SizedBox(height: 8.h),
//           for (final row in visibleRows)
//             Padding(
//               padding: EdgeInsets.only(bottom: 6.h),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     flex: 4,
//                     child: Text(
//                       row.label,
//                       style: GoogleFonts.tasaOrbiter(
//                         fontSize: 12.5.sp,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black54,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 5,
//                     child: Text(
//                       row.value,
//                       style: GoogleFonts.tasaOrbiter(
//                         fontSize: 12.5.sp,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           if (section.showMoreAvailable && section.rows.length > 3)
//             GestureDetector(
//               onTap: () => setState(() => _expanded = !_expanded),
//               child: Text(
//                 _expanded ? 'Show Less' : 'Show More',
//                 style: GoogleFonts.tasaOrbiter(
//                   fontSize: 12.sp,
//                   fontWeight: FontWeight.w600,
//                   color: AppColors.coral,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildEmptySectionCard(String title) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(14.w),
//       decoration: BoxDecoration(
//         color: const Color(0xFFFAFAFA),
//         borderRadius: BorderRadius.circular(14.r),
//         border: Border.all(color: const Color(0xFFEDEDED)),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: GoogleFonts.tasaOrbiter(
//                     fontSize: 13.5.sp,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.black54,
//                   ),
//                 ),
//                 SizedBox(height: 4.h),
//                 Text(
//                   'Not added yet',
//                   style: GoogleFonts.tasaOrbiter(
//                     fontSize: 12.sp,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black38,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               // TODO: navigate to add this specific section's details
//             },
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
//               decoration: BoxDecoration(
//                 color: AppColors.coral.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(20.r),
//               ),
//               child: Text(
//                 '+ Add',
//                 style: GoogleFonts.tasaOrbiter(
//                   fontSize: 12.sp,
//                   fontWeight: FontWeight.w600,
//                   color: AppColors.coral,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// ============================================================
// /// EXAMPLE USAGE
// /// ============================================================
// ///
// /// Filled state (matches your screenshot):
// ///
// /// PartnerPreferencesScreen(
// ///   sections: [
// ///     PreferenceSection(title: 'Basic Preference', rows: [
// ///       PreferenceRow("Bride's Age", '23 - 26'),
// ///       PreferenceRow('Height', "144 cm 4' 9\" - 160 cm 5'5\""),
// ///       PreferenceRow('Marital Status', 'Single'),
// ///     ]),
// ///     PreferenceSection(
// ///       title: 'Professional Preferences',
// ///       showMoreAvailable: true,
// ///       rows: [
// ///         PreferenceRow('Education', 'B.Tech, B.Arch, BE, B.Plan, B.S.'),
// ///         PreferenceRow('Job', 'Not Specified'),
// ///       ],
// ///     ),
// ///     PreferenceSection(title: 'Religious Preferences', rows: [
// ///       PreferenceRow('Religion', 'Hindu'),
// ///       PreferenceRow('Caste', 'Not Specified'),
// ///       PreferenceRow('Caste No Bar', 'No'),
// ///       PreferenceRow('Matching Star', 'Not Specified'),
// ///       PreferenceRow('Type of Jathakam', 'Not Specified'),
// ///     ]),
// ///     PreferenceSection(title: 'Location Preferences', rows: [
// ///       PreferenceRow('Country', 'India'),
// ///       PreferenceRow('State', 'Kerala'),
// ///       PreferenceRow('District', 'Palakkad, Thrisur, Malappuram, Ernakulam'),
// ///     ]),
// ///   ],
// /// )
// ///
// /// Empty state (nothing filled yet) — just pass an empty list:
// ///
// /// PartnerPreferencesScreen(sections: [])
// ///
// /// Mixed state (some sections filled, some not) is handled automatically —
// /// filled sections render normally, empty ones show the inline
// /// "Not added yet" + "+ Add" prompt.





import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';


/// ============================================================
/// SCREEN
/// ============================================================

class EditPartnerPreferenceScreen extends StatefulWidget {
  const EditPartnerPreferenceScreen({super.key});

  @override
  State<EditPartnerPreferenceScreen> createState() =>
      _EditPartnerPreferenceScreenState();
}

class _EditPartnerPreferenceScreenState
    extends State<EditPartnerPreferenceScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  static const _tabs = ['Basic', 'Religious', 'Location', 'Education', 'Horoscope'];

  // ---------------- FIELD STATE ----------------
  // Basic
  String? ageFrom, ageTo, heightFrom, heightTo, weightFrom, weightTo;
  String? maritalStatus, disabilityStatus = 'No', familyStatus;
  String? bodyType, bodySkinTone, familyType, foodType, drinkingHabits, smokingHabits;
  bool? preferSurgeryPersons;

  // Religious
  String? religion, caste, gotra;

  // Location
  String? country, state, city;

  // Education
  String? qualification, employmentType, occupation, salary, languagesKnown, familyProperty;

  // Horoscope
  bool? profileWithHoroscope, profileWithStar, profileWithSudhaJathakam, profileWithDoshaJathakam;
  String? preferredStar;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onUpdate() {
    // TODO: collect all field values and call your PartnerPreferenceProvider
    // e.g. context.read<PartnerPreferenceProvider>().updatePreferences(...)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Preferences updated')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 20.sp, color: Colors.black),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          'Partner Preference',
          style: GoogleFonts.tasaOrbiter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(44.h),
          child: _buildTabBar(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildBasicTab(),
          _buildReligiousTab(),
          _buildLocationTab(),
          _buildEducationTab(),
          _buildHoroscopeTab(),
        ],
      ),
      bottomNavigationBar: _buildUpdateButton(),
    );
  }

  // ---------------- TAB BAR ----------------

  Widget _buildTabBar() {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        labelColor: AppColors.coral,
        unselectedLabelColor: Colors.black45,
        indicatorColor: AppColors.coral,
        indicatorWeight: 2.5,
        labelStyle: GoogleFonts.tasaOrbiter(
          fontSize: 13.sp,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: GoogleFonts.tasaOrbiter(
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
        tabs: _tabs.map((t) => Tab(text: t)).toList(),
      ),
    );
  }

  // ---------------- BOTTOM BUTTON ----------------

  Widget _buildUpdateButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
      child: SizedBox(
        width: double.infinity,
        height: 52.h,
        child: ElevatedButton(
          onPressed: _onUpdate,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.coral,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26.r),
            ),
          ),
          child: Text(
            'Update',
            style: GoogleFonts.tasaOrbiter(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  // ---------------- TAB 1: BASIC ----------------

  Widget _buildBasicTab() {
    return _TabFormContainer(
      children: [
        _RangeFieldRow(
          label: 'Age',
          fromValue: ageFrom,
          toValue: ageTo,
          options: List.generate(63, (i) => '${18 + i}'),
          onFromChanged: (v) => setState(() => ageFrom = v),
          onToChanged: (v) => setState(() => ageTo = v),
        ),
        _RangeFieldRow(
          label: 'Height',
          fromValue: heightFrom,
          toValue: heightTo,
          options: const [
            "4'6\"", "4'9\"", "5'0\"", "5'3\"", "5'6\"", "5'9\"", "6'0\"", "6'3\""
          ],
          onFromChanged: (v) => setState(() => heightFrom = v),
          onToChanged: (v) => setState(() => heightTo = v),
        ),
        _RangeFieldRow(
          label: 'Weight',
          fromValue: weightFrom,
          toValue: weightTo,
          options: List.generate(16, (i) => '${40 + i * 5} kg'),
          onFromChanged: (v) => setState(() => weightFrom = v),
          onToChanged: (v) => setState(() => weightTo = v),
        ),
        _SelectFieldRow(
          label: 'Marital Status',
          value: maritalStatus,
          options: const ['Never Married', 'Divorced', 'Widowed', 'Separated', 'Any'],
          onChanged: (v) => setState(() => maritalStatus = v),
        ),
        _SelectFieldRow(
          label: 'Disability Status',
          value: disabilityStatus,
          options: const ['No', 'Yes', 'Any'],
          onChanged: (v) => setState(() => disabilityStatus = v),
        ),
        _YesNoFieldRow(
          label: 'Prefer persons who have undergone major\nsurgery or Organ transplantation',
          value: preferSurgeryPersons,
          onChanged: (v) => setState(() => preferSurgeryPersons = v),
        ),
        _SelectFieldRow(
          label: 'Family Status',
          value: familyStatus,
          options: const ['Middle Class', 'Upper Middle Class', 'Rich', 'Affluent', 'Any'],
          onChanged: (v) => setState(() => familyStatus = v),
        ),
        _SelectFieldRow(
          label: 'Body Type',
          value: bodyType,
          options: const ['Slim', 'Athletic', 'Average', 'Heavy', 'Any'],
          onChanged: (v) => setState(() => bodyType = v),
        ),
        _SelectFieldRow(
          label: 'Body Skin Tone',
          value: bodySkinTone,
          options: const ['Fair', 'Wheatish', 'Wheatish Brown', 'Dark', 'Any'],
          onChanged: (v) => setState(() => bodySkinTone = v),
        ),
        _SelectFieldRow(
          label: 'Family Type',
          value: familyType,
          options: const ['Nuclear Family', 'Joint Family', 'Any'],
          onChanged: (v) => setState(() => familyType = v),
        ),
        _SelectFieldRow(
          label: 'Food Type',
          value: foodType,
          options: const ['Vegetarian', 'Non-Vegetarian', 'Eggetarian', 'Any'],
          onChanged: (v) => setState(() => foodType = v),
        ),
        _SelectFieldRow(
          label: 'Drinking Habits',
          value: drinkingHabits,
          options: const ['Non-Drinker', 'Occasionally', 'Regularly', 'Any'],
          onChanged: (v) => setState(() => drinkingHabits = v),
        ),
        _SelectFieldRow(
          label: 'Smoking Habits',
          value: smokingHabits,
          options: const ['Non-Smoker', 'Occasionally', 'Regularly', 'Any'],
          onChanged: (v) => setState(() => smokingHabits = v),
          isLast: true,
        ),
      ],
    );
  }

  // ---------------- TAB 2: RELIGIOUS ----------------

  Widget _buildReligiousTab() {
    return _TabFormContainer(
      children: [
        _SelectFieldRow(
          label: 'Religion',
          value: religion,
          options: const ['Hindu', 'Christian', 'Muslim', 'Sikh', 'Jain', 'Any'],
          onChanged: (v) => setState(() => religion = v),
        ),
        _SelectFieldRow(
          label: 'Caste',
          value: caste,
          options: const ['Nair', 'Ezhava', 'Brahmin', 'Vishwakarma', 'Any'],
          onChanged: (v) => setState(() => caste = v),
        ),
        _SelectFieldRow(
          label: 'Gotra',
          value: gotra,
          options: const ['Bharadwaja', 'Kashyapa', 'Vashista', 'Any'],
          onChanged: (v) => setState(() => gotra = v),
          isLast: true,
        ),
      ],
    );
  }

  // ---------------- TAB 3: LOCATION ----------------

  Widget _buildLocationTab() {
    return _TabFormContainer(
      children: [
        _SelectFieldRow(
          label: 'Country',
          value: country,
          options: const ['India', 'UAE', 'USA', 'UK', 'Any'],
          onChanged: (v) => setState(() => country = v),
        ),
        _SelectFieldRow(
          label: 'State',
          value: state,
          options: const ['Kerala', 'Tamil Nadu', 'Karnataka', 'Any'],
          onChanged: (v) => setState(() => state = v),
        ),
        _SelectFieldRow(
          label: 'City',
          value: city,
          options: const ['Kochi', 'Thrissur', 'Palakkad', 'Ernakulam', 'Any'],
          onChanged: (v) => setState(() => city = v),
          isLast: true,
        ),
      ],
    );
  }

  // ---------------- TAB 4: EDUCATION & PROFESSIONAL ----------------

  Widget _buildEducationTab() {
    return _TabFormContainer(
      children: [
        _SelectFieldRow(
          label: 'Qualification',
          value: qualification,
          options: const ['B.Tech', 'B.Arch', 'BE', 'B.Plan', 'B.S.', 'M.Tech', 'MBA', 'Any'],
          onChanged: (v) => setState(() => qualification = v),
        ),
        _SelectFieldRow(
          label: 'Employment Type',
          value: employmentType,
          options: const ['Private', 'Government', 'Business', 'Self-Employed', 'Not Working', 'Any'],
          onChanged: (v) => setState(() => employmentType = v),
        ),
        _SelectFieldRow(
          label: 'Occupation',
          value: occupation,
          options: const ['Software Engineer', 'Doctor', 'Teacher', 'Business Owner', 'Any'],
          onChanged: (v) => setState(() => occupation = v),
        ),
        _SelectFieldRow(
          label: 'Salary',
          value: salary,
          options: const ['< 3 LPA', '3 - 6 LPA', '6 - 10 LPA', '10 - 15 LPA', '15+ LPA', 'Any'],
          onChanged: (v) => setState(() => salary = v),
        ),
        _SelectFieldRow(
          label: 'Languages Known',
          value: languagesKnown,
          options: const ['Malayalam', 'English', 'Tamil', 'Hindi', 'Kannada'],
          onChanged: (v) => setState(() => languagesKnown = v),
        ),
        _SelectFieldRow(
          label: 'Family Property',
          value: familyProperty,
          options: const ['Yes', 'No', 'Any'],
          onChanged: (v) => setState(() => familyProperty = v),
          isLast: true,
        ),
      ],
    );
  }

  // ---------------- TAB 5: HOROSCOPE ----------------

  Widget _buildHoroscopeTab() {
    return _TabFormContainer(
      children: [
        _YesNoFieldRow(
          label: 'Profile with horoscope',
          value: profileWithHoroscope,
          onChanged: (v) => setState(() => profileWithHoroscope = v),
        ),
        _YesNoFieldRow(
          label: 'Profile with star',
          value: profileWithStar,
          onChanged: (v) => setState(() => profileWithStar = v),
        ),
        _YesNoFieldRow(
          label: 'Profile with sudha jathakam',
          value: profileWithSudhaJathakam,
          onChanged: (v) => setState(() => profileWithSudhaJathakam = v),
        ),
        _YesNoFieldRow(
          label: 'Profile with dosha jathakam',
          value: profileWithDoshaJathakam,
          onChanged: (v) => setState(() => profileWithDoshaJathakam = v),
        ),
        _SelectFieldRow(
          label: 'Preferred Star',
          value: preferredStar,
          options: const [
            'Ashwathi', 'Bharani', 'Karthika', 'Rohini', 'Makayiram',
            'Thiruvathira', 'Punartham', 'Pooyam', 'Ayilyam', 'Any'
          ],
          onChanged: (v) => setState(() => preferredStar = v),
          isLast: true,
        ),
      ],
    );
  }
}

/// ============================================================
/// SHARED CONTAINER — matches the bordered card in Basic Detail screen
/// ============================================================

class _TabFormContainer extends StatelessWidget {
  final List<Widget> children;
  const _TabFormContainer({required this.children});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: const Color(0xFFEDEDED)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(children: children),
      ),
    );
  }
}

/// ============================================================
/// FIELD ROW: single select (Label : Value with chevron)
/// ============================================================

class _SelectFieldRow extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> options;
  final ValueChanged<String> onChanged;
  final bool isLast;

  const _SelectFieldRow({
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
    this.isLast = false,
  });

  void _openPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (_) => _OptionPickerSheet(
        title: label,
        options: options,
        selected: value,
        onSelect: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openPicker(context),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          border: isLast
              ? null
              : const Border(bottom: BorderSide(color: Color(0xFFF0F0F0))),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Text(
                label,
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      value ?? 'Select',
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: value == null ? Colors.black38 : Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(Icons.keyboard_arrow_down_rounded,
                      size: 18.sp, color: Colors.black45),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ============================================================
/// FIELD ROW: range select (From — to — To, e.g. Age / Height / Weight)
/// ============================================================

class _RangeFieldRow extends StatelessWidget {
  final String label;
  final String? fromValue;
  final String? toValue;
  final List<String> options;
  final ValueChanged<String> onFromChanged;
  final ValueChanged<String> onToChanged;

  const _RangeFieldRow({
    required this.label,
    required this.fromValue,
    required this.toValue,
    required this.options,
    required this.onFromChanged,
    required this.onToChanged,
  });

  void _openPicker(BuildContext context, String title, String? selected, ValueChanged<String> onSelect) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (_) => _OptionPickerSheet(
        title: title,
        options: options,
        selected: selected,
        onSelect: onSelect,
      ),
    );
  }

  Widget _miniSelect(BuildContext context, String? value, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F8),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value ?? 'Select',
              style: GoogleFonts.tasaOrbiter(
                fontSize: 12.5.sp,
                fontWeight: FontWeight.w600,
                color: value == null ? Colors.black38 : Colors.black87,
              ),
            ),
            Icon(Icons.keyboard_arrow_down_rounded, size: 16.sp, color: Colors.black45),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF0F0F0))),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: GoogleFonts.tasaOrbiter(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          _miniSelect(context, fromValue,
              () => _openPicker(context, '$label — From', fromValue, onFromChanged)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Text('to',
                style: GoogleFonts.tasaOrbiter(fontSize: 11.sp, color: Colors.black38)),
          ),
          _miniSelect(context, toValue,
              () => _openPicker(context, '$label — To', toValue, onToChanged)),
        ],
      ),
    );
  }
}

/// ============================================================
/// FIELD ROW: Yes / No radio
/// ============================================================

class _YesNoFieldRow extends StatelessWidget {
  final String label;
  final bool? value;
  final ValueChanged<bool> onChanged;

  const _YesNoFieldRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF0F0F0))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.tasaOrbiter(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                height: 1.3,
              ),
            ),
          ),
          _radioOption(context, 'Yes', true),
          SizedBox(width: 12.w),
          _radioOption(context, 'No', false),
        ],
      ),
    );
  }

  Widget _radioOption(BuildContext context, String label, bool optionValue) {
    final selected = value == optionValue;
    return GestureDetector(
      onTap: () => onChanged(optionValue),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            selected ? Icons.radio_button_checked : Icons.radio_button_off,
            size: 17.sp,
            color: selected ? AppColors.coral : Colors.black26,
          ),
          SizedBox(width: 4.w),
          Text(
            label,
            style: GoogleFonts.tasaOrbiter(
              fontSize: 12.5.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

/// ============================================================
/// SHARED BOTTOM-SHEET OPTION PICKER
/// ============================================================

class _OptionPickerSheet extends StatelessWidget {
  final String title;
  final List<String> options;
  final String? selected;
  final ValueChanged<String> onSelect;

  const _OptionPickerSheet({
    required this.title,
    required this.options,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 12.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            SizedBox(height: 14.h),
            Text(
              title,
              style: GoogleFonts.tasaOrbiter(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.h),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (context, i) {
                  final opt = options[i];
                  final isSelected = opt == selected;
                  return ListTile(
                    title: Text(
                      opt,
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 14.sp,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                        color: isSelected ? AppColors.coral : Colors.black87,
                      ),
                    ),
                    trailing: isSelected
                        ? Icon(Icons.check_rounded, color: AppColors.coral, size: 18.sp)
                        : null,
                    onTap: () {
                      onSelect(opt);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}