// // "Personalise your search" preference screen — opened from the Search tab
// // on the Matches screen.
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:matrimony_app/model/search_body.dart';
// import 'package:matrimony_app/provider/register_provider.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';

// class SearchPreferencesScreen extends StatefulWidget {
//   const SearchPreferencesScreen({super.key});

//   @override
//   State<SearchPreferencesScreen> createState() =>
//       _SearchPreferencesScreenState();
// }

// class _SearchPreferencesScreenState extends State<SearchPreferencesScreen> {
//   RangeValues _ageRange = const RangeValues(24, 29);
//   RangeValues _heightRange = const RangeValues(
//     59,
//     67,
//   ); // inches: 4'11"=59in, 5'7"=67in

//   String _maritalStatus = 'Never Married';
//   String _community = 'Open to All';
//   String _motherTongue = 'Malayalam';
//   String _country = 'India';
//   String _state = 'Kerala';
//   final List<String> _districts = ['Palakkad', 'Thrissur', 'Ernakulam'];
//   String _photoSettings = 'Open to All';

//   String _qualification = 'Open to All';
//   String _education = 'Open to All';
//   String _workingWith = 'Open to All';
//   String _profession = 'Open to All';
//   bool _incomeOpenToAll = true;
//   String _diet = 'Open to All';

//   bool _advancedExpanded = false;
//   bool _isSearching = false;

//   static const _allDistricts = [
//     'Palakkad',
//     'Thrissur',
//     'Ernakulam',
//     'Kozhikode',
//     'Kollam',
//     'Kannur',
//     'Alappuzha',
//     'Kottayam',
//     'Malappuram',
//     'Wayanad',
//     'Idukki',
//     'Pathanamthitta',
//     'Kasaragod',
//   ];

//   String _heightLabel(double inches) {
//     final feet = inches ~/ 12;
//     final rem = (inches % 12).round();
//     final cm = (inches * 2.54).round();
//     return "$feet'$rem\" ($cm cm)";
//   }


//   Future<void> _searchNow() async {
//     setState(() => _isSearching = true);
//     final body = SearchBody(
//       ageFrom: _ageRange.start.round(),
//       ageTo: _ageRange.end.round(),
//       heightFrom: (_heightRange.start * 2.54).round(),
//       heightTo: (_heightRange.end * 2.54).round(),
//       withPhoto: _photoSettings == 'With Photo Only' ? true : null,
//     );

//     final provider = context.read<RegisterProvider>();
//     final success = await provider.searchProfiles(body);
//     if (!mounted) return;
//     setState(() => _isSearching = false);

