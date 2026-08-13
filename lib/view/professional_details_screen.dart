// // // ═══════════════════════════════════════════════════════════════
// // //  3c. PROFESSIONAL DETAILS
// // // ═══════════════════════════════════════════════════════════════



// // import 'package:flutter/material.dart';
// // import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// // import 'package:matrimony_app/view/custom_widgets/dropdown.dart';
// // import 'package:matrimony_app/view/custom_widgets/field.dart';
// // import 'package:matrimony_app/view/custom_widgets/field_warp.dart';
// // import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
// // import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
// // import 'package:matrimony_app/view/custom_widgets/progress_indicator.dart';
// // import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
// // import 'package:matrimony_app/view/custom_widgets/section_header.dart';
// // import 'package:matrimony_app/view/custom_widgets/top_bar.dart';
// // import 'package:matrimony_app/view/personal_physical_screen.dart';


// // class ProfessionalDetailsScreen extends StatefulWidget {
// //   const ProfessionalDetailsScreen({super.key});

// //   @override
// //   State<ProfessionalDetailsScreen> createState() =>
// //       _ProfessionalDetailsState();
// // }

// // class _ProfessionalDetailsState extends State<ProfessionalDetailsScreen> {
// //   final _empOptions = [
// //     'Healthcare', 'Information Technology', 'Farmer', 'Defence',
// //     'Government/PSU', 'Private sector', 'Business', 'Others',
// //   ];
// //   final Set<String> _selected = {};

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlushScaffold(
// //       child: Column(
// //         children: [
// //           TopBar(),
// //           Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: 20),
// //             child: StepBar(current: 3, total: 8),
// //           ),
// //           const SizedBox(height: 14),
// //           Expanded(
// //             child: SingleChildScrollView(
// //               padding: const EdgeInsets.symmetric(horizontal: 20),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   const SectionHeader(
// //                     tag: 'STEP 3 OF 8',
// //                     title: 'Professional Details',
// //                     subtitle:
// //                         'Helps us find you the most compatible match',
// //                   ),
// //                   const SizedBox(height: 20),
// //                   FloatingCard(
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         // Highest education
// //                         FieldWrap('Highest Education',
// //                             required: true,
// //                             child: Drop(
// //                                 hint: 'Select Education',
// //                                 items: const [
// //                                   'High School', 'Diploma', "Bachelor's",
// //                                   "Master's", 'PhD', 'Other'
// //                                 ])),
// //                         const SizedBox(height: 14),

// //                         // Education in detail
// //                         FieldWrap('Education in Detail',
// //                             child: Field(
// //                                 hint: 'Write a brief description',
// //                                 maxLines: 3,
// //                                 maxLength: 255)),
// //                         const SizedBox(height: 14),

// //                         // Languages
// //                         FieldWrap('Languages Known',
// //                             child: Field(hint: 'Select languages')),
// //                         const SizedBox(height: 14),

// //                         // Employed in chips
// //                         FieldWrap('Employed In',
// //                             child: Wrap(
// //                               spacing: 8,
// //                               runSpacing: 8,
// //                               children: _empOptions.map((e) {
// //                                 final sel = _selected.contains(e);
// //                                 return GestureDetector(
// //                                   onTap: () => setState(() => sel
// //                                       ? _selected.remove(e)
// //                                       : _selected.add(e)),
// //                                   child: AnimatedContainer(
// //                                     duration:
// //                                         const Duration(milliseconds: 180),
// //                                     padding: const EdgeInsets.symmetric(
// //                                         horizontal: 12, vertical: 8),
// //                                     decoration: BoxDecoration(
// //                                       color: sel
// //                                           ? AppColors.kAccent.withOpacity(0.1)
// //                                           : AppColors.kCardBg,
// //                                       borderRadius:
// //                                           BorderRadius.circular(8),
// //                                       border: Border.all(
// //                                           color: sel ? AppColors.kAccent : AppColors.kBorder,
// //                                           width: 1.3),
// //                                     ),
// //                                     child: Text(e,
// //                                         style: TextStyle(
// //                                           fontSize: 12,
// //                                           color: sel
// //                                               ? AppColors.kAccent
// //                                               : AppColors.kTextMuted,
// //                                           fontWeight: sel
// //                                               ? FontWeight.w600
// //                                               : FontWeight.w400,
// //                                         )),
// //                                   ),
// //                                 );
// //                               }).toList(),
// //                             )),
// //                         const SizedBox(height: 14),

// //                         // Occupation + Working Country
// //                         Row(children: [
// //                           Expanded(
// //                             child: FieldWrap('Occupation',
// //                                 required: true,
// //                                 child: Drop(hint: 'Select', items: const [
// //                                   'Engineer', 'Doctor', 'Teacher',
// //                                   'Lawyer', 'Accountant', 'Other'
// //                                 ])),
// //                           ),
// //                           const SizedBox(width: 12),
// //                           Expanded(
// //                             child: FieldWrap('Working Country',
// //                                 child: Drop(hint: 'Select', items: const [
// //                                   'India', 'UAE', 'USA', 'UK', 'Other'
// //                                 ])),
// //                           ),
// //                         ]),
// //                         const SizedBox(height: 14),

// //                         // State + City
// //                         Row(children: [
// //                           Expanded(
// //                             child: FieldWrap('State',
// //                                 child: Drop(hint: 'Select State', items: const [
// //                                   'Kerala', 'Tamil Nadu', 'Karnataka',
// //                                   'Maharashtra', 'Delhi'
// //                                 ])),
// //                           ),
// //                           const SizedBox(width: 12),
// //                           Expanded(
// //                             child: FieldWrap('City',
// //                                 child: Drop(hint: 'Select', items: const [
// //                                   'Thrissur', 'Kochi', 'Kozhikode',
// //                                   'Thiruvananthapuram'
// //                                 ])),
// //                           ),
// //                         ]),
// //                         const SizedBox(height: 14),

// //                         // Residential Status
// //                         FieldWrap('Residential Status',
// //                             child: Drop(hint: 'Select', items: const [
// //                               'Resident',
// //                               'Non-Resident Indian',
// //                               'Overseas Citizen'
// //                             ])),
// //                         const SizedBox(height: 14),

// //                         // Annual Income
// //                         FieldWrap('Annual Income',
// //                             child: Row(children: [
// //                               Expanded(
// //                                 child: Drop(hint: 'Currency', items: const [
// //                                   'INR', 'USD', 'AED'
// //                                 ]),
// //                               ),
// //                               const SizedBox(width: 12),
// //                               Expanded(
// //                                 child: Drop(hint: 'Range', items: const [
// //                                   'Below 2L', '2-5L', '5-10L',
// //                                   '10-20L', '20L+'
// //                                 ]),
// //                               ),
// //                             ])),
// //                         const SizedBox(height: 22),
// //                         CTAButton(
// //                           label: 'Continue →',
// //                           onTap: () => Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                                 builder: (_) =>
// //                                     const PersonalPhysicalScreen()),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   const SizedBox(height: 32),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }





// // ═══════════════════════════════════════════════════════════════
// //  3c. PROFESSIONAL DETAILS
// // ═══════════════════════════════════════════════════════════════



// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:matrimony_app/model/countries_model.dart';
// import 'package:matrimony_app/model/curriencies_model.dart';
// import 'package:matrimony_app/model/district_model.dart';
// import 'package:matrimony_app/model/education_model.dart';
// import 'package:matrimony_app/model/income_model.dart';
// import 'package:matrimony_app/model/job_industries_model.dart';
// import 'package:matrimony_app/model/mother_tongue.dart';
// import 'package:matrimony_app/model/occupations_model.dart';
// import 'package:matrimony_app/model/residiential_model.dart';
// import 'package:matrimony_app/model/states_model.dart' as states_model;
// import 'package:matrimony_app/provider/register_provider.dart';
// import 'package:matrimony_app/services/provider_helper_class.dart';
// import 'package:matrimony_app/view/personal_physical_screen.dart';

// /// Brand colors used on this screen — mirrors BasicInfoScreen's palette.
// class _Palette {
//   _Palette._();
//   static const Color coral = Color(0xFFFF3356);
//   static const Color ink = Color(0xFF1A1A1A);
//   static const Color subtleWhite = Color(0xFFFFFFFF);

//   static const Color fieldBg = Color(0xFFF5F5F7);
//   static const Color hintText = Color(0xFF8A8A8E);
//   static const Color trackBg = Color(0xFFECECEE);
//   static const Color grey = Color(0xFFBDBDBD);
// }

// class ProfessionalDetailsScreen extends StatefulWidget {
//   const ProfessionalDetailsScreen({super.key});

//   @override
//   State<ProfessionalDetailsScreen> createState() => _ProfessionalDetailsState();
// }

// class _ProfessionalDetailsState extends State<ProfessionalDetailsScreen> {
//   final Set<JobIndustry> _selectedEmploymentTypes = {};
//   final Set<Language> _selectedLanguages = {};

//   final _educationDetailCtrl = TextEditingController();

//   Education? _education;
//   Occupation? _occupation;
//   Country? _workingCountry;
//   states_model.State? _workingState;
//   District? _workingDistrict;
//   ResidentialStatus? _residentialStatus;
//   Currency? _currency;
//   Income? _incomeRange;

//   bool _loadingIncomes = false;

//   bool _isSubmitting = false;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final provider = context.read<RegisterProvider>();
//       provider.getEducations();
//       provider.getEmploymentTypes();
//       provider.getOccupations();
//       provider.getResidentialStatuses();
//       provider.getCurrencies();
//       provider.getCountries();
//       provider.motherTongue();
//     });
//   }

//   @override
//   void dispose() {
//     _educationDetailCtrl.dispose();
//     super.dispose();
//   }

//   // Required fields: Highest Education, Occupation.
//   bool get _isFormValid => _education != null && _occupation != null;

//   void _onWorkingCountryChanged(Country? value) {
//     setState(() {
//       _workingCountry = value;
//       _workingState = null;
//       _workingDistrict = null;
//     });
//     if (value != null) context.read<RegisterProvider>().getStates(value.id);
//   }

//   void _onWorkingStateChanged(states_model.State? value) {
//     setState(() {
//       _workingState = value;
//       _workingDistrict = null;
//     });
//     if (value != null) context.read<RegisterProvider>().getDistrict(value.id);
//   }

//   Future<void> _onCurrencyChanged(Currency? value) async {
//     setState(() {
//       _currency = value;
//       _incomeRange = null;
//     });
//     if (value == null) return;
//     setState(() => _loadingIncomes = true);
//     await context.read<RegisterProvider>().getIncomes(value.id);
//     if (!mounted) return;
//     setState(() => _loadingIncomes = false);
//   }

//   void _handleContinue() {
//     FocusScope.of(context).unfocus();
//     if (_education == null) return _showSnack('Please select highest education');
//     if (_occupation == null) return _showSnack('Please select occupation');

//     setState(() => _isSubmitting = true);

//     final provider = context.read<RegisterProvider>();
//     provider
//         .professionalDetails(
//       highestEducationId: _education!.id,
//       educationDesc: _educationDetailCtrl.text.trim(),
//       jobIndustryId: _selectedEmploymentTypes.isNotEmpty
//           ? _selectedEmploymentTypes.first.id
//           : 0,
//       occupationId: _occupation!.id,
//       workingCountryId: _workingCountry?.id ?? 0,
//       workingStateId: _workingState?.id ?? 0,
//       workingDistrictId: _workingDistrict?.id ?? 0,
//       residentialStatusId: _residentialStatus?.id ?? 0,
//       currencyId: _currency?.id ?? 0,
//       incomeSlabId: _incomeRange?.id ?? 0,
//       languages: _selectedLanguages.map((l) => l.id).toList(),
//     )
//         .then((success) {
//       if (!mounted) return;
//       setState(() => _isSubmitting = false);
//       if (success) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const PersonalPhysicalScreen()),
//         );
//       } else {
//         _showSnack(provider.professionalError ?? 'Something went wrong. Please try again');
//       }
//     });
//   }

//   void _showSnack(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message, style: GoogleFonts.tasaOrbiter(color: _Palette.subtleWhite)),
//         backgroundColor: _Palette.ink,
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: _Palette.subtleWhite,
//       body: SafeArea(
//         child: Column(
//           children: [
//             _buildTopBar(),
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: EdgeInsets.symmetric(horizontal: 24.w),
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 35.h),
//                     Text(
//                       'Professional Details',
//                       style: GoogleFonts.tasaOrbiter(
//                         fontSize: 24.sp,
//                         fontWeight: FontWeight.w800,
//                         color: _Palette.ink,
//                         letterSpacing: -0.6,
//                         height: 1.25,
//                       ),
//                     ),
//                     SizedBox(height: 6.h),
//                     Text(
//                       'Helps us find you the most compatible match',
//                       style: GoogleFonts.tasaOrbiter(
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w400,
//                         color: _Palette.hintText,
//                       ),
//                     ),
//                     SizedBox(height: 20.h),

