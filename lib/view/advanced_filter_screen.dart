// // // Bandhan 2026 — Advanced Search Filters
// // import 'package:flutter/material.dart';
// // import 'package:matrimony_app/view/custom_widgets/app_color.dart';

// // class AdvancedFilters {
// //   final RangeValues ageRange;
// //   final String? location;
// //   final String? occupation;

// //   const AdvancedFilters({
// //     this.ageRange = const RangeValues(18, 60),
// //     this.location,
// //     this.occupation,
// //   });

// //   int get activeCount {
// //     var count = 0;
// //     if (ageRange.start != 18 || ageRange.end != 60) count++;
// //     if (location != null && location!.trim().isNotEmpty) count++;
// //     if (occupation != null && occupation!.trim().isNotEmpty) count++;
// //     return count;
// //   }
// // }

// // class AdvancedFilterScreen extends StatefulWidget {
// //   final AdvancedFilters initial;
// //   const AdvancedFilterScreen({super.key, required this.initial});

// //   @override
// //   State<AdvancedFilterScreen> createState() => _AdvancedFilterScreenState();
// // }

// // class _AdvancedFilterScreenState extends State<AdvancedFilterScreen> {
// //   late RangeValues _ageRange;
// //   late final TextEditingController _locationCtrl;
// //   late final TextEditingController _occupationCtrl;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _ageRange = widget.initial.ageRange;
// //     _locationCtrl = TextEditingController(text: widget.initial.location ?? '');
// //     _occupationCtrl = TextEditingController(text: widget.initial.occupation ?? '');
// //   }

// //   @override
// //   void dispose() {
// //     _locationCtrl.dispose();
// //     _occupationCtrl.dispose();
// //     super.dispose();
// //   }

// //   void _reset() {
// //     setState(() {
// //       _ageRange = const RangeValues(18, 60);
// //       _locationCtrl.clear();
// //       _occupationCtrl.clear();
// //     });
// //   }