//     if (success) {
//       Navigator.pop(context, true);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//             provider.searchError ?? 'Something went wrong. Please try again',
//           ),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             _buildHeader(),
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 20.h),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Personalise your search',
//                       style: GoogleFonts.tasaOrbiter(
//                         fontSize: 15.sp,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     SizedBox(height: 16.h),
//                     _rangeSliderRow(
//                       label: 'Age',
//                       valueText:
//                           'Min ${_ageRange.start.round()} yrs - Max ${_ageRange.end.round()} yrs',
//                       values: _ageRange,
//                       min: 18,
//                       max: 60,
//                       onChanged: (v) => setState(() => _ageRange = v),
//                     ),
//                     SizedBox(height: 18.h),
//                     _rangeSliderRow(
//                       label: 'Height',
//                       valueText:
//                           'Min ${_heightLabel(_heightRange.start)} - Max ${_heightLabel(_heightRange.end)}',
//                       values: _heightRange,
//                       min: 48,
//                       max: 84,
//                       onChanged: (v) => setState(() => _heightRange = v),
//                     ),
//                     SizedBox(height: 8.h),
//                     _dropdownRow(
//                       label: 'Marital Status',
//                       value: _maritalStatus,
//                       options: const [
//                         'Never Married',
//                         'Divorced',
//                         'Widowed',
//                         'Awaiting Divorce',
//                         'Any',
//                       ],
//                       onSelected: (v) => setState(() => _maritalStatus = v),
//                     ),
//                     _dropdownRow(
//                       label: 'Community',
//                       value: _community,
//                       options: const [
//                         'Open to All',
//                         'Nair',
//                         'Thiyya',
//                         'Ezhava',
//                         'Vishwakarma',
//                         'Brahmin',
//                       ],
//                       onSelected: (v) => setState(() => _community = v),
//                     ),
//                     _dropdownRow(
//                       label: 'Mother Tongue',
//                       value: _motherTongue,
//                       options: const [
//                         'Malayalam',
//                         'Tamil',
//                         'Telugu',
//                         'Kannada',
//                         'Hindi',
//                         'English',
//                         'Any',
//                       ],
//                       onSelected: (v) => setState(() => _motherTongue = v),
//                     ),
//                     _dropdownRow(
//                       label: 'Country living in',
//                       value: _country,
//                       options: const [
//                         'India',
//                         'USA',
//                         'UK',
//                         'UAE',
//                         'Canada',
//                         'Australia',
//                         'Any',
//                       ],
//                       onSelected: (v) => setState(() => _country = v),
//                     ),
//                     _dropdownRow(
//                       label: 'State living in',
//                       value: _state,
//                       options: const [
//                         'Kerala',
//                         'Tamil Nadu',
//                         'Karnataka',
//                         'Any',
//                       ],
//                       onSelected: (v) => setState(() => _state = v),
//                     ),
//                     _multiSelectRow(
//                       label: 'City / District',
//                       value: _districts.join(', '),
//                       onTap: _pickDistricts,
//                     ),
//                     _dropdownRow(
//                       label: 'Photo Settings',
//                       value: _photoSettings,
//                       options: const [
//                         'Open to All',
//                         'With Photo Only',
//                         'Photo Protected',
//                       ],
//                       onSelected: (v) => setState(() => _photoSettings = v),
//                       showDivider: false,
//                     ),
//                     SizedBox(height: 14.h),
//                     Center(
//                       child: InkWell(
//                         onTap: () => setState(
//                           () => _advancedExpanded = !_advancedExpanded,
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               'Advanced Search Options',
//                               style: GoogleFonts.tasaOrbiter(
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w600,
//                                 color: const Color(0xFF5A6ACF),
//                               ),
//                             ),
//                             Icon(
//                               _advancedExpanded
//                                   ? Icons.keyboard_arrow_up_rounded
//                                   : Icons.keyboard_arrow_down_rounded,
//                               size: 18.sp,
//                               color: const Color(0xFF5A6ACF),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     if (_advancedExpanded) ...[
//                       SizedBox(height: 10.h),
//                       _sectionTitle('Education & Profession Details'),
//                       _dropdownRow(
//                         label: 'Qualification',
//                         value: _qualification,
//                         options: const [
//                           'Open to All',
//                           "Bachelor's",
//                           "Master's",
//                           'Doctorate',
//                           'Diploma',
//                         ],
//                         onSelected: (v) => setState(() => _qualification = v),
//                       ),
//                       _dropdownRow(
//                         label: 'Education',
//                         value: _education,
//                         options: const [
//                           'Open to All',
//                           'Engineering',
//                           'Medicine',
//                           'Arts',
//                           'Commerce',
//                           'Law',
//                         ],
//                         onSelected: (v) => setState(() => _education = v),
//                       ),
//                       _dropdownRow(
//                         label: 'Working With',
//                         value: _workingWith,
//                         options: const [
//                           'Open to All',
//                           'Government',
//                           'Private',
//                           'Business',
//                           'Self Employed',
//                           'Not Working',
//                         ],
//                         onSelected: (v) => setState(() => _workingWith = v),
//                       ),
//                       _dropdownRow(
//                         label: 'Profession',
//                         value: _profession,
//                         options: const [
//                           'Open to All',
//                           'Software Engineer',
//                           'Doctor',
//                           'Teacher',
//                           'Finance Professional',
//                           'Business',
//                         ],
//                         onSelected: (v) => setState(() => _profession = v),
//                         showDivider: false,
//                       ),
//                       SizedBox(height: 16.h),
//                       _sectionTitle('Annual Income'),
//                       SizedBox(height: 8.h),
//                       _incomeOption(
//                         label: 'Open to All',
//                         selected: _incomeOpenToAll,
//                         onTap: () => setState(() => _incomeOpenToAll = true),
//                       ),
//                       SizedBox(height: 8.h),
//                       _incomeOption(
//                         label: 'Specify an Income range',
//                         selected: !_incomeOpenToAll,
//                         onTap: () => setState(() => _incomeOpenToAll = false),
//                       ),
//                       SizedBox(height: 16.h),
//                       _sectionTitle('Life style & Appearance'),
//                       _dropdownRow(
//                         label: 'Diet',
//                         value: _diet,
//                         options: const [
//                           'Open to All',
//                           'Vegetarian',
//                           'Non-Vegetarian',
//                           'Eggetarian',
//                           'Vegan',
//                         ],
//                         onSelected: (v) => setState(() => _diet = v),
//                         showDivider: false,
//                       ),
//                     ],
//                     SizedBox(height: 22.h),
//                     SizedBox(
//                       width: double.infinity,
//                       child: InkWell(
//                         onTap: _isSearching ? null : _searchNow,
//                         borderRadius: BorderRadius.circular(26.r),
//                         child: Container(
//                           height: 48.h,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             color: AppColors.primary,
//                             borderRadius: BorderRadius.circular(26.r),
//                           ),
//                           child: _isSearching
//                               ? SizedBox(
//                                   width: 20.w,
//                                   height: 20.w,
//                                   child: const CircularProgressIndicator(
//                                     color: Colors.white,
//                                     strokeWidth: 2.5,
//                                   ),
//                                 )
//                               : Text(
//                                   'Search Now',
//                                   style: GoogleFonts.tasaOrbiter(
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.w700,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ---------------- Header: back + search field look ----------------
//   Widget _buildHeader() {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(10.w, 8.h, 16.w, 8.h),
//       child: Row(
//         children: [
//           InkWell(
//             borderRadius: BorderRadius.circular(20.r),
//             onTap: () => Navigator.maybePop(context),
//             child: Padding(
//               padding: EdgeInsets.all(6.w),
//               child: Icon(Icons.arrow_back, size: 20.sp, color: Colors.black87),
//             ),
//           ),
//           SizedBox(width: 6.w),
//           Expanded(
//             child: Container(
//               height: 38.h,
//               padding: EdgeInsets.symmetric(horizontal: 12.w),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF4F4F4),
//                 borderRadius: BorderRadius.circular(19.r),
//               ),
//               child: Row(
//                 children: [
//                   Icon(Icons.search, size: 16.sp, color: Colors.black45),
//                   SizedBox(width: 8.w),
//                   Text(
//                     'Search by Matches',
//                     style: GoogleFonts.tasaOrbiter(
//                       fontSize: 12.5.sp,
//                       color: Colors.black45,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _sectionTitle(String text) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 8.h),
//       child: Text(
//         text,
//         style: GoogleFonts.tasaOrbiter(
//           fontSize: 13.sp,
//           fontWeight: FontWeight.w700,
//           color: Colors.black87,
//         ),
//       ),
//     );
//   }