//                     _FieldLabel('Highest Education'),
//                     SizedBox(height: 8.h),
//                     Consumer<RegisterProvider>(
//                       builder: (context, provider, _) {
//                         final educations = provider.educationModel?.educations ?? [];
//                         final loading = provider.loaderState == LoaderState.loading &&
//                             provider.educationModel == null;
//                         return _buildDropdownField<Education>(
//                           hint: loading ? 'Loading...' : 'Select Education',
//                           value: _education,
//                           items: educations,
//                           labelBuilder: (e) => e.name,
//                           loading: loading,
//                           onChanged: (v) => setState(() => _education = v),
//                         );
//                       },
//                     ),

//                     SizedBox(height: 20.h),
//                     _FieldLabel('Education in Detail'),
//                     SizedBox(height: 8.h),
//                     _buildTextField(
//                       controller: _educationDetailCtrl,
//                       hint: 'Write a brief description',
//                     ),

//                     SizedBox(height: 20.h),
//                     _FieldLabel('Languages Known'),
//                     SizedBox(height: 10.h),
//                     Consumer<RegisterProvider>(
//                       builder: (context, provider, _) {
//                         final languages = provider.motherTongueModel?.languages ?? [];
//                         final loading = provider.loaderState == LoaderState.loading &&
//                             provider.motherTongueModel == null;
//                         if (loading) {
//                           return SizedBox(
//                             height: 30.h,
//                             child: Center(
//                               child: CircularProgressIndicator(strokeWidth: 2, color: _Palette.coral),
//                             ),
//                           );
//                         }
//                         return _buildMultiSelectChips<Language>(
//                           items: languages,
//                           selected: _selectedLanguages,
//                           labelBuilder: (l) => l.name,
//                           onToggle: (lang) => setState(() {
//                             _selectedLanguages.contains(lang)
//                                 ? _selectedLanguages.remove(lang)
//                                 : _selectedLanguages.add(lang);
//                           }),
//                         );
//                       },
//                     ),