// //   void _apply() {
// //     Navigator.pop(
// //       context,
// //       AdvancedFilters(
// //         ageRange: _ageRange,
// //         location: _locationCtrl.text.trim().isEmpty ? null : _locationCtrl.text.trim(),
// //         occupation: _occupationCtrl.text.trim().isEmpty ? null : _occupationCtrl.text.trim(),
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: AppColors.background,
// //       body: SafeArea(
// //         child: Column(
// //           children: [
// //             _buildHeader(),
// //             Expanded(
// //               child: SingleChildScrollView(
// //                 padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     _sectionCard(
// //                       title: 'Age Range',
// //                       icon: Icons.cake_outlined,
// //                       child: Column(
// //                         children: [
// //                           RangeSlider(
// //                             values: _ageRange,
// //                             min: 18,
// //                             max: 60,
// //                             divisions: 42,
// //                             activeColor: AppColors.primary,
// //                             inactiveColor: AppColors.surfaceVariant,
// //                             labels: RangeLabels(
// //                               _ageRange.start.round().toString(),
// //                               _ageRange.end.round().toString(),
// //                             ),
// //                             onChanged: (v) => setState(() => _ageRange = v),
// //                           ),
// //                           Row(
// //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                             children: [
// //                               Text('${_ageRange.start.round()} yrs', style: AppColors.body2),
// //                               Text('${_ageRange.end.round()} yrs', style: AppColors.body2),
// //                             ],
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     const SizedBox(height: 16),
// //                     _sectionCard(
// //                       title: 'Location',
// //                       icon: Icons.location_on_outlined,
// //                       child: _filterTextField(_locationCtrl, 'City or state'),
// //                     ),
// //                     const SizedBox(height: 16),
// //                     _sectionCard(
// //                       title: 'Occupation',
// //                       icon: Icons.work_outline_rounded,
// //                       child: _filterTextField(_occupationCtrl, 'e.g. Software Engineer'),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             _buildBottomBar(),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildHeader() {
// //     return Padding(
// //       padding: const EdgeInsets.fromLTRB(12, 8, 20, 8),
// //       child: Row(
// //         children: [
// //           GestureDetector(
// //             onTap: () => Navigator.maybePop(context),
// //             child: Container(
// //               width: 38,
// //               height: 38,
// //               decoration: BoxDecoration(
// //                 color: AppColors.surfaceVariant,
// //                 borderRadius: BorderRadius.circular(AppColors.r10),
// //               ),
// //               child: const Icon(Icons.arrow_back_ios_new_rounded, size: 16, color: AppColors.textPrimary),
// //             ),
// //           ),
// //           const SizedBox(width: 8),
// //           const Expanded(
// //             child: Text('Advanced Filters',
// //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
// //           ),
// //           GestureDetector(
// //             onTap: _reset,
// //             child: const Text('Reset', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.primary)),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildBottomBar() {
// //     return Container(
// //       padding: EdgeInsets.fromLTRB(20, 14, 20, MediaQuery.of(context).padding.bottom + 14),
// //       decoration: BoxDecoration(
// //         color: AppColors.surface,
// //         border: const Border(top: BorderSide(color: AppColors.divider)),
// //         boxShadow: AppColors.shadowNav,
// //       ),
// //       child: GestureDetector(
// //         onTap: _apply,
// //         child: Container(
// //           height: 50,
// //           alignment: Alignment.center,
// //           decoration: BoxDecoration(
// //             gradient: AppColors.gradPrimary,
// //             borderRadius: BorderRadius.circular(AppColors.r16),
// //             boxShadow: AppColors.shadowPrimary,
// //           ),
// //           child: const Text('Apply Filters', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700)),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _sectionCard({required String title, required IconData icon, required Widget child}) {
// //     return Container(
// //       width: double.infinity,
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         color: AppColors.surface,
// //         borderRadius: BorderRadius.circular(AppColors.r20),
// //         border: Border.all(color: AppColors.border),
// //         boxShadow: AppColors.shadowXs,
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Row(
// //             children: [
// //               Container(
// //                 width: 28,
// //                 height: 28,
// //                 decoration: const BoxDecoration(color: AppColors.primaryLight, shape: BoxShape.circle),
// //                 child: Icon(icon, color: AppColors.primary, size: 14),
// //               ),
// //               const SizedBox(width: 10),
// //               Text(title, style: AppColors.h3),
// //             ],
// //           ),
// //           const SizedBox(height: 10),
// //           child,
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _filterTextField(TextEditingController ctrl, String hint) {
// //     return TextField(
// //       controller: ctrl,
// //       style: const TextStyle(fontSize: 14, color: AppColors.textPrimary),
// //       decoration: InputDecoration(
// //         hintText: hint,
// //         hintStyle: const TextStyle(color: AppColors.textHint, fontSize: 14),
// //         filled: true,
// //         fillColor: AppColors.surfaceVariant,
// //         contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
// //         border: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(AppColors.r12),
// //           borderSide: BorderSide.none,
// //         ),
// //       ),
// //     );
// //   }
// // }


// // Bandhan 2026 — Advanced Filters Screen
// // Full-screen filter picker: Age (RangeSlider + presets), Height, Marital
// // Status, Religion/Community/Education/Occupation/Location, and toggles.
// // Returns an `AdvancedFilters` object via Navigator.pop when Applied.

// import 'package:flutter/material.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';

// class AdvancedFilters {
//   RangeValues ageRange;
//   RangeValues heightRange; // in cm
//   Set<String> maritalStatus;
//   String? religion;
//   String? community;
//   String? education;
//   String? occupation;
//   String? location;
//   bool verifiedOnly;
//   bool premiumOnly;
//   bool withPhotoOnly;

//   AdvancedFilters({
//     this.ageRange = const RangeValues(22, 35),
//     this.heightRange = const RangeValues(150, 190),
//     Set<String>? maritalStatus,
//     this.religion,
//     this.community,
//     this.education,
//     this.occupation,
//     this.location,
//     this.verifiedOnly = false,
//     this.premiumOnly = false,
//     this.withPhotoOnly = false,
//   }) : maritalStatus = maritalStatus ?? {};

//   AdvancedFilters copy() => AdvancedFilters(
//         ageRange: ageRange,
//         heightRange: heightRange,
//         maritalStatus: {...maritalStatus},
//         religion: religion,
//         community: community,
//         education: education,
//         occupation: occupation,
//         location: location,
//         verifiedOnly: verifiedOnly,
//         premiumOnly: premiumOnly,
//         withPhotoOnly: withPhotoOnly,
//       );

//   int get activeCount {
//     int n = 0;
//     if (ageRange.start != 22 || ageRange.end != 35) n++;
//     if (heightRange.start != 150 || heightRange.end != 190) n++;
//     if (maritalStatus.isNotEmpty) n++;
//     if (religion != null) n++;
//     if (community != null) n++;
//     if (education != null) n++;
//     if (occupation != null) n++;
//     if (location != null) n++;
//     if (verifiedOnly) n++;
//     if (premiumOnly) n++;
//     if (withPhotoOnly) n++;
//     return n;
//   }
// }

// class AdvancedFilterScreen extends StatefulWidget {
//   final AdvancedFilters initial;
//   const AdvancedFilterScreen({super.key, required this.initial});

//   @override
//   State<AdvancedFilterScreen> createState() => _AdvancedFilterScreenState();
// }

// class _AdvancedFilterScreenState extends State<AdvancedFilterScreen> {
//   late AdvancedFilters _f;

//   static const _ageMin = 18.0;
//   static const _ageMax = 60.0;
//   static const _heightMin = 140.0;
//   static const _heightMax = 210.0;

//   static const _agePresets = [
//     (label: '21–28', range: RangeValues(21, 28)),
//     (label: '25–32', range: RangeValues(25, 32)),
//     (label: '30–38', range: RangeValues(30, 38)),
//     (label: '35–45', range: RangeValues(35, 45)),
//   ];

//   static const _maritalOptions = [
//     'Never Married', 'Divorced', 'Widowed', 'Awaiting Divorce',
//   ];

//   static const _religionOptions = [
//     'Hindu', 'Muslim', 'Christian', 'Sikh', 'Jain', 'Buddhist', 'Other',
//   ];

//   static const _educationOptions = [
//     'High School', 'Bachelor\'s', 'Master\'s', 'Doctorate', 'Diploma',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _f = widget.initial.copy();
//   }

//   String _heightLabel(double cm) {
//     final totalInches = (cm / 2.54).round();
//     final ft = totalInches ~/ 12;
//     final inch = totalInches % 12;
//     return '$ft\'$inch" (${cm.round()} cm)';
//   }

//   void _reset() {
//     setState(() => _f = AdvancedFilters());
//   }

//   void _apply() {
//     Navigator.pop(context, _f);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(
//         backgroundColor: AppColors.surface,
//         elevation: 0,
//         foregroundColor: AppColors.textPrimary,
//         title: const Text(
//           'Advanced Filters',
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.textPrimary),
//         ),
//         actions: [
//           TextButton(
//             onPressed: _reset,
//             child: const Text('Reset', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700)),
//           ),
//         ],
//       ),
//       body: ListView(
//         padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
//         children: [
//           _sectionTitle('Age Range'),
//           const SizedBox(height: 4),
//           _rangeValueRow('${_f.ageRange.start.round()} yrs', '${_f.ageRange.end.round()} yrs'),
//           RangeSlider(
//             values: _f.ageRange,
//             min: _ageMin,
//             max: _ageMax,
//             divisions: (_ageMax - _ageMin).round(),
//             activeColor: AppColors.primary,
//             inactiveColor: AppColors.border,
//             labels: RangeLabels(
//               _f.ageRange.start.round().toString(),
//               _f.ageRange.end.round().toString(),
//             ),
//             onChanged: (v) => setState(() => _f.ageRange = v),
//           ),
//           const SizedBox(height: 4),
//           Wrap(
//             spacing: 8,
//             runSpacing: 8,
//             children: _agePresets.map((p) {
//               final selected = _f.ageRange == p.range;
//               return GestureDetector(
//                 onTap: () => setState(() => _f.ageRange = p.range),
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                   decoration: BoxDecoration(
//                     color: selected ? AppColors.primary : AppColors.surfaceVariant,
//                     borderRadius: BorderRadius.circular(AppColors.r32),
//                     border: Border.all(color: selected ? AppColors.primary : AppColors.border),
//                   ),
//                   child: Text(
//                     p.label,
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w700,
//                       color: selected ? Colors.white : AppColors.textSecondary,
//                     ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),

//           const SizedBox(height: 26),
//           _sectionTitle('Height Range'),
//           const SizedBox(height: 4),
//           _rangeValueRow(_heightLabel(_f.heightRange.start), _heightLabel(_f.heightRange.end)),
//           RangeSlider(
//             values: _f.heightRange,
//             min: _heightMin,
//             max: _heightMax,
//             divisions: (_heightMax - _heightMin).round(),
//             activeColor: AppColors.primary,
//             inactiveColor: AppColors.border,
//             onChanged: (v) => setState(() => _f.heightRange = v),
//           ),

//           const SizedBox(height: 26),
//           _sectionTitle('Marital Status'),
//           const SizedBox(height: 10),
//           Wrap(
//             spacing: 8,
//             runSpacing: 8,
//             children: _maritalOptions.map((opt) {
//               final selected = _f.maritalStatus.contains(opt);
//               return GestureDetector(
//                 onTap: () => setState(() {
//                   selected ? _f.maritalStatus.remove(opt) : _f.maritalStatus.add(opt);
//                 }),
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
//                   decoration: BoxDecoration(
//                     color: selected ? AppColors.primary : AppColors.surfaceVariant,
//                     borderRadius: BorderRadius.circular(AppColors.r32),
//                     border: Border.all(color: selected ? AppColors.primary : AppColors.border),
//                   ),
//                   child: Text(
//                     opt,
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w700,
//                       color: selected ? Colors.white : AppColors.textSecondary,
//                     ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),

//           const SizedBox(height: 26),
//           _sectionTitle('Religion'),
//           const SizedBox(height: 10),
//           _dropdownField(
//             value: _f.religion,
//             hint: 'Any Religion',
//             options: _religionOptions,
//             onChanged: (v) => setState(() => _f.religion = v),
//           ),

//           const SizedBox(height: 18),
//           _sectionTitle('Education'),
//           const SizedBox(height: 10),
//           _dropdownField(
//             value: _f.education,
//             hint: 'Any Education Level',
//             options: _educationOptions,
//             onChanged: (v) => setState(() => _f.education = v),
//           ),

//           const SizedBox(height: 18),
//           _sectionTitle('Occupation'),
//           const SizedBox(height: 10),
//           _textField(
//             hint: 'e.g. Engineer, Doctor, Teacher',
//             initial: _f.occupation,
//             onChanged: (v) => _f.occupation = v.isEmpty ? null : v,
//           ),

//           const SizedBox(height: 18),
//           _sectionTitle('Location'),
//           const SizedBox(height: 10),
//           _textField(
//             hint: 'City or State',
//             initial: _f.location,
//             onChanged: (v) => _f.location = v.isEmpty ? null : v,
//           ),

//           const SizedBox(height: 26),
//           _sectionTitle('Show Only'),
//           const SizedBox(height: 4),
//           _toggleTile(
//             label: 'Verified Profiles',
//             value: _f.verifiedOnly,
//             onChanged: (v) => setState(() => _f.verifiedOnly = v),
//           ),
//           _toggleTile(
//             label: 'Premium Members',
//             value: _f.premiumOnly,
//             onChanged: (v) => setState(() => _f.premiumOnly = v),
//           ),
//           _toggleTile(
//             label: 'Profiles With Photo',
//             value: _f.withPhotoOnly,
//             onChanged: (v) => setState(() => _f.withPhotoOnly = v),
//           ),
//         ],
//       ),
//       bottomNavigationBar: SafeArea(
//         top: false,
//         child: Container(
//           padding: const EdgeInsets.fromLTRB(20, 12, 20, 14),
//           decoration: BoxDecoration(color: AppColors.surface, boxShadow: AppColors.shadowXs),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   _f.activeCount == 0 ? 'No filters applied' : '${_f.activeCount} filters applied',
//                   style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textHint),
//                 ),
//               ),
//               const SizedBox(width: 12),
//               SizedBox(
//                 height: 46,
//                 child: ElevatedButton(
//                   onPressed: _apply,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.primary,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppColors.r12)),
//                     elevation: 0,
//                     padding: const EdgeInsets.symmetric(horizontal: 28),
//                   ),
//                   child: const Text(
//                     'Apply Filters',
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _sectionTitle(String text) => Text(
//         text,
//         style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: AppColors.textPrimary),
//       );

//   Widget _rangeValueRow(String start, String end) => Padding(
//         padding: const EdgeInsets.only(bottom: 4),
//         child: Row(
//           children: [
//             Text(start, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.primary)),
//             const Text('  –  ', style: TextStyle(fontSize: 12, color: AppColors.textHint)),
//             Text(end, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.primary)),
//           ],
//         ),
//       );

//   Widget _dropdownField({
//     required String? value,
//     required String hint,
//     required List<String> options,
//     required ValueChanged<String?> onChanged,
//   }) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 14),
//       decoration: BoxDecoration(
//         color: AppColors.surfaceVariant,
//         borderRadius: BorderRadius.circular(AppColors.r12),
//         border: Border.all(color: AppColors.border),
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton<String>(
//           isExpanded: true,
//           value: value,
//           hint: Text(hint, style: const TextStyle(fontSize: 13, color: AppColors.textHint)),
//           icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.textHint),
//           style: const TextStyle(fontSize: 13, color: AppColors.textPrimary, fontWeight: FontWeight.w600),
//           items: [
//             const DropdownMenuItem(value: null, child: Text('Any')),
//             ...options.map((o) => DropdownMenuItem(value: o, child: Text(o))),
//           ],
//           onChanged: onChanged,
//         ),
//       ),
//     );
//   }

//   Widget _textField({
//     required String hint,
//     required String? initial,
//     required ValueChanged<String> onChanged,
//   }) {
//     return TextField(
//       controller: TextEditingController(text: initial)
//         ..selection = TextSelection.collapsed(offset: (initial ?? '').length),
//       onChanged: onChanged,
//       style: const TextStyle(fontSize: 13, color: AppColors.textPrimary),
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: const TextStyle(fontSize: 13, color: AppColors.textHint),
//         filled: true,
//         fillColor: AppColors.surfaceVariant,
//         contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(AppColors.r12),
//           borderSide: const BorderSide(color: AppColors.border),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(AppColors.r12),
//           borderSide: const BorderSide(color: AppColors.border),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(AppColors.r12),
//           borderSide: const BorderSide(color: AppColors.primary),
//         ),
//       ),
//     );
//   }

//   Widget _toggleTile({
//     required String label,
//     required bool value,
//     required ValueChanged<bool> onChanged,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 2),
//       child: Row(
//         children: [
//           Expanded(
//             child: Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
//           ),
//           Switch.adaptive(
//             value: value,
//             activeColor: AppColors.primary,
//             onChanged: onChanged,
//           ),
//         ],
//       ),
//     );
//   }
// }