//   // ---------------- Range slider row ----------------
//   Widget _rangeSliderRow({
//     required String label,
//     required String valueText,
//     required RangeValues values,
//     required double min,
//     required double max,
//     required ValueChanged<RangeValues> onChanged,
//   }) {
//     return Container(
//       padding: EdgeInsets.all(12),
//       height: 80.h,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.r),
//         color: Color(0xFFF5F5F5),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 label,
//                 style: GoogleFonts.tasaOrbiter(
//                   fontSize: 14.sp,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               Text(
//                 valueText,
//                 style: GoogleFonts.tasaOrbiter(
//                   fontSize: 14.sp,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//           SliderTheme(
//             data: SliderTheme.of(context).copyWith(
//               trackHeight: 3,
//               activeTrackColor: AppColors.primary,
//               inactiveTrackColor: const Color(0xFFE8E8E8),
//               thumbColor: AppColors.primary,
//               overlayColor: AppColors.primary.withValues(alpha: 0.15),
//               rangeThumbShape: const RoundRangeSliderThumbShape(
//                 enabledThumbRadius: 7,
//               ),
//             ),
//             child: RangeSlider(
//               min: min,
//               max: max,
//               values: values,
//               onChanged: onChanged,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ---------------- Dropdown-style row (opens a bottom sheet) ----------------
//   Widget _dropdownRow({
//     required String label,
//     required String value,
//     required List<String> options,
//     required ValueChanged<String> onSelected,
//     bool showDivider = true,
//   }) {
//     return InkWell(
//       onTap: () => _pickOption(
//         label: label,
//         options: options,
//         current: value,
//         onSelected: onSelected,
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 10.h),
//         child: Container(
//           padding: EdgeInsets.all(12),
//           height: 70.h,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10.r),
//             color: Color(0xFFF5F5F5),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           label,
//                           style: GoogleFonts.tasaOrbiter(
//                             fontSize: 11.5.sp,
//                             color: Colors.black,
//                           ),
//                         ),
//                         SizedBox(height: 3.h),
//                         Text(
//                           value,
//                           style: GoogleFonts.tasaOrbiter(
//                             fontSize: 13.sp,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Icon(
//                     Icons.keyboard_arrow_down_rounded,
//                     color: Colors.black,
//                     size: 20.sp,
//                   ),
//                 ],
//               ),
//               if (showDivider) ...[
//                 SizedBox(height: 10.h),
//                 Divider(height: 1, color: const Color(0xFFF0F0F0)),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _multiSelectRow({
//     required String label,
//     required String value,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 10.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         label,
//                         style: GoogleFonts.tasaOrbiter(
//                           fontSize: 11.5.sp,
//                           color: Colors.black45,
//                         ),
//                       ),
//                       SizedBox(height: 3.h),
//                       Text(
//                         value,
//                         style: GoogleFonts.tasaOrbiter(
//                           fontSize: 13.sp,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Icon(
//                   Icons.keyboard_arrow_down_rounded,
//                   color: Colors.black38,
//                   size: 20.sp,
//                 ),
//               ],
//             ),
//             SizedBox(height: 10.h),
//             Divider(height: 1, color: const Color(0xFFF0F0F0)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _incomeOption({
//     required String label,
//     required bool selected,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(12.r),
//       child: Container(
//         width: double.infinity,
//         padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
//         decoration: BoxDecoration(
//           color: selected ? AppColors.primary.withValues(alpha: 0.1) : Colors.white,
//           borderRadius: BorderRadius.circular(12.r),
//           border: Border.all(
//             color: selected ? AppColors.primary : const Color(0xFFE0E0E0),
//           ),
//         ),
//         child: Row(
//           children: [
//             Icon(
//               selected
//                   ? Icons.radio_button_checked_rounded
//                   : Icons.radio_button_off_rounded,
//               size: 18.sp,
//               color: selected ? AppColors.primary : Colors.black38,
//             ),
//             SizedBox(width: 10.w),
//             Text(
//               label,
//               style: GoogleFonts.tasaOrbiter(
//                 fontSize: 12.5.sp,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black87,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ---------------- Bottom sheet pickers ----------------
//   void _pickOption({
//     required String label,
//     required List<String> options,
//     required String current,
//     required ValueChanged<String> onSelected,
//   }) {
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
//       ),
//       builder: (context) {
//         return SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: 10.h),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 16.w,
//                     vertical: 6.h,
//                   ),
//                   child: Text(
//                     label,
//                     style: GoogleFonts.tasaOrbiter(
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ),
//                 ...options.map(
//                   (o) => ListTile(
//                     title: Text(
//                       o,
//                       style: GoogleFonts.tasaOrbiter(
//                         fontSize: 13.sp,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     trailing: o == current
//                         ? Icon(Icons.check_rounded, color: AppColors.primary)
//                         : null,
//                     onTap: () {
//                       onSelected(o);
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _pickDistricts() {
//     final selected = Set<String>.from(_districts);
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
//       ),
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setSheetState) {
//             return SafeArea(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 10.h),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 16.w,
//                         vertical: 6.h,
//                       ),
//                       child: Text(
//                         'City / District',
//                         style: GoogleFonts.tasaOrbiter(
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ),
//                     ConstrainedBox(
//                       constraints: BoxConstraints(maxHeight: 340.h),
//                       child: ListView(
//                         shrinkWrap: true,
//                         children: _allDistricts
//                             .map(
//                               (d) => CheckboxListTile(
//                                 value: selected.contains(d),
//                                 activeColor: AppColors.primary,
//                                 title: Text(
//                                   d,
//                                   style: GoogleFonts.tasaOrbiter(
//                                     fontSize: 13.sp,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                                 onChanged: (checked) => setSheetState(() {
//                                   checked == true
//                                       ? selected.add(d)
//                                       : selected.remove(d);
//                                 }),
//                               ),
//                             )
//                             .toList(),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
//                       child: SizedBox(
//                         width: double.infinity,
//                         child: InkWell(
//                           onTap: () {
//                             setState(() {
//                               _districts
//                                 ..clear()
//                                 ..addAll(selected);
//                             });
//                             Navigator.pop(context);
//                           },
//                           borderRadius: BorderRadius.circular(24.r),
//                           child: Container(
//                             height: 44.h,
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               color: AppColors.primary,
//                               borderRadius: BorderRadius.circular(24.r),
//                             ),
//                             child: Text(
//                               'Done',
//                               style: GoogleFonts.tasaOrbiter(
//                                 fontSize: 13.sp,
//                                 fontWeight: FontWeight.w700,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }




// Search screen — opened from the "New or Saved Search" dropdown on the
// Matches screen. Mirrors the website: Basic Search, Advanced Search,
// Saved search, Profile ID search and Keyword search tabs.
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:matrimony_app/model/search_body.dart';
import 'package:matrimony_app/provider/register_provider.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

const _pageBg = Color(0xFFF7F4EF);
const _fieldBorder = Color(0xFFDDDDDD);

enum _SearchTab {
  basic('Basic Search'),
  advanced('Advanced Search'),
  saved('Saved search'),
  profileId('Profile ID search'),
  keyword('Keyword search');