//                     SizedBox(height: 20.h),
//                     _FieldLabel('Employment Type'),
//                     SizedBox(height: 10.h),
//                     Consumer<RegisterProvider>(
//                       builder: (context, provider, _) {
//                         final types = provider.jobIndustriesModel?.jobIndustries ?? [];
//                         final loading = provider.loaderState == LoaderState.loading &&
//                             provider.jobIndustriesModel == null;
//                         if (loading) {
//                           return SizedBox(
//                             height: 30.h,
//                             child: Center(
//                               child: CircularProgressIndicator(strokeWidth: 2, color: _Palette.coral),
//                             ),
//                           );
//                         }
//                         // Backend only accepts a single job_industry_id, so
//                         // selecting a new chip replaces the previous choice.
//                         return _buildMultiSelectChips<JobIndustry>(
//                           items: types,
//                           selected: _selectedEmploymentTypes,
//                           labelBuilder: (t) => t.name,
//                           onToggle: (type) => setState(() {
//                             if (_selectedEmploymentTypes.contains(type)) {
//                               _selectedEmploymentTypes.remove(type);
//                             } else {
//                               _selectedEmploymentTypes
//                                 ..clear()
//                                 ..add(type);
//                             }
//                           }),
//                         );
//                       },
//                     ),

//                     SizedBox(height: 20.h),
//                     _FieldLabel('Occupation'),
//                     SizedBox(height: 8.h),
//                     Consumer<RegisterProvider>(
//                       builder: (context, provider, _) {
//                         final occupations = provider.occupationsModel?.occupations ?? [];
//                         final loading = provider.loaderState == LoaderState.loading &&
//                             provider.occupationsModel == null;
//                         return _buildDropdownField<Occupation>(
//                           hint: loading ? 'Loading...' : 'Select Occupation',
//                           value: _occupation,
//                           items: occupations,
//                           labelBuilder: (o) => o.name,
//                           loading: loading,
//                           onChanged: (v) => setState(() => _occupation = v),
//                         );
//                       },
//                     ),

//                     SizedBox(height: 20.h),
//                     _FieldLabel('Working Country'),
//                     SizedBox(height: 8.h),
//                     Consumer<RegisterProvider>(
//                       builder: (context, provider, _) {
//                         final countries = provider.countriesModel?.countries ?? [];
//                         final loading = provider.loaderState == LoaderState.loading &&
//                             provider.countriesModel == null;
//                         return _buildDropdownField<Country>(
//                           hint: loading ? 'Loading...' : 'Select',
//                           value: _workingCountry,
//                           items: countries,
//                           labelBuilder: (c) => c.name,
//                           loading: loading,
//                           onChanged: _onWorkingCountryChanged,
//                         );
//                       },
//                     ),