  final String label;
  const _SearchTab(this.label);
}

/// A saved set of filters (local only for now).
class _SavedSearch {
  String name;
  final Map<String, dynamic> filters;
  _SavedSearch(this.name, this.filters);
}

class SearchPreferencesScreen extends StatefulWidget {
  const SearchPreferencesScreen({super.key});

  @override
  State<SearchPreferencesScreen> createState() =>
      _SearchPreferencesScreenState();
}

class _SearchPreferencesScreenState extends State<SearchPreferencesScreen> {
  _SearchTab _tab = _SearchTab.basic;
  bool _isSearching = false;

  // ---------------- Basic filters ----------------
  int? _ageFrom, _ageTo; // years
  int? _heightFrom, _heightTo; // inches
  int? _weightFrom, _weightTo; // kg
  String? _marital;
  String? _disability;
  String? _motherTongue;
  String? _education;
  String? _religion;
  String? _caste;
  String? _familyType;

  // ---------------- Advanced filters ----------------
  bool? _surgeryPref; // null = not answered
  String? _familyStatus;
  String? _bodyType;
  String? _skinTone;
  String? _foodType;
  String? _drinking;
  String? _smoking;
  String? _gotra;
  String? _country;
  String? _state;
  String? _city;
  String? _qualification;
  String? _employmentType;
  String? _occupation;
  String? _annualIncome;
  String? _languages;
  String? _familyProperty;
  String? _sudha;
  String? _dosha;
  String _createdDate = 'All';
  bool _withPhoto = false;
  String? _sortBy;

  // ---------------- Saved searches (TODO: persist via API) ----------------
  final List<_SavedSearch> _saved = [];

  // ---------------- Profile ID / Keyword ----------------
  final TextEditingController _idCtrl = TextEditingController();
  final TextEditingController _keywordCtrl = TextEditingController();

  // ---------------- Options ----------------
  static const _maritalOptions = [
    'Never Married',
    'Divorced',
    'Widowed',
    'Awaiting Divorce',
    'Any',
  ];
  static const _disabilityOptions = ['None', 'Physically Challenged', 'Any'];
  static const _motherTongueOptions = [
    'Malayalam',
    'Tamil',
    'Telugu',
    'Kannada',
    'Hindi',
    'English',
    'Any',
  ];
  static const _educationOptions = [
    "Bachelor's Degree",
    "Master's Degree",
    'Doctorate',
    'Diploma',
    'Engineering',
    'Medicine',
    'Arts',
    'Commerce',
    'Law',
  ];
  static const _religionOptions = [
    'Hindu',
    'Christian',
    'Muslim',
    'Sikh',
    'Jain',
    'Buddhist',
    'Other',
  ];
  static const _casteOptions = [
    'Nair',
    'Thiyya',
    'Ezhava',
    'Vishwakarma',
    'Brahmin',
    'Open to All',
  ];
  static const _familyTypeOptions = ['Joint', 'Nuclear'];
  static const _countryOptions = [
    'India',
    'USA',
    'UK',
    'UAE',
    'Canada',
    'Australia',
    'Any',
  ];
  static const _stateOptions = ['Kerala', 'Tamil Nadu', 'Karnataka', 'Any'];
  static const _familyStatusOptions = [
    'Middle Class',
    'Upper Middle Class',
    'Rich',
    'Affluent',
  ];
  static const _bodyTypeOptions = ['Slim', 'Average', 'Athletic', 'Heavy'];
  static const _skinToneOptions = ['Very Fair', 'Fair', 'Wheatish', 'Dark'];
  static const _foodTypeOptions = [
    'Vegetarian',
    'Non-Vegetarian',
    'Eggetarian',
    'Vegan',
  ];
  static const _habitOptions = ['Never', 'Occasionally', 'Regularly'];
  static const _gotraOptions = [
    'Open to All',
    'Bharadwaja',
    'Kashyapa',
    'Vasishta',
    'Atri',
  ];
  static const _employmentOptions = [
    'Government',
    'Private',
    'Business',
    'Self Employed',
    'Not Working',
  ];
  static const _occupationOptions = [
    'Software Engineer',
    'Doctor',
    'Teacher',
    'Finance Professional',
    'Business',
  ];
  static const _incomeOptions = [
    'Below 2 Lakh',
    '2 - 5 Lakh',
    '5 - 10 Lakh',
    '10 - 20 Lakh',
    '20 Lakh and above',
  ];
  static const _languageOptions = [
    'Malayalam',
    'English',
    'Hindi',
    'Tamil',
    'Kannada',
    'Telugu',
  ];
  static const _propertyOptions = [
    'Own House',
    'Agricultural Land',
    'Rented House',
    'No Property',
  ];
  static const _yesNoAnyOptions = ['Yes', 'No', 'Any'];
  static const _createdDateOptions = ['All', 'Today', 'One week', 'One month'];
  static const _sortOptions = [
    'Newest first',
    'Age: low to high',
    'Age: high to low',
    'Recently active',
  ];
  static const _allDistricts = [
    'Palakkad',
    'Thrissur',
    'Ernakulam',
    'Kozhikode',
    'Kollam',
    'Kannur',
    'Alappuzha',
    'Kottayam',
    'Malappuram',
    'Wayanad',
    'Idukki',
    'Pathanamthitta',
    'Kasaragod',
    'Thiruvananthapuram',
  ];

  static final List<int> _ageOptions = [for (var i = 18; i <= 70; i++) i];
  static final List<int> _heightOptions = [for (var i = 48; i <= 84; i++) i];
  static final List<int> _weightOptions = [for (var i = 35; i <= 120; i++) i];

  String _heightLabel(int inches) =>
      "${inches ~/ 12}'${inches % 12}\" (${(inches * 2.54).round()} cm)";

  @override
  void dispose() {
    _idCtrl.dispose();
    _keywordCtrl.dispose();
    super.dispose();
  }

  // ---------------- Actions ----------------