//                     SizedBox(height: 20.h),
//                     _FieldLabel('Working State / Province'),
//                     SizedBox(height: 8.h),
//                     Consumer<RegisterProvider>(
//                       builder: (context, provider, _) {
//                         final states = provider.statesModel?.states ?? [];
//                         return _buildDropdownField<states_model.State>(
//                           hint: _workingCountry == null ? 'Select country first' : 'Select State',
//                           value: _workingState,
//                           items: states,
//                           labelBuilder: (s) => s.name,
//                           enabled: _workingCountry != null,
//                           onChanged: _onWorkingStateChanged,
//                         );
//                       },
//                     ),

//                     SizedBox(height: 20.h),
//                     _FieldLabel('Working District / City'),
//                     SizedBox(height: 8.h),
//                     Consumer<RegisterProvider>(
//                       builder: (context, provider, _) {
//                         final districts = provider.districtModel?.districts ?? [];
//                         return _buildDropdownField<District>(
//                           hint: _workingState == null ? 'Select state first' : 'Select',
//                           value: _workingDistrict,
//                           items: districts,
//                           labelBuilder: (d) => d.name,
//                           enabled: _workingState != null,
//                           onChanged: (v) => setState(() => _workingDistrict = v),
//                         );
//                       },
//                     ),

//                     SizedBox(height: 20.h),
//                     _FieldLabel('Residential Status'),
//                     SizedBox(height: 8.h),
//                     Consumer<RegisterProvider>(
//                       builder: (context, provider, _) {
//                         final statuses = provider.residentialModel?.residentialStatuses ?? [];
//                         final loading = provider.loaderState == LoaderState.loading &&
//                             provider.residentialModel == null;
//                         return _buildDropdownField<ResidentialStatus>(
//                           hint: loading ? 'Loading...' : 'Select',
//                           value: _residentialStatus,
//                           items: statuses,
//                           labelBuilder: (r) => r.name,
//                           loading: loading,
//                           onChanged: (v) => setState(() => _residentialStatus = v),
//                         );
//                       },
//                     ),

//                     SizedBox(height: 20.h),
//                     _FieldLabel('Annual Income'),
//                     SizedBox(height: 8.h),
//                     Consumer<RegisterProvider>(
//                       builder: (context, provider, _) {
//                         final currencies = provider.currenciesModel?.currencies ?? [];
//                         final loading = provider.loaderState == LoaderState.loading &&
//                             provider.currenciesModel == null;
//                         return _buildDropdownField<Currency>(
//                           hint: loading ? 'Loading...' : 'Currency',
//                           value: _currency,
//                           items: currencies,
//                           labelBuilder: (c) => c.name,
//                           loading: loading,
//                           onChanged: _onCurrencyChanged,
//                         );
//                       },
//                     ),
//                     SizedBox(height: 8.h),
//                     Consumer<RegisterProvider>(
//                       builder: (context, provider, _) {
//                         final incomes = provider.incomeModel?.incomes ?? [];
//                         return _buildDropdownField<Income>(
//                           hint: _currency == null
//                               ? 'Select currency first'
//                               : (_loadingIncomes ? 'Loading...' : 'Range'),
//                           value: _incomeRange,
//                           items: incomes,
//                           labelBuilder: (i) => i.name,
//                           loading: _loadingIncomes,
//                           enabled: _currency != null,
//                           onChanged: (v) => setState(() => _incomeRange = v),
//                         );
//                       },
//                     ),

//                     SizedBox(height: 32.h),
//                   ],
//                 ),
//               ),
//             ),
//             _buildBottomArea(),
//           ],
//         ),
//       ),
//     );
//   }

//   // ---------------------------------------------------------------------
//   // Top bar: back button + progress track
//   // ---------------------------------------------------------------------
//   Widget _buildTopBar() {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 0),
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: () => Navigator.of(context).pop(),
//             child: Container(
//               width: 36.w,
//               height: 36.w,
//               decoration: const BoxDecoration(
//                 color: _Palette.fieldBg,
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(Icons.arrow_back_rounded, color: _Palette.ink, size: 18.sp),
//             ),
//           ),
//           SizedBox(width: 14.w),
//           Expanded(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(4.r),
//               child: LinearProgressIndicator(
//                 // ... Basic Info → Community & Location → Professional Details (5th)
//                 value: 4 / 8,
//                 minHeight: 6.h,
//                 backgroundColor: _Palette.trackBg,
//                 valueColor: const AlwaysStoppedAnimation<Color>(_Palette.coral),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ---------------------------------------------------------------------
//   // Multi-select chips (Languages Known / Employment Type)
//   // ---------------------------------------------------------------------
//   Widget _buildMultiSelectChips<T>({
//     required List<T> items,
//     required Set<T> selected,
//     required String Function(T) labelBuilder,
//     required ValueChanged<T> onToggle,
//   }) {
//     return Wrap(
//       spacing: 8.w,
//       runSpacing: 8.h,
//       children: items.map((item) {
//         final bool isSelected = selected.contains(item);
//         return GestureDetector(
//           onTap: () => onToggle(item),
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 150),
//             padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 9.h),
//             decoration: BoxDecoration(
//               color: isSelected ? _Palette.coral.withOpacity(0.1) : _Palette.fieldBg,
//               borderRadius: BorderRadius.circular(20.r),
//               border: Border.all(
//                 color: isSelected ? _Palette.coral : Colors.transparent,
//                 width: 1.2,
//               ),
//             ),
//             child: Text(
//               labelBuilder(item),
//               style: GoogleFonts.tasaOrbiter(
//                 fontSize: 10.5.sp,
//                 fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
//                 color: isSelected ? _Palette.coral : _Palette.ink,
//               ),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   // ---------------------------------------------------------------------
//   // Text field
//   // ---------------------------------------------------------------------
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hint,
//     TextInputType? keyboardType,
//     ValueChanged<String>? onChanged,
//   }) {
//     return Container(
//       height: 44.h,
//       alignment: Alignment.centerLeft,
//       decoration: BoxDecoration(
//         color: _Palette.fieldBg,
//         borderRadius: BorderRadius.circular(14.r),
//       ),
//       child: TextFormField(
//         controller: controller,
//         keyboardType: keyboardType,
//         onChanged: onChanged,
//         style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: _Palette.ink, fontWeight: FontWeight.w500),
//         decoration: InputDecoration(
//           hintText: hint,
//           hintStyle: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: _Palette.hintText, fontWeight: FontWeight.w400),
//           border: InputBorder.none,
//           errorBorder: InputBorder.none,
//           focusedBorder: InputBorder.none,
//           enabledBorder: InputBorder.none,
//           isDense: true,
//           isCollapsed: true,
//           contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
//         ),
//       ),
//     );
//   }