  void _reset() {
    setState(() {
      _ageFrom = _ageTo = null;
      _heightFrom = _heightTo = null;
      _weightFrom = _weightTo = null;
      _marital = _disability = _motherTongue = null;
      _education = _religion = _caste = _familyType = null;
      _surgeryPref = null;
      _familyStatus = _bodyType = _skinTone = null;
      _foodType = _drinking = _smoking = _gotra = null;
      _country = _state = _city = null;
      _qualification = _employmentType = _occupation = null;
      _annualIncome = _languages = _familyProperty = null;
      _sudha = _dosha = _sortBy = null;
      _createdDate = 'All';
      _withPhoto = false;
    });
  }

  Map<String, dynamic> _snapshot() => {
    'ageFrom': _ageFrom,
    'ageTo': _ageTo,
    'heightFrom': _heightFrom,
    'heightTo': _heightTo,
    'weightFrom': _weightFrom,
    'weightTo': _weightTo,
    'marital': _marital,
    'disability': _disability,
    'motherTongue': _motherTongue,
    'education': _education,
    'religion': _religion,
    'caste': _caste,
    'familyType': _familyType,
    'surgery': _surgeryPref,
    'familyStatus': _familyStatus,
    'bodyType': _bodyType,
    'skinTone': _skinTone,
    'foodType': _foodType,
    'drinking': _drinking,
    'smoking': _smoking,
    'gotra': _gotra,
    'country': _country,
    'state': _state,
    'city': _city,
    'qualification': _qualification,
    'employmentType': _employmentType,
    'occupation': _occupation,
    'annualIncome': _annualIncome,
    'languages': _languages,
    'familyProperty': _familyProperty,
    'sudha': _sudha,
    'dosha': _dosha,
    'createdDate': _createdDate,
    'withPhoto': _withPhoto,
    'sortBy': _sortBy,
  };

  void _restore(Map<String, dynamic> f) {
    setState(() {
      _ageFrom = f['ageFrom'];
      _ageTo = f['ageTo'];
      _heightFrom = f['heightFrom'];
      _heightTo = f['heightTo'];
      _weightFrom = f['weightFrom'];
      _weightTo = f['weightTo'];
      _marital = f['marital'];
      _disability = f['disability'];
      _motherTongue = f['motherTongue'];
      _education = f['education'];
      _religion = f['religion'];
      _caste = f['caste'];
      _familyType = f['familyType'];
      _surgeryPref = f['surgery'];
      _familyStatus = f['familyStatus'];
      _bodyType = f['bodyType'];
      _skinTone = f['skinTone'];
      _foodType = f['foodType'];
      _drinking = f['drinking'];
      _smoking = f['smoking'];
      _gotra = f['gotra'];
      _country = f['country'];
      _state = f['state'];
      _city = f['city'];
      _qualification = f['qualification'];
      _employmentType = f['employmentType'];
      _occupation = f['occupation'];
      _annualIncome = f['annualIncome'];
      _languages = f['languages'];
      _familyProperty = f['familyProperty'];
      _sudha = f['sudha'];
      _dosha = f['dosha'];
      _createdDate = f['createdDate'] ?? 'All';
      _withPhoto = f['withPhoto'] ?? false;
      _sortBy = f['sortBy'];
    });
  }

  /// One-line summary of a saved filter, e.g. "Age 24-29 · Malayalam".
  String _summary(Map<String, dynamic> f) {
    final parts = <String>[
      if (f['ageFrom'] != null || f['ageTo'] != null)
        'Age ${f['ageFrom'] ?? '–'}-${f['ageTo'] ?? '–'}',
      if (f['heightFrom'] != null || f['heightTo'] != null)
        'Height ${f['heightFrom'] != null ? _heightLabel(f['heightFrom']) : '–'}'
            ' to ${f['heightTo'] != null ? _heightLabel(f['heightTo']) : '–'}',
      for (final k in [
        'marital',
        'motherTongue',
        'education',
        'religion',
        'caste',
        'familyType',
      ])
        if (f[k] != null) f[k] as String,
    ];
    return parts.isEmpty ? 'No filters (all matches)' : parts.join(' · ');
  }

  Future<String?> _promptName(String title, String initial) {
    final ctrl = TextEditingController(text: initial);
    return showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Text(
          title,
          style: GoogleFonts.tasaOrbiter(
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, ctrl.text.trim()),
            child: const Text(
              'Save',
              style: TextStyle(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _saveSearch() async {
    final name = await _promptName('Save search', 'Filter ${_saved.length + 1}');
    if (name == null || name.isEmpty || !mounted) return;
    setState(() => _saved.add(_SavedSearch(name, _snapshot())));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Search saved')));
  }

  Future<void> _renameSaved(_SavedSearch s) async {
    final name = await _promptName('Rename', s.name);
    if (name == null || name.isEmpty || !mounted) return;
    setState(() => s.name = name);
  }

  void _notWired(String what) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('$what search is not connected yet')));
  }

  // Builds the request from whatever is currently selected. Only fields the
  // user actually set go on the request — the rest stay null so
  // SearchBody.toJson() omits them (the backend treats an explicitly present
  // filter, even 0/false, as active). Only age / height / photo are wired to
  // the API today; the other filters are collected here but not sent yet.
  Future<void> _searchNow() async {
    setState(() => _isSearching = true);
    final body = SearchBody(
      ageFrom: _ageFrom,
      ageTo: _ageTo,
      heightFrom: _heightFrom != null ? (_heightFrom! * 2.54).round() : null,
      heightTo: _heightTo != null ? (_heightTo! * 2.54).round() : null,
      withPhoto: _withPhoto ? true : null,
    );

    final provider = context.read<RegisterProvider>();
    final success = await provider.searchProfiles(body);
    if (!mounted) return;
    setState(() => _isSearching = false);

    if (success) {
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            provider.searchError ?? 'Something went wrong. Please try again',
          ),
        ),
      );
    }
  }

  // ---------------- Build ----------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBg,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildTabs(),
            SizedBox(height: 8.h),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(16.w, 6.h, 16.w, 24.h),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: _buildTabBody(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.w, 8.h, 16.w, 8.h),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20.r),
            onTap: () => Navigator.maybePop(context),
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Icon(Icons.arrow_back, size: 22.sp, color: Colors.black87),
            ),
          ),
          SizedBox(width: 4.w),
          Text(
            'Search',
            style: GoogleFonts.tasaOrbiter(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return SizedBox(
      height: 38.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: _SearchTab.values.length,
        separatorBuilder: (_, __) => SizedBox(width: 8.w),
        itemBuilder: (_, i) {
          final t = _SearchTab.values[i];
          final selected = t == _tab;
          return InkWell(
            borderRadius: BorderRadius.circular(20.r),
            onTap: () => setState(() => _tab = t),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? AppColors.primary : const Color(0xFFE9E9E9),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                t.label,
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.white : Colors.black87,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabBody() {
    switch (_tab) {
      case _SearchTab.basic:
        return _buildBasic();
      case _SearchTab.advanced:
        return _buildAdvanced();
      case _SearchTab.saved:
        return _buildSaved();
      case _SearchTab.profileId:
        return _buildProfileId();
      case _SearchTab.keyword:
        return _buildKeyword();
    }
  }

  // ---------------- Basic Search ----------------
  Widget _buildBasic() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('Basic Search'),
        _rangeField<int>(
          label: 'Age',
          options: _ageOptions,
          format: (v) => '$v',
          from: _ageFrom,
          to: _ageTo,
          onFrom: (v) => setState(() => _ageFrom = v),
          onTo: (v) => setState(() => _ageTo = v),
        ),
        _rangeField<int>(
          label: 'Height',
          options: _heightOptions,
          format: _heightLabel,
          from: _heightFrom,
          to: _heightTo,
          onFrom: (v) => setState(() => _heightFrom = v),
          onTo: (v) => setState(() => _heightTo = v),
        ),
        // TODO: weight isn't part of SearchBody yet.
        _rangeField<int>(
          label: 'Weight',
          options: _weightOptions,
          format: (v) => '$v kg',
          from: _weightFrom,
          to: _weightTo,
          onFrom: (v) => setState(() => _weightFrom = v),
          onTo: (v) => setState(() => _weightTo = v),
        ),
        _selectField(
          label: 'Marital Status',
          hint: 'Select Marital Status',
          value: _marital,
          options: _maritalOptions,
          onChanged: (v) => setState(() => _marital = v),
        ),
        _selectField(
          label: 'Disability Status',
          hint: 'Select',
          value: _disability,
          options: _disabilityOptions,
          onChanged: (v) => setState(() => _disability = v),
        ),
        _selectField(
          label: 'Mother Tongue',
          hint: 'Select Mother Tongue',
          value: _motherTongue,
          options: _motherTongueOptions,
          onChanged: (v) => setState(() => _motherTongue = v),
        ),
        _selectField(
          label: 'Education',
          hint: 'Select Education',
          value: _education,
          options: _educationOptions,
          onChanged: (v) => setState(() => _education = v),
        ),
        _selectField(
          label: 'Religion',
          hint: 'Select Religion',
          value: _religion,
          options: _religionOptions,
          onChanged: (v) => setState(() => _religion = v),
        ),
        _selectField(
          label: 'Caste',
          hint: 'Select Caste',
          value: _caste,
          options: _casteOptions,
          onChanged: (v) => setState(() => _caste = v),
        ),
        _selectField(
          label: 'Family Type',
          hint: 'Select Family Type',
          value: _familyType,
          options: _familyTypeOptions,
          onChanged: (v) => setState(() => _familyType = v),
        ),
        SizedBox(height: 8.h),
        _actionRow(),
      ],
    );
  }

  // ---------------- Advanced Search ----------------
  Widget _buildAdvanced() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('Advanced Search'),
        _rangeField<int>(
          label: 'Age',
          options: _ageOptions,
          format: (v) => '$v',
          from: _ageFrom,
          to: _ageTo,
          onFrom: (v) => setState(() => _ageFrom = v),
          onTo: (v) => setState(() => _ageTo = v),
        ),
        _rangeField<int>(
          label: 'Height',
          options: _heightOptions,
          format: _heightLabel,
          from: _heightFrom,
          to: _heightTo,
          onFrom: (v) => setState(() => _heightFrom = v),
          onTo: (v) => setState(() => _heightTo = v),
        ),
        _rangeField<int>(
          label: 'Weight',
          options: _weightOptions,
          format: (v) => '$v kg',
          from: _weightFrom,
          to: _weightTo,
          onFrom: (v) => setState(() => _weightFrom = v),
          onTo: (v) => setState(() => _weightTo = v),
        ),
        _selectField(
          label: 'Marital Status',
          hint: 'Select Marital Status',
          value: _marital,
          options: _maritalOptions,
          onChanged: (v) => setState(() => _marital = v),
        ),
        _selectField(
          label: 'Disability Status',
          hint: 'Select',
          value: _disability,
          options: _disabilityOptions,
          onChanged: (v) => setState(() => _disability = v),
        ),
        _label(
          'Are you preferring persons who have undergone major surgery or Organ transplantation',
        ),
        Row(
          children: [
            _radioOption(
              'Yes',
              _surgeryPref == true,
              () => setState(() => _surgeryPref = true),
            ),
            SizedBox(width: 28.w),
            _radioOption(
              'No',
              _surgeryPref == false,
              () => setState(() => _surgeryPref = false),
            ),
          ],
        ),
        SizedBox(height: 14.h),
        _selectField(
          label: 'Family Status',
          hint: 'Select Family Status',
          value: _familyStatus,
          options: _familyStatusOptions,
          onChanged: (v) => setState(() => _familyStatus = v),
        ),
        _selectField(
          label: 'Body Type',
          hint: 'Select Body Type',
          value: _bodyType,
          options: _bodyTypeOptions,
          onChanged: (v) => setState(() => _bodyType = v),
        ),
        _selectField(
          label: 'Mother Tongue',
          hint: 'Select Mother Tongue',
          value: _motherTongue,
          options: _motherTongueOptions,
          onChanged: (v) => setState(() => _motherTongue = v),
        ),
        _selectField(
          label: 'Body Skin Tone',
          hint: 'Select Body Skin Tone',
          value: _skinTone,
          options: _skinToneOptions,
          onChanged: (v) => setState(() => _skinTone = v),
        ),
        _selectField(
          label: 'Family Type',
          hint: 'Select Family Type',
          value: _familyType,
          options: _familyTypeOptions,
          onChanged: (v) => setState(() => _familyType = v),
        ),
        _selectField(
          label: 'Food Type',
          hint: 'Select Food Type',
          value: _foodType,
          options: _foodTypeOptions,
          onChanged: (v) => setState(() => _foodType = v),
        ),
        _selectField(
          label: 'Drinking Habits',
          hint: 'Select',
          value: _drinking,
          options: _habitOptions,
          onChanged: (v) => setState(() => _drinking = v),
        ),
        _selectField(
          label: 'Smoking Habits',
          hint: 'Select',
          value: _smoking,
          options: _habitOptions,
          onChanged: (v) => setState(() => _smoking = v),
        ),

        _sectionTitle('Religious details'),
        _selectField(
          label: 'Religion',
          hint: 'Select Religion',
          value: _religion,
          options: _religionOptions,
          onChanged: (v) => setState(() => _religion = v),
        ),
        _selectField(
          label: 'Caste',
          hint: 'Select Caste',
          value: _caste,
          options: _casteOptions,
          onChanged: (v) => setState(() => _caste = v),
        ),
        _selectField(
          label: 'Gotra',
          hint: 'Select Gotra',
          value: _gotra,
          options: _gotraOptions,
          onChanged: (v) => setState(() => _gotra = v),
        ),

        _sectionTitle('Location details'),
        _selectField(
          label: 'Country',
          hint: 'Select Country',
          value: _country,
          options: _countryOptions,
          onChanged: (v) => setState(() => _country = v),
        ),
        _selectField(
          label: 'State',
          hint: 'Select State',
          value: _state,
          options: _stateOptions,
          onChanged: (v) => setState(() => _state = v),
        ),
        _selectField(
          label: 'City',
          hint: 'Select City',
          value: _city,
          options: _allDistricts,
          onChanged: (v) => setState(() => _city = v),
        ),

        _sectionTitle('Education & professional details'),
        _selectField(
          label: 'Qualification',
          hint: 'Select Education',
          value: _qualification,
          options: _educationOptions,
          onChanged: (v) => setState(() => _qualification = v),
        ),
        _selectField(
          label: 'Employment Type',
          hint: 'Select Employment Type',
          value: _employmentType,
          options: _employmentOptions,
          onChanged: (v) => setState(() => _employmentType = v),
        ),
        _selectField(
          label: 'Occupation',
          hint: 'Select Occupation',
          value: _occupation,
          options: _occupationOptions,
          onChanged: (v) => setState(() => _occupation = v),
        ),
        _selectField(
          label: 'Annual Income',
          hint: 'Select Annual Income',
          value: _annualIncome,
          options: _incomeOptions,
          onChanged: (v) => setState(() => _annualIncome = v),
        ),
        _selectField(
          label: 'Languages Known',
          hint: 'Select Languages',
          value: _languages,
          options: _languageOptions,
          onChanged: (v) => setState(() => _languages = v),
        ),
        _selectField(
          label: 'Family Property',
          hint: 'Select Family Property',
          value: _familyProperty,
          options: _propertyOptions,
          onChanged: (v) => setState(() => _familyProperty = v),
        ),

        _sectionTitle('Horoscope details'),
        _selectField(
          label: 'Profile with Sudha Jathakam',
          hint: 'Select',
          value: _sudha,
          options: _yesNoAnyOptions,
          onChanged: (v) => setState(() => _sudha = v),
        ),
        _selectField(
          label: 'Profile with Dosha Jathakam',
          hint: 'Select',
          value: _dosha,
          options: _yesNoAnyOptions,
          onChanged: (v) => setState(() => _dosha = v),
        ),

        _sectionTitle('Profiles type'),
        _label('Profiles based on created date'),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: _createdDateOptions
              .map(
                (o) => _choiceChip(
                  o,
                  _createdDate == o,
                  () => setState(() => _createdDate = o),
                ),
              )
              .toList(),
        ),
        SizedBox(height: 12.h),
        const Divider(height: 1, color: Color(0xFFEDEDED)),
        SizedBox(height: 12.h),
        _label('Profiles with Photo'),
        InkWell(
          onTap: () => setState(() => _withPhoto = !_withPhoto),
          child: Row(
            children: [
              SizedBox(
                width: 24.w,
                height: 24.w,
                child: Checkbox(
                  value: _withPhoto,
                  activeColor: AppColors.primary,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (v) => setState(() => _withPhoto = v ?? false),
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                'Matches who have added photos',
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 12.sp,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),

        _sectionTitle('Sort and filter'),
        _selectField(
          label: 'Sort by',
          hint: 'Select',
          value: _sortBy,
          options: _sortOptions,
          onChanged: (v) => setState(() => _sortBy = v),
        ),
        SizedBox(height: 8.h),
        _actionRow(),
      ],
    );
  }

  // ---------------- Saved search ----------------
  Widget _buildSaved() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('Saved Search'),
        if (_saved.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: Center(
              child: Text(
                'No saved searches yet.\nSet your filters in Basic Search and tap "Save search".',
                textAlign: TextAlign.center,
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 12.sp,
                  color: Colors.black45,
                  height: 1.4,
                ),
              ),
            ),
          )
        else
          for (final s in _saved) ...[_savedCard(s), SizedBox(height: 12.h)],
      ],
    );
  }

  Widget _savedCard(_SavedSearch s) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE6E6E6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  s.name,
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Load these filters back into Basic Search to edit.
                  _restore(s.filters);
                  setState(() => _tab = _SearchTab.basic);
                },
                child: Container(
                  width: 38.w,
                  height: 38.w,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.edit, size: 17.sp, color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Text(
            _summary(s.filters),
            style: GoogleFonts.tasaOrbiter(
              fontSize: 11.sp,
              color: Colors.black54,
              height: 1.3,
            ),
          ),
          SizedBox(height: 14.h),
          Align(
            alignment: Alignment.centerRight,
            child: Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: [
                _pillButton('Rename', () => _renameSaved(s)),
                _pillButton(
                  'Delete',
                  () => setState(() => _saved.remove(s)),
                ),
                _pillButton('Show matches', () {
                  _restore(s.filters);
                  _searchNow();
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- Profile ID search ----------------
  Widget _buildProfileId() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('Profile ID search'),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(0xFFE6E6E6)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter matrimony ID',
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 12.sp,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.h),
              _textInput(_idCtrl, 'Eg: W43525266'),
              SizedBox(height: 12.h),
              _pillButton('View Profile', () {
                if (_idCtrl.text.trim().isEmpty) return;
                // TODO: look up the profile by ID and open its detail screen.
                _notWired('Profile ID');
              }),
            ],
          ),
        ),
      ],
    );
  }

  // ---------------- Keyword search ----------------
  Widget _buildKeyword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('Keyword Search'),
        _textInput(_keywordCtrl, 'Search Keywords'),
        SizedBox(height: 12.h),
        _pillButton('Search', () {
          if (_keywordCtrl.text.trim().isEmpty) return;
          // TODO: send the keyword to the search API.
          _notWired('Keyword');
        }),
      ],
    );
  }

  // ---------------- Reusable pieces ----------------

  Widget _title(String text) => Padding(
    padding: EdgeInsets.only(bottom: 14.h),
    child: Text(
      text,
      style: GoogleFonts.tasaOrbiter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    ),
  );

  Widget _sectionTitle(String text) => Padding(
    padding: EdgeInsets.only(top: 10.h, bottom: 12.h),
    child: Text(
      text,
      style: GoogleFonts.tasaOrbiter(
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    ),
  );

  Widget _label(String text) => Padding(
    padding: EdgeInsets.only(bottom: 6.h),
    child: Text(
      text,
      style: GoogleFonts.tasaOrbiter(fontSize: 12.sp, color: Colors.black87),
    ),
  );

  InputDecoration _decoration() => InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.h),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: const BorderSide(color: _fieldBorder),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: const BorderSide(color: _fieldBorder),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: const BorderSide(color: AppColors.primary),
    ),
  );

  TextStyle get _valueStyle =>
      GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: Colors.black87);

  TextStyle get _hintStyle =>
      GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: Colors.black45);

  /// A labelled single-select dropdown.
  Widget _selectField({
    required String label,
    required String hint,
    required String? value,
    required List<String> options,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label(label),
          DropdownButtonFormField<String>(
            value: value,
            isExpanded: true,
            menuMaxHeight: 320.h,
            borderRadius: BorderRadius.circular(12.r),
            icon: const Icon(Icons.keyboard_arrow_down),
            style: _valueStyle,
            decoration: _decoration(),
            hint: Text(hint, style: _hintStyle),
            items: options
                .map((o) => DropdownMenuItem(value: o, child: Text(o)))
                .toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  /// A labelled "from — to" pair of dropdowns.
  Widget _rangeField<T>({
    required String label,
    required List<T> options,
    required String Function(T) format,
    required T? from,
    required T? to,
    required ValueChanged<T?> onFrom,
    required ValueChanged<T?> onTo,
  }) {
    Widget dd(T? value, ValueChanged<T?> onChanged) =>
        DropdownButtonFormField<T>(
          value: value,
          isExpanded: true,
          menuMaxHeight: 320.h,
          borderRadius: BorderRadius.circular(12.r),
          icon: const Icon(Icons.keyboard_arrow_down),
          style: _valueStyle,
          decoration: _decoration(),
          hint: Text('Select', style: _hintStyle),
          items: options
              .map(
                (o) => DropdownMenuItem<T>(
                  value: o,
                  child: Text(format(o), overflow: TextOverflow.ellipsis),
                ),
              )
              .toList(),
          onChanged: onChanged,
        );

    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label(label),
          Row(
            children: [
              Expanded(child: dd(from, onFrom)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'to',
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 12.sp,
                    color: Colors.black54,
                  ),
                ),
              ),
              Expanded(child: dd(to, onTo)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _textInput(TextEditingController ctrl, String hint) {
    return TextField(
      controller: ctrl,
      style: _valueStyle,
      decoration: _decoration().copyWith(
        hintText: hint,
        hintStyle: _hintStyle,
      ),
    );
  }

  Widget _radioOption(String label, bool selected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              selected
                  ? Icons.radio_button_checked_rounded
                  : Icons.radio_button_off_rounded,
              size: 20.sp,
              color: selected ? AppColors.primary : Colors.black38,
            ),
            SizedBox(width: 6.w),
            Text(
              label,
              style: GoogleFonts.tasaOrbiter(
                fontSize: 13.sp,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _choiceChip(String label, bool selected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: selected ? AppColors.primary : _fieldBorder,
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.tasaOrbiter(
            fontSize: 12.sp,
            color: selected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }

  /// Outlined primary pill button (website style).
  Widget _pillButton(String label, VoidCallback onTap, {bool filled = false}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: filled ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(color: AppColors.primary),
        ),
        child: Text(
          label,
          style: GoogleFonts.tasaOrbiter(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: filled ? Colors.white : AppColors.primary,
          ),
        ),
      ),
    );
  }

  /// Save search | Reset | Search
  Widget _actionRow() {
    return Row(
      children: [
        Expanded(child: _actionButton('Save search', _saveSearch)),
        SizedBox(width: 8.w),
        Expanded(child: _actionButton('Reset', _reset)),
        SizedBox(width: 8.w),
        Expanded(
          child: _actionButton(
            'Search',
            _isSearching ? null : _searchNow,
            filled: true,
            loading: _isSearching,
          ),
        ),
      ],
    );
  }

  Widget _actionButton(
    String label,
    VoidCallback? onTap, {
    bool filled = false,
    bool loading = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24.r),
      child: Container(
        height: 44.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: filled ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: AppColors.primary),
        ),
        child: loading
            ? SizedBox(
                width: 18.w,
                height: 18.w,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : Text(
                label,
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: filled ? Colors.white : AppColors.primary,
                ),
              ),
      ),
    );
  }
}