//   // ---------------------------------------------------------------------
//   // Dropdown field
//   // ---------------------------------------------------------------------
//   Widget _buildDropdownField<T>({
//     required String hint,
//     required T? value,
//     required List<T> items,
//     required String Function(T) labelBuilder,
//     required ValueChanged<T?> onChanged,
//     bool enabled = true,
//     bool loading = false,
//   }) {
//     return Container(
//       constraints: BoxConstraints(minHeight: 44.h),
//       padding: EdgeInsets.symmetric(horizontal: 18.w),
//       alignment: Alignment.centerLeft,
//       decoration: BoxDecoration(
//         color: _Palette.fieldBg,
//         borderRadius: BorderRadius.circular(14.r),
//       ),
//       child: loading
//           ? Row(
//               children: [
//                 SizedBox(
//                   width: 14.w,
//                   height: 14.w,
//                   child: CircularProgressIndicator(strokeWidth: 2, color: _Palette.coral),
//                 ),
//                 SizedBox(width: 10.w),
//                 Text(
//                   hint,
//                   style: GoogleFonts.tasaOrbiter(
//                       fontSize: 13.sp, color: _Palette.hintText, fontWeight: FontWeight.w400),
//                 ),
//               ],
//             )
//           : DropdownButtonHideUnderline(
//               child: DropdownButtonFormField<T>(
//                 initialValue: items.contains(value) ? value : null,
//                 isExpanded: true,
//                 icon: Icon(Icons.keyboard_arrow_down_rounded, color: _Palette.ink, size: 22.sp),
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   isDense: true,
//                   contentPadding: EdgeInsets.symmetric(vertical: 10.h),
//                 ),
//                 hint: Text(
//                   hint,
//                   style: GoogleFonts.tasaOrbiter(
//                       fontSize: 13.sp, color: _Palette.hintText, fontWeight: FontWeight.w400),
//                 ),
//                 style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: _Palette.ink, fontWeight: FontWeight.w500),
//                 dropdownColor: _Palette.subtleWhite,
//                 borderRadius: BorderRadius.circular(14.r),
//                 items: items
//                     .map((item) => DropdownMenuItem<T>(
//                           value: item,
//                           child: Text(labelBuilder(item), overflow: TextOverflow.ellipsis),
//                         ))
//                     .toList(),
//                 onChanged: enabled ? onChanged : null,
//               ),
//             ),
//     );
//   }

//   // ---------------------------------------------------------------------
//   // Bottom area: Continue button (coral once the form is valid, grey otherwise)
//   // ---------------------------------------------------------------------
//   Widget _buildBottomArea() {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 20.h),
//       child: SizedBox(
//         width: double.infinity,
//         height: 40.h,
//         child: ElevatedButton(
//           onPressed: _isSubmitting ? null : _handleContinue,
//           style: ElevatedButton.styleFrom(
//             backgroundColor: _isFormValid ? _Palette.coral : _Palette.grey,
//             disabledBackgroundColor: _Palette.coral,
//             foregroundColor: _Palette.subtleWhite,
//             elevation: 0,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(28.r),
//             ),
//           ),
//           child: _isSubmitting
//               ? SizedBox(
//                   width: 22.w,
//                   height: 22.w,
//                   child: const CircularProgressIndicator(
//                     strokeWidth: 2.4,
//                     valueColor: AlwaysStoppedAnimation<Color>(
//                       _Palette.subtleWhite,
//                     ),
//                   ),
//                 )
//               : Text(
//                   'Continue',
//                   style: GoogleFonts.tasaOrbiter(
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w700,
//                     letterSpacing: 0.1,
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
// }

// /// Small reusable field label used above every input on this screen.
// class _FieldLabel extends StatelessWidget {
//   final String text;
//   const _FieldLabel(this.text);

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: GoogleFonts.tasaOrbiter(
//         fontSize: 13.sp,
//         fontWeight: FontWeight.w600,
//         color: _Palette.ink,
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:matrimony_app/model/countries_model.dart';
import 'package:matrimony_app/model/curriencies_model.dart';
import 'package:matrimony_app/model/district_model.dart';
import 'package:matrimony_app/model/education_model.dart';
import 'package:matrimony_app/model/income_model.dart';
import 'package:matrimony_app/model/job_industries_model.dart';
import 'package:matrimony_app/model/mother_tongue.dart';
import 'package:matrimony_app/model/occupations_model.dart';
import 'package:matrimony_app/model/residiential_model.dart';
import 'package:matrimony_app/model/states_model.dart' as states_model;
import 'package:matrimony_app/provider/register_provider.dart';
import 'package:matrimony_app/services/provider_helper_class.dart';
import 'package:matrimony_app/view/personal_physical_screen.dart';

/// Brand colors used on this screen — mirrors BasicInfoScreen's palette.
class _Palette {
  _Palette._();
  static const Color coral = Color(0xFFFF3356);
  static const Color ink = Color(0xFF1A1A1A);
  static const Color subtleWhite = Color(0xFFFFFFFF);

  static const Color fieldBg = Color(0xFFF5F5F7);
  static const Color hintText = Color(0xFF8A8A8E);
  static const Color trackBg = Color(0xFFECECEE);
  static const Color grey = Color(0xFFBDBDBD);
}

class ProfessionalDetailsScreen extends StatefulWidget {
  const ProfessionalDetailsScreen({super.key});

  @override
  State<ProfessionalDetailsScreen> createState() => _ProfessionalDetailsState();
}

class _ProfessionalDetailsState extends State<ProfessionalDetailsScreen> {
  final Set<JobIndustry> _selectedEmploymentTypes = {};
  final Set<Language> _selectedLanguages = {};

  final _educationDetailCtrl = TextEditingController();

  Education? _education;
  Occupation? _occupation;
  Country? _workingCountry;
  states_model.State? _workingState;
  District? _workingDistrict;
  ResidentialStatus? _residentialStatus;
  Currency? _currency;
  Income? _incomeRange;

  bool _loadingIncomes = false;

  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<RegisterProvider>();
      provider.getEducations();
      provider.getEmploymentTypes();
      provider.getOccupations();
      provider.getResidentialStatuses();
      provider.getCurrencies();
      provider.getCountries();
      provider.motherTongue();
    });
  }

  @override
  void dispose() {
    _educationDetailCtrl.dispose();
    super.dispose();
  }

  // Required fields: Highest Education, Occupation.
  bool get _isFormValid => _education != null && _occupation != null;

  void _onWorkingCountryChanged(Country? value) {
    setState(() {
      _workingCountry = value;
      _workingState = null;
      _workingDistrict = null;
    });
    if (value != null) context.read<RegisterProvider>().getStates(value.id);
  }

  void _onWorkingStateChanged(states_model.State? value) {
    setState(() {
      _workingState = value;
      _workingDistrict = null;
    });
    if (value != null) context.read<RegisterProvider>().getDistrict(value.id);
  }

  Future<void> _onCurrencyChanged(Currency? value) async {
    setState(() {
      _currency = value;
      _incomeRange = null;
    });
    if (value == null) return;
    setState(() => _loadingIncomes = true);
    await context.read<RegisterProvider>().getIncomes(value.id);
    if (!mounted) return;
    setState(() => _loadingIncomes = false);
  }

  void _handleContinue() {
    FocusScope.of(context).unfocus();
    if (_education == null) return _showSnack('Please select highest education');
    if (_occupation == null) return _showSnack('Please select occupation');

    setState(() => _isSubmitting = true);

    final provider = context.read<RegisterProvider>();
    provider
        .professionalDetails(
      highestEducationId: _education!.id,
      educationDesc: _educationDetailCtrl.text.trim(),
      jobIndustryId: _selectedEmploymentTypes.isNotEmpty
          ? _selectedEmploymentTypes.first.id
          : 0,
      occupationId: _occupation!.id,
      workingCountryId: _workingCountry?.id ?? 0,
      workingStateId: _workingState?.id ?? 0,
      workingDistrictId: _workingDistrict?.id ?? 0,
      residentialStatusId: _residentialStatus?.id ?? 0,
      currencyId: _currency?.id ?? 0,
      incomeSlabId: _incomeRange?.id ?? 0,
      languages: _selectedLanguages.map((l) => l.id).toList(),
    )
        .then((success) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      if (success) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PersonalPhysicalScreen()),
        );
      } else {
        _showSnack(provider.professionalError ?? 'Something went wrong. Please try again');
      }
    });
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: GoogleFonts.tasaOrbiter(color: _Palette.subtleWhite)),
        backgroundColor: _Palette.ink,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _Palette.subtleWhite,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 35.h),
                    Text(
                      'Professional Details',
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w800,
                        color: _Palette.ink,
                        letterSpacing: -0.6,
                        height: 1.25,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'Helps us find you the most compatible match',
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: _Palette.hintText,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    _FieldLabel('Highest Education', required: true),
                    SizedBox(height: 8.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final educations = provider.educationModel?.educations ?? [];
                        final loading = provider.loaderState == LoaderState.loading &&
                            provider.educationModel == null;
                        return _buildDropdownField<Education>(
                          hint: loading ? 'Loading...' : 'Select Education',
                          value: _education,
                          items: educations,
                          labelBuilder: (e) => e.name,
                          loading: loading,
                          onChanged: (v) => setState(() => _education = v),
                        );
                      },
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Education in Detail'),
                    SizedBox(height: 8.h),
                    _buildTextField(
                      controller: _educationDetailCtrl,
                      hint: 'Write a brief description',
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Languages Known'),
                    SizedBox(height: 8.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final languages = provider.motherTongueModel?.languages ?? [];
                        final loading = provider.loaderState == LoaderState.loading &&
                            provider.motherTongueModel == null;
                        return _buildMultiSelectDropdown<Language>(
                          hint: loading ? 'Loading...' : 'Select Languages',
                          title: 'Languages Known',
                          items: languages,
                          selected: _selectedLanguages,
                          labelBuilder: (l) => l.name,
                          loading: loading,
                          onChanged: (updated) => setState(() {
                            _selectedLanguages
                              ..clear()
                              ..addAll(updated);
                          }),
                        );
                      },
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Employment Type'),
                    SizedBox(height: 10.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final types = provider.jobIndustriesModel?.jobIndustries ?? [];
                        final loading = provider.loaderState == LoaderState.loading &&
                            provider.jobIndustriesModel == null;
                        if (loading) {
                          return SizedBox(
                            height: 30.h,
                            child: Center(
                              child: CircularProgressIndicator(strokeWidth: 2, color: _Palette.coral),
                            ),
                          );
                        }
                        // Backend only accepts a single job_industry_id, so
                        // selecting a new chip replaces the previous choice.
                        return _buildMultiSelectChips<JobIndustry>(
                          items: types,
                          selected: _selectedEmploymentTypes,
                          labelBuilder: (t) => t.name,
                          onToggle: (type) => setState(() {
                            if (_selectedEmploymentTypes.contains(type)) {
                              _selectedEmploymentTypes.remove(type);
                            } else {
                              _selectedEmploymentTypes
                                ..clear()
                                ..add(type);
                            }
                          }),
                        );
                      },
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Occupation', required: true),
                    SizedBox(height: 8.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final occupations = provider.occupationsModel?.occupations ?? [];
                        final loading = provider.loaderState == LoaderState.loading &&
                            provider.occupationsModel == null;
                        return _buildDropdownField<Occupation>(
                          hint: loading ? 'Loading...' : 'Select Occupation',
                          value: _occupation,
                          items: occupations,
                          labelBuilder: (o) => o.name,
                          loading: loading,
                          onChanged: (v) => setState(() => _occupation = v),
                        );
                      },
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Working Country'),
                    SizedBox(height: 8.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final countries = provider.countriesModel?.countries ?? [];
                        final loading = provider.loaderState == LoaderState.loading &&
                            provider.countriesModel == null;
                        return _buildDropdownField<Country>(
                          hint: loading ? 'Loading...' : 'Select',
                          value: _workingCountry,
                          items: countries,
                          labelBuilder: (c) => c.name,
                          loading: loading,
                          onChanged: _onWorkingCountryChanged,
                        );
                      },
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Working State / Province'),
                    SizedBox(height: 8.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final states = provider.statesModel?.states ?? [];
                        return _buildDropdownField<states_model.State>(
                          hint: _workingCountry == null ? 'Select country first' : 'Select State',
                          value: _workingState,
                          items: states,
                          labelBuilder: (s) => s.name,
                          enabled: _workingCountry != null,
                          onChanged: _onWorkingStateChanged,
                        );
                      },
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Working District / City'),
                    SizedBox(height: 8.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final districts = provider.districtModel?.districts ?? [];
                        return _buildDropdownField<District>(
                          hint: _workingState == null ? 'Select state first' : 'Select',
                          value: _workingDistrict,
                          items: districts,
                          labelBuilder: (d) => d.name,
                          enabled: _workingState != null,
                          onChanged: (v) => setState(() => _workingDistrict = v),
                        );
                      },
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Residential Status'),
                    SizedBox(height: 8.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final statuses = provider.residentialModel?.residentialStatuses ?? [];
                        final loading = provider.loaderState == LoaderState.loading &&
                            provider.residentialModel == null;
                        return _buildDropdownField<ResidentialStatus>(
                          hint: loading ? 'Loading...' : 'Select',
                          value: _residentialStatus,
                          items: statuses,
                          labelBuilder: (r) => r.name,
                          loading: loading,
                          onChanged: (v) => setState(() => _residentialStatus = v),
                        );
                      },
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Annual Income'),
                    SizedBox(height: 8.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final currencies = provider.currenciesModel?.currencies ?? [];
                        final loading = provider.loaderState == LoaderState.loading &&
                            provider.currenciesModel == null;
                        return _buildDropdownField<Currency>(
                          hint: loading ? 'Loading...' : 'Currency',
                          value: _currency,
                          items: currencies,
                          labelBuilder: (c) => c.name,
                          loading: loading,
                          onChanged: _onCurrencyChanged,
                        );
                      },
                    ),
                    SizedBox(height: 8.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final incomes = provider.incomeModel?.incomes ?? [];
                        return _buildDropdownField<Income>(
                          hint: _currency == null
                              ? 'Select currency first'
                              : (_loadingIncomes ? 'Loading...' : 'Range'),
                          value: _incomeRange,
                          items: incomes,
                          labelBuilder: (i) => i.name,
                          loading: _loadingIncomes,
                          enabled: _currency != null,
                          onChanged: (v) => setState(() => _incomeRange = v),
                        );
                      },
                    ),

                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
            _buildBottomArea(),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Top bar: back button + progress track
  // ---------------------------------------------------------------------
  Widget _buildTopBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 36.w,
              height: 36.w,
              decoration: const BoxDecoration(
                color: _Palette.fieldBg,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_back_rounded, color: _Palette.ink, size: 18.sp),
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: LinearProgressIndicator(
                // ... Basic Info → Community & Location → Professional Details (5th)
                value: 4 / 8,
                minHeight: 6.h,
                backgroundColor: _Palette.trackBg,
                valueColor: const AlwaysStoppedAnimation<Color>(_Palette.coral),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Multi-select chips (Employment Type)
  // ---------------------------------------------------------------------
  Widget _buildMultiSelectChips<T>({
    required List<T> items,
    required Set<T> selected,
    required String Function(T) labelBuilder,
    required ValueChanged<T> onToggle,
  }) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: items.map((item) {
        final bool isSelected = selected.contains(item);
        return GestureDetector(
          onTap: () => onToggle(item),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 9.h),
            decoration: BoxDecoration(
              color: isSelected ? _Palette.coral.withOpacity(0.1) : _Palette.fieldBg,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: isSelected ? _Palette.coral : Colors.transparent,
                width: 1.2,
              ),
            ),
            child: Text(
              labelBuilder(item),
              style: GoogleFonts.tasaOrbiter(
                fontSize: 10.5.sp,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected ? _Palette.coral : _Palette.ink,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // ---------------------------------------------------------------------
  // Multi-select dropdown (Languages Known)
  // Looks like a normal dropdown field. Tapping it opens a bottom sheet
  // with a checklist so the user can pick more than one language. The
  // field itself then shows the picked names as small tags, or the hint
  // text if nothing has been picked yet.
  // ---------------------------------------------------------------------
  Widget _buildMultiSelectDropdown<T>({
    required String hint,
    required String title,
    required List<T> items,
    required Set<T> selected,
    required String Function(T) labelBuilder,
    required ValueChanged<Set<T>> onChanged,
    bool loading = false,
    bool enabled = true,
  }) {
    return GestureDetector(
      onTap: (loading || !enabled)
          ? null
          : () => _openMultiSelectSheet<T>(
                title: title,
                items: items,
                selected: selected,
                labelBuilder: labelBuilder,
                onChanged: onChanged,
              ),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 44.h),
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: _Palette.fieldBg,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: loading
            ? Row(
                children: [
                  SizedBox(
                    width: 14.w,
                    height: 14.w,
                    child: CircularProgressIndicator(strokeWidth: 2, color: _Palette.coral),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    hint,
                    style: GoogleFonts.tasaOrbiter(
                        fontSize: 13.sp, color: _Palette.hintText, fontWeight: FontWeight.w400),
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: selected.isEmpty
                        ? Text(
                            hint,
                            style: GoogleFonts.tasaOrbiter(
                                fontSize: 13.sp, color: _Palette.hintText, fontWeight: FontWeight.w400),
                          )
                        : Wrap(
                            spacing: 6.w,
                            runSpacing: 6.h,
                            children: selected
                                .map(
                                  (item) => Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                                    decoration: BoxDecoration(
                                      color: _Palette.coral.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Text(
                                      labelBuilder(item),
                                      style: GoogleFonts.tasaOrbiter(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600,
                                        color: _Palette.coral,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                  ),
                  Icon(Icons.keyboard_arrow_down_rounded, color: _Palette.ink, size: 22.sp),
                ],
              ),
      ),
    );
  }

  Future<void> _openMultiSelectSheet<T>({
    required String title,
    required List<T> items,
    required Set<T> selected,
    required String Function(T) labelBuilder,
    required ValueChanged<Set<T>> onChanged,
  }) async {
    // Work on a temporary copy so cancelling the sheet doesn't mutate state.
    final Set<T> tempSelected = {...selected};

    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: _Palette.subtleWhite,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  top: 14.h,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 14.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: _Palette.trackBg,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      title,
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        color: _Palette.ink,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Flexible(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: items.length,
                        separatorBuilder: (_, __) => Divider(height: 1.h, color: _Palette.trackBg),
                        itemBuilder: (context, index) {
                          final item = items[index];
                          final isChecked = tempSelected.contains(item);
                          return InkWell(
                            onTap: () => setSheetState(() {
                              isChecked ? tempSelected.remove(item) : tempSelected.add(item);
                            }),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.h),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      labelBuilder(item),
                                      style: GoogleFonts.tasaOrbiter(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: _Palette.ink,
                                      ),
                                    ),
                                  ),
                                  Checkbox(
                                    value: isChecked,
                                    activeColor: _Palette.coral,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    onChanged: (_) => setSheetState(() {
                                      isChecked ? tempSelected.remove(item) : tempSelected.add(item);
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(
                      width: double.infinity,
                      height: 40.h,
                      child: ElevatedButton(
                        onPressed: () {
                          onChanged(tempSelected);
                          Navigator.of(sheetContext).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _Palette.coral,
                          foregroundColor: _Palette.subtleWhite,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.r),
                          ),
                        ),
                        child: Text(
                          'Done',
                          style: GoogleFonts.tasaOrbiter(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // ---------------------------------------------------------------------
  // Text field
  // ---------------------------------------------------------------------
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType? keyboardType,
    ValueChanged<String>? onChanged,
  }) {
    return Container(
      height: 44.h,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: _Palette.fieldBg,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: _Palette.ink, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: _Palette.hintText, fontWeight: FontWeight.w400),
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          isDense: true,
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Dropdown field
  // ---------------------------------------------------------------------
  Widget _buildDropdownField<T>({
    required String hint,
    required T? value,
    required List<T> items,
    required String Function(T) labelBuilder,
    required ValueChanged<T?> onChanged,
    bool enabled = true,
    bool loading = false,
  }) {
    return Container(
      constraints: BoxConstraints(minHeight: 44.h),
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: _Palette.fieldBg,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: loading
          ? Row(
              children: [
                SizedBox(
                  width: 14.w,
                  height: 14.w,
                  child: CircularProgressIndicator(strokeWidth: 2, color: _Palette.coral),
                ),
                SizedBox(width: 10.w),
                Text(
                  hint,
                  style: GoogleFonts.tasaOrbiter(
                      fontSize: 13.sp, color: _Palette.hintText, fontWeight: FontWeight.w400),
                ),
              ],
            )
          : DropdownButtonHideUnderline(
              child: DropdownButtonFormField<T>(
                initialValue: items.contains(value) ? value : null,
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down_rounded, color: _Palette.ink, size: 22.sp),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                ),
                hint: Text(
                  hint,
                  style: GoogleFonts.tasaOrbiter(
                      fontSize: 13.sp, color: _Palette.hintText, fontWeight: FontWeight.w400),
                ),
                style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: _Palette.ink, fontWeight: FontWeight.w500),
                dropdownColor: _Palette.subtleWhite,
                borderRadius: BorderRadius.circular(14.r),
                items: items
                    .map((item) => DropdownMenuItem<T>(
                          value: item,
                          child: Text(labelBuilder(item), overflow: TextOverflow.ellipsis),
                        ))
                    .toList(),
                onChanged: enabled ? onChanged : null,
              ),
            ),
    );
  }

  // ---------------------------------------------------------------------
  // Bottom area: Continue button (coral once the form is valid, grey otherwise)
  // ---------------------------------------------------------------------
  Widget _buildBottomArea() {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 20.h),
      child: SizedBox(
        width: double.infinity,
        height: 40.h,
        child: ElevatedButton(
          onPressed: _isSubmitting ? null : _handleContinue,
          style: ElevatedButton.styleFrom(
            backgroundColor: _isFormValid ? _Palette.coral : _Palette.grey,
            disabledBackgroundColor: _Palette.coral,
            foregroundColor: _Palette.subtleWhite,
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
                      _Palette.subtleWhite,
                    ),
                  ),
                )
              : Text(
                  'Continue',
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

/// Small reusable field label used above every input on this screen.
class _FieldLabel extends StatelessWidget {
  final String text;
  final bool required;
  const _FieldLabel(this.text, {this.required = false});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: GoogleFonts.tasaOrbiter(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
          color: _Palette.ink,
        ),
        children: required
            ? [
                TextSpan(
                  text: ' *',
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ]
            : null,
      ),
    );
  }
}