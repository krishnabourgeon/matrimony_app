// // ═══════════════════════════════════════════════════════════════
// //  3b. COMMUNITY & LOCATION
// // ═══════════════════════════════════════════════════════════════

// import 'package:flutter/material.dart';
// import 'package:matrimony_app/view/custom_widgets/app_color.dart';
// import 'package:matrimony_app/view/custom_widgets/dropdown.dart';
// import 'package:matrimony_app/view/custom_widgets/field.dart';
// import 'package:matrimony_app/view/custom_widgets/field_warp.dart';
// import 'package:matrimony_app/view/custom_widgets/floating_card.dart';
// import 'package:matrimony_app/view/custom_widgets/primary_button.dart';
// import 'package:matrimony_app/view/custom_widgets/progress_indicator.dart';
// import 'package:matrimony_app/view/custom_widgets/scaffold_helpers.dart';
// import 'package:matrimony_app/view/custom_widgets/section_header.dart';
// import 'package:matrimony_app/view/custom_widgets/top_bar.dart';
// import 'package:matrimony_app/view/professional_details_screen.dart';


// class CommunityLocationScreen extends StatefulWidget {
//   const CommunityLocationScreen({super.key});

//   @override
//   State<CommunityLocationScreen> createState() =>
//       _CommunityLocationState();
// }

// class _CommunityLocationState extends State<CommunityLocationScreen> {
//   //int _ancestorCount = 0;

//   final _homeAddressCtrl = TextEditingController();
//   final _homePinCtrl = TextEditingController();

//   bool _sameAsAbove = false;
//   final _currentAddressCtrl = TextEditingController();
//   final _currentPinCtrl = TextEditingController();

//   @override
//   void dispose() {
//     _homeAddressCtrl.dispose();
//     _homePinCtrl.dispose();
//     _currentAddressCtrl.dispose();
//     _currentPinCtrl.dispose();
//     super.dispose();
//   }

//   void _toggleSameAsAbove(bool? value) {
//     setState(() {
//       _sameAsAbove = value ?? false;
//       if (_sameAsAbove) {
//         _currentAddressCtrl.text = _homeAddressCtrl.text;
//         _currentPinCtrl.text = _homePinCtrl.text;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlushScaffold(
//       child: Column(
//         children: [
//           TopBar(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: StepBar(current: 2, total: 8),
//           ),
//           const SizedBox(height: 14),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SectionHeader(
//                     tag: 'STEP 2 OF 8',
//                     title: 'Community & Location',
//                     subtitle: 'Tell us about your roots and where you live',
//                   ),
//                   const SizedBox(height: 20),
//                   FloatingCard(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Religion + Caste
//                         Row(children: [
//                           Expanded(
//                             child: FieldWrap('Religion',
//                                 required: true,
//                                 child: Drop(hint: 'Hindu', items: const [
//                                   'Hindu', 'Muslim', 'Christian',
//                                   'Sikh', 'Jain', 'Buddhist', 'Other'
//                                 ])),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: FieldWrap('Caste',
//                                 required: true,
//                                 child: Drop(
//                                     hint: 'Select Caste',
//                                     items: const [
//                                       'Nair', 'Ezhava', 'Brahmin',
//                                       'Kshatriya', 'Other'
//                                     ])),
//                           ),
//                         ]),
//                         const SizedBox(height: 14),

//                         // Other castes
//                         FieldWrap(
//                           'Looking for matches from other castes?',
//                           child: Drop(hint: 'No', items: const ['No', 'Yes']),
//                         ),
//                         const SizedBox(height: 14),

//                         // SubCaste + Gotra
//                         Row(children: [
//                           Expanded(
//                             child: FieldWrap('SubCaste',
//                                 child: Drop(
//                                     hint: 'Select an Option',
//                                     items: const ['Select an Option', 'N/A'])),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: FieldWrap('Gotra',
//                                 child: Drop(
//                                     hint: "Don't Know",
//                                     items: const ["Don't Know", 'N/A'])),
//                           ),
//                         ]),
//                         const SizedBox(height: 14),

//                         // Native Place
//                         FieldWrap('Native Place / Ancestral Origin',
//                             required: true,
//                             child: Column(children: [
//                               Row(children: [
//                                 Expanded(
//                                     child: Drop(hint: 'India', items: const ['India', 'Other'])),
//                                 const SizedBox(width: 8),
//                                 Expanded(
//                                     child: Drop(hint: 'Kerala', items: const [
//                                       'Kerala', 'Tamil Nadu', 'Karnataka',
//                                       'Maharashtra', 'Delhi'
//                                     ])),
//                                 const SizedBox(width: 8),
//                                 Expanded(
//                                     child: Drop(hint: 'Select District', items: const [
//                                       'Thrissur', 'Ernakulam',
//                                       'Thiruvananthapuram', 'Kozhikode'
//                                     ])),
//                               ]),
//                               // const SizedBox(height: 8),
//                               // TextField(
//                               //   maxLines: 3,
//                               //   maxLength: 255,
//                               //   style: const TextStyle(
//                               //       fontSize: 13, color: AppColors.kDarkSlate),
//                               //   onChanged: (v) => setState(
//                               //       () => _ancestorCount = v.length),
//                               //   decoration: InputDecoration(
//                               //     hintText: 'Tell about your ancestral origin',
//                               //     hintStyle: const TextStyle(
//                               //         color: AppColors.kTextMuted, fontSize: 12),
//                               //     contentPadding: const EdgeInsets.all(12),
//                               //     filled: true,
//                               //     fillColor: AppColors.kCardBg,
//                               //     counterText: '${_ancestorCount}/255',
//                               //     counterStyle: const TextStyle(
//                               //         fontSize: 10, color: AppColors.kTextMuted),
//                               //     border: OutlineInputBorder(
//                               //         borderRadius: BorderRadius.circular(12),
//                               //         borderSide:
//                               //             const BorderSide(color: AppColors.kBorder)),
//                               //     enabledBorder: OutlineInputBorder(
//                               //         borderRadius: BorderRadius.circular(12),
//                               //         borderSide:
//                               //             const BorderSide(color: AppColors.kBorder)),
//                               //     focusedBorder: OutlineInputBorder(
//                               //         borderRadius: BorderRadius.circular(12),
//                               //         borderSide: const BorderSide(
//                               //             color: AppColors.kAccent, width: 1.5)),
//                               //   ),
//                               // ),
//                             ])),
//                         const SizedBox(height: 14),

//                         // Permanent Residence
//                         FieldWrap('Permanent Residence',
//                             required: true,
//                             child: Column(children: [
//                               Row(children: [
//                                 Expanded(
//                                     child: Drop(hint: 'India', items: const ['India', 'Other'])),
//                                 const SizedBox(width: 8),
//                                 Expanded(
//                                     child: Drop(hint: 'Kerala', items: const [
//                                       'Kerala', 'Tamil Nadu', 'Karnataka'
//                                     ])),
//                               ]),
//                               const SizedBox(height: 8),
//                               Row(children: [
//                                 Expanded(
//                                     child: Drop(hint: 'Select District', items: const [
//                                       'Thrissur', 'Ernakulam', 'Kozhikode'
//                                     ])),
//                                 const SizedBox(width: 8),
//                                 Expanded(
//                                     child: Field(
//                                         hint: 'PIN/Zip Code',
//                                         controller: _homePinCtrl,
//                                         keyboardType: TextInputType.number)),
//                               ]),
//                             ])),
//                         const SizedBox(height: 14),

//                         // Home Address
//                         FieldWrap('Home Address',
//                             required: true,
//                             child: Field(
//                                 hint: 'Enter home address',
//                                 controller: _homeAddressCtrl)),
//                         const SizedBox(height: 18),

//                         // Same as above checkbox
//                         Row(children: [
//                           const Text('Home Address',
//                               style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w600,
//                                   color: AppColors.kSlate)),
//                           const Text(' *',
//                               style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.red)),
//                           const SizedBox(width: 16),
//                           SizedBox(
//                             height: 20,
//                             width: 20,
//                             child: Checkbox(
//                               value: _sameAsAbove,
//                               activeColor: AppColors.kAccent,
//                               materialTapTargetSize:
//                                   MaterialTapTargetSize.shrinkWrap,
//                               onChanged: _toggleSameAsAbove,
//                             ),
//                           ),
//                           const SizedBox(width: 6),
//                           const Text('Same as above',
//                               style: TextStyle(
//                                   fontSize: 13, color: AppColors.kSlate)),
//                         ]),
//                         const SizedBox(height: 14),

//                         // Current Residence
//                         FieldWrap('Current Residence',
//                             child: IgnorePointer(
//                               ignoring: _sameAsAbove,
//                               child: Opacity(
//                                 opacity: _sameAsAbove ? 0.5 : 1.0,
//                                 child: Column(children: [
//                                   Row(children: [
//                                     Expanded(
//                                         child: Drop(hint: 'India', items: const ['India', 'Other'])),
//                                     const SizedBox(width: 8),
//                                     Expanded(
//                                         child: Drop(hint: 'Kerala', items: const [
//                                           'Kerala', 'Tamil Nadu', 'Karnataka'
//                                         ])),
//                                   ]),
//                                   const SizedBox(height: 8),
//                                   Row(children: [
//                                     Expanded(
//                                         child: Drop(hint: 'Select District', items: const [
//                                           'Thrissur', 'Ernakulam', 'Kozhikode'
//                                         ])),
//                                     const SizedBox(width: 8),
//                                     Expanded(
//                                         child: Field(
//                                             hint: 'PIN/Zip Code',
//                                             controller: _currentPinCtrl,
//                                             keyboardType: TextInputType.number)),
//                                   ]),
//                                   const SizedBox(height: 8),
//                                   Field(
//                                     hint: 'Enter current address',
//                                     controller: _currentAddressCtrl,
//                                   ),
//                                 ]),
//                               ),
//                             )),
//                         const SizedBox(height: 22),

//                         CTAButton(
//                           label: 'Continue →',
//                           onTap: () => Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) =>
//                                     const ProfessionalDetailsScreen()),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         const Center(
//                           child: Text(
//                             'You can edit your profile anytime from your dashboard',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 fontSize: 10, color: AppColors.kTextMuted),
//                           ),
//                         ),
//                       ],
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




// ═══════════════════════════════════════════════════════════════
//  3b. COMMUNITY & LOCATION
// ═══════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:matrimony_app/model/cast_model.dart';
import 'package:matrimony_app/model/countries_model.dart';
import 'package:matrimony_app/model/district_model.dart';
import 'package:matrimony_app/model/gotar_model.dart';
import 'package:matrimony_app/model/religions_model.dart';
import 'package:matrimony_app/model/states_model.dart' as states_model;
import 'package:matrimony_app/model/subcaste_model.dart';
import 'package:matrimony_app/provider/register_provider.dart';
import 'package:matrimony_app/services/provider_helper_class.dart';
import 'package:matrimony_app/view/professional_details_screen.dart';

/// Brand colors used on this screen — mirrors BasicInfoScreen's palette.
class _Palette {
  _Palette._();
  static const Color coral = Color(0xFFFF3356);
  static const Color ink = Color(0xFF1A1A1A);
  static const Color subtleWhite = Color(0xFFFFFFFF);

  static const Color fieldBg = Color(0xFFF5F5F7);
  static const Color hintText = Color(0xFF8A8A8E);
  static const Color trackBg = Color(0xFFECECEE);
  static const Color error = Color(0xFFE53935);
  static const Color grey = Color(0xFFBDBDBD);
}

class CommunityLocationScreen extends StatefulWidget {
  const CommunityLocationScreen({super.key});

  @override
  State<CommunityLocationScreen> createState() => _CommunityLocationState();
}

class _CommunityLocationState extends State<CommunityLocationScreen> {
  //int _ancestorCount = 0;

  final _homeAddressCtrl = TextEditingController();
  final _homePinCtrl = TextEditingController();
  final _nativeDescriptionCtrl = TextEditingController();

  bool _sameAsAbove = false;
  final _currentAddressCtrl = TextEditingController();
  final _currentPinCtrl = TextEditingController();
  bool _isSubmitting = false;

  Religion? _religion;
  Caste? _caste;
  String? _otherCastes;
  SubCaste? _subCaste;
  Gotra? _gotra;

  Country? _nativeCountry;
  states_model.State? _nativeState;
  District? _nativeDistrict;

  Country? _permanentCountry;
  states_model.State? _permanentState;
  District? _permanentDistrict;

  Country? _currentCountry;
  states_model.State? _currentState;
  District? _currentDistrict;

  List<states_model.State> _nativeStates = [];
  List<District> _nativeDistricts = [];
  List<states_model.State> _permanentStates = [];
  List<District> _permanentDistricts = [];
  List<states_model.State> _currentStates = [];
  List<District> _currentDistricts = [];

  bool _loadingCastes = false;
  bool _loadingSubCastes = false;
  bool _loadingNativeStates = false;
  bool _loadingNativeDistricts = false;
  bool _loadingPermanentStates = false;
  bool _loadingPermanentDistricts = false;
  bool _loadingCurrentStates = false;
  bool _loadingCurrentDistricts = false;

  String? _homeAddressError;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<RegisterProvider>();
      provider.getReligion();
      provider.getGotar();
      provider.getCountries();
    });
  }

  @override
  void dispose() {
    _homeAddressCtrl.dispose();
    _homePinCtrl.dispose();
    _nativeDescriptionCtrl.dispose();
    _currentAddressCtrl.dispose();
    _currentPinCtrl.dispose();
    super.dispose();
  }

  void _toggleSameAsAbove(bool? value) {
    setState(() {
      _sameAsAbove = value ?? false;
      if (_sameAsAbove) {
        _currentAddressCtrl.text = _homeAddressCtrl.text;
        _currentPinCtrl.text = _homePinCtrl.text;
        _currentCountry = _permanentCountry;
        _currentState = _permanentState;
        _currentDistrict = _permanentDistrict;
        _currentStates = _permanentStates;
        _currentDistricts = _permanentDistricts;
      }
    });
  }

  // ---------------------------------------------------------------------
  // Cascading fetches: religion -> caste -> subcaste, country -> state -> district
  // ---------------------------------------------------------------------
  Future<void> _onReligionChanged(Religion? value) async {
    setState(() {
      _religion = value;
      _caste = null;
      _subCaste = null;
    });
    if (value == null) return;
    setState(() => _loadingCastes = true);
    final provider = context.read<RegisterProvider>();
    await provider.getCaste(value.id);
    if (!mounted) return;
    setState(() => _loadingCastes = false);
    if (provider.castModel == null) {
      _showSnack('Could not load castes for the selected religion');
    }
  }

  Future<void> _onCasteChanged(Caste? value) async {
    setState(() {
      _caste = value;
      _subCaste = null;
    });
    if (value == null) return;
    setState(() => _loadingSubCastes = true);
    final provider = context.read<RegisterProvider>();
    await provider.getSubCast(value.id);
    if (!mounted) return;
    setState(() => _loadingSubCastes = false);
  }

  Future<void> _fetchStatesFor(
    Country country,
    void Function(List<states_model.State>) onLoaded,
    void Function(bool) setLoading,
  ) async {
    setLoading(true);
    final provider = context.read<RegisterProvider>();
    await provider.getStates(country.id);
    if (!mounted) return;
    setLoading(false);
    onLoaded(provider.statesModel?.states ?? []);
    if (provider.statesModel == null) {
      _showSnack('Could not load states for the selected country');
    }
  }

  Future<void> _fetchDistrictsFor(
    states_model.State state,
    void Function(List<District>) onLoaded,
    void Function(bool) setLoading,
  ) async {
    setLoading(true);
    final provider = context.read<RegisterProvider>();
    await provider.getDistrict(state.id);
    if (!mounted) return;
    setLoading(false);
    onLoaded(provider.districtModel?.districts ?? []);
    if (provider.districtModel == null) {
      _showSnack('Could not load districts for the selected state');
    }
  }

  void _onNativeCountryChanged(Country? value) {
    setState(() {
      _nativeCountry = value;
      _nativeState = null;
      _nativeDistrict = null;
      _nativeStates = [];
      _nativeDistricts = [];
    });
    if (value != null) {
      _fetchStatesFor(
        value,
        (states) => setState(() => _nativeStates = states),
        (v) => setState(() => _loadingNativeStates = v),
      );
    }
  }

  void _onNativeStateChanged(states_model.State? value) {
    setState(() {
      _nativeState = value;
      _nativeDistrict = null;
      _nativeDistricts = [];
    });
    if (value != null) {
      _fetchDistrictsFor(
        value,
        (districts) => setState(() => _nativeDistricts = districts),
        (v) => setState(() => _loadingNativeDistricts = v),
      );
    }
  }

  void _onPermanentCountryChanged(Country? value) {
    setState(() {
      _permanentCountry = value;
      _permanentState = null;
      _permanentDistrict = null;
      _permanentStates = [];
      _permanentDistricts = [];
    });
    if (value != null) {
      _fetchStatesFor(
        value,
        (states) => setState(() => _permanentStates = states),
        (v) => setState(() => _loadingPermanentStates = v),
      );
    }
  }

  void _onPermanentStateChanged(states_model.State? value) {
    setState(() {
      _permanentState = value;
      _permanentDistrict = null;
      _permanentDistricts = [];
    });
    if (value != null) {
      _fetchDistrictsFor(
        value,
        (districts) => setState(() => _permanentDistricts = districts),
        (v) => setState(() => _loadingPermanentDistricts = v),
      );
    }
  }

  void _onCurrentCountryChanged(Country? value) {
    setState(() {
      _currentCountry = value;
      _currentState = null;
      _currentDistrict = null;
      _currentStates = [];
      _currentDistricts = [];
    });
    if (value != null) {
      _fetchStatesFor(
        value,
        (states) => setState(() => _currentStates = states),
        (v) => setState(() => _loadingCurrentStates = v),
      );
    }
  }

  void _onCurrentStateChanged(states_model.State? value) {
    setState(() {
      _currentState = value;
      _currentDistrict = null;
      _currentDistricts = [];
    });
    if (value != null) {
      _fetchDistrictsFor(
        value,
        (districts) => setState(() => _currentDistricts = districts),
        (v) => setState(() => _loadingCurrentDistricts = v),
      );
    }
  }

  // Required fields: Religion, Caste, Native Place, Permanent Residence, Home Address.
  bool get _isFormValid =>
      _religion != null &&
      _caste != null &&
      _nativeCountry != null &&
      _nativeState != null &&
      _nativeDistrict != null &&
      _permanentCountry != null &&
      _permanentState != null &&
      _permanentDistrict != null &&
      _homePinCtrl.text.trim().isNotEmpty &&
      _homeAddressCtrl.text.trim().isNotEmpty;

  void _handleContinue() {
    FocusScope.of(context).unfocus();

    setState(() {
      _homeAddressError = _homeAddressCtrl.text.trim().isEmpty
          ? 'Please enter home address'
          : null;
    });

    if (_religion == null) return _showSnack('Please select religion');
    if (_caste == null) return _showSnack('Please select caste');
    if (_nativeCountry == null || _nativeState == null || _nativeDistrict == null) {
      return _showSnack('Please complete native place / ancestral origin');
    }
    if (_permanentCountry == null || _permanentState == null || _permanentDistrict == null) {
      return _showSnack('Please complete permanent residence');
    }
    if (_homePinCtrl.text.trim().isEmpty) return _showSnack('Please enter PIN/Zip code');
    if (_homeAddressError != null) return;
    if (!_sameAsAbove &&
        (_currentCountry == null || _currentState == null || _currentDistrict == null)) {
      return _showSnack('Please complete current residence');
    }

    setState(() => _isSubmitting = true);

    final provider = context.read<RegisterProvider>();
    final currentCountry = _sameAsAbove ? _permanentCountry : _currentCountry;
    final currentState = _sameAsAbove ? _permanentState : _currentState;
    final currentDistrict = _sameAsAbove ? _permanentDistrict : _currentDistrict;
    final currentAddress =
        _sameAsAbove ? _homeAddressCtrl.text.trim() : _currentAddressCtrl.text.trim();
    final currentPincode =
        _sameAsAbove ? _homePinCtrl.text.trim() : _currentPinCtrl.text.trim();

    provider
        .communityAndLocation(
      nativeCountryId: _nativeCountry!.id,
      nativeStateId: _nativeState!.id,
      nativeDistrictId: _nativeDistrict!.id,
      nativeDescription: _nativeDescriptionCtrl.text.trim(),
      permanentCountryId: _permanentCountry!.id,
      permanentStateId: _permanentState!.id,
      permanentDistrictId: _permanentDistrict!.id,
      permanentAddress: _homeAddressCtrl.text.trim(),
      permanentPincode: _homePinCtrl.text.trim(),
      currentCountryId: currentCountry!.id,
      currentStateId: currentState!.id,
      currentDistrictId: currentDistrict!.id,
      currentAddress: currentAddress,
      currentPincode: currentPincode,
      religionId: _religion!.id,
      casteId: _caste!.id,
      subCasteId: _subCaste?.id ?? 0,
      gotraId: _gotra?.id ?? 0,
      casteMatch: (_otherCastes ?? 'No').toLowerCase(),
    )
        .then((success) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      if (success) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ProfessionalDetailsScreen()),
        );
      } else {
        _showSnack(provider.communityLocationError ?? 'Something went wrong. Please try again');
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
                      'Community & Location',
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
                      'Tell us about your roots and where you live',
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: _Palette.hintText,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    _FieldLabel('Religion', required: true),
                    SizedBox(height: 8.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final religions = provider.religionsModel?.religions ?? [];
                        final loading = provider.loaderState == LoaderState.loading &&
                            provider.religionsModel == null;
                        return _buildDropdownField<Religion>(
                          hint: loading ? 'Loading religions...' : 'Select Religion',
                          value: _religion,
                          items: religions,
                          labelBuilder: (r) => r.name,
                          loading: loading,
                          onChanged: _onReligionChanged,
                        );
                      },
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Caste', required: true),
                    SizedBox(height: 8.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final castes = provider.castModel?.castes ?? [];
                        return _buildDropdownField<Caste>(
                          hint: _religion == null
                              ? 'Select religion first'
                              : (_loadingCastes ? 'Loading castes...' : 'Select Caste'),
                          value: _caste,
                          items: castes,
                          labelBuilder: (c) => c.name,
                          loading: _loadingCastes,
                          enabled: _religion != null,
                          onChanged: _onCasteChanged,
                        );
                      },
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Looking for matches from other castes ( other than own sub castes )?'),
                    SizedBox(height: 8.h),
                    _buildDropdownField<String>(
                      hint: 'No',
                      value: _otherCastes,
                      items: const ['No', 'Yes'],
                      labelBuilder: (s) => s,
                      onChanged: (v) => setState(() => _otherCastes = v),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('SubCaste'),
                    SizedBox(height: 8.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final subCastes = provider.subcastesModel?.subCastes ?? [];
                        return _buildDropdownField<SubCaste>(
                          hint: _caste == null
                              ? 'Select caste first'
                              : (_loadingSubCastes ? 'Loading...' : 'Select an Option'),
                          value: _subCaste,
                          items: subCastes,
                          labelBuilder: (s) => s.name,
                          loading: _loadingSubCastes,
                          enabled: _caste != null,
                          onChanged: (v) => setState(() => _subCaste = v),
                        );
                      },
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Gotra'),
                    SizedBox(height: 8.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final gotras = provider.gotrasModel?.gotras ?? [];
                        final loading = provider.loaderState == LoaderState.loading &&
                            provider.gotrasModel == null;
                        return _buildDropdownField<Gotra>(
                          hint: loading ? 'Loading...' : "Don't Know",
                          value: _gotra,
                          items: gotras,
                          labelBuilder: (g) => g.name,
                          loading: loading,
                          onChanged: (v) => setState(() => _gotra = v),
                        );
                      },
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Native Place / Ancestral Origin', required: true),
                    SizedBox(height: 8.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final countries = provider.countriesModel?.countries ?? [];
                        final loading = provider.loaderState == LoaderState.loading &&
                            provider.countriesModel == null;
                        return _buildDropdownField<Country>(
                          hint: loading ? 'Loading...' : 'Country',
                          value: _nativeCountry,
                          items: countries,
                          labelBuilder: (c) => c.name,
                          loading: loading,
                          onChanged: _onNativeCountryChanged,
                        );
                      },
                    ),
                    SizedBox(height: 8.h),
                    _buildDropdownField<states_model.State>(
                      hint: _nativeCountry == null
                          ? 'Select country first'
                          : (_loadingNativeStates ? 'Loading...' : 'State'),
                      value: _nativeState,
                      items: _nativeStates,
                      labelBuilder: (s) => s.name,
                      loading: _loadingNativeStates,
                      enabled: _nativeCountry != null,
                      onChanged: _onNativeStateChanged,
                    ),
                    SizedBox(height: 8.h),
                    _buildDropdownField<District>(
                      hint: _nativeState == null
                          ? 'Select state first'
                          : (_loadingNativeDistricts ? 'Loading...' : 'District'),
                      value: _nativeDistrict,
                      items: _nativeDistricts,
                      labelBuilder: (d) => d.name,
                      loading: _loadingNativeDistricts,
                      enabled: _nativeState != null,
                      onChanged: (v) => setState(() => _nativeDistrict = v),
                    ),
                    SizedBox(height: 8.h),
                    // _buildTextField(
                    //   controller: _nativeDescriptionCtrl,
                    //   hint: 'Tell about your ancestral origin',
                    // ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Permanent Residence', required: true),
                    SizedBox(height: 8.h),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        final countries = provider.countriesModel?.countries ?? [];
                        final loading = provider.loaderState == LoaderState.loading &&
                            provider.countriesModel == null;
                        return _buildDropdownField<Country>(
                          hint: loading ? 'Loading...' : 'Country',
                          value: _permanentCountry,
                          items: countries,
                          labelBuilder: (c) => c.name,
                          loading: loading,
                          onChanged: _onPermanentCountryChanged,
                        );
                      },
                    ),
                    SizedBox(height: 8.h),
                    _buildDropdownField<states_model.State>(
                      hint: _permanentCountry == null
                          ? 'Select country first'
                          : (_loadingPermanentStates ? 'Loading...' : 'State'),
                      value: _permanentState,
                      items: _permanentStates,
                      labelBuilder: (s) => s.name,
                      loading: _loadingPermanentStates,
                      enabled: _permanentCountry != null,
                      onChanged: _onPermanentStateChanged,
                    ),
                    SizedBox(height: 8.h),
                    _buildDropdownField<District>(
                      hint: _permanentState == null
                          ? 'Select state first'
                          : (_loadingPermanentDistricts ? 'Loading...' : 'District'),
                      value: _permanentDistrict,
                      items: _permanentDistricts,
                      labelBuilder: (d) => d.name,
                      loading: _loadingPermanentDistricts,
                      enabled: _permanentState != null,
                      onChanged: (v) => setState(() => _permanentDistrict = v),
                    ),
                    SizedBox(height: 8.h),
                    _buildTextField(
                      controller: _homePinCtrl,
                      hint: 'PIN/Zip Code',
                      keyboardType: TextInputType.number,
                      onChanged: (_) => setState(() {}),
                    ),

                    SizedBox(height: 20.h),
                    _FieldLabel('Home Address', required: true),
                    SizedBox(height: 8.h),
                    _buildTextField(
                      controller: _homeAddressCtrl,
                      hint: 'Enter home address',
                      errorText: _homeAddressError,
                      onChanged: (_) {
                        setState(() {
                          if (_homeAddressError != null) _homeAddressError = null;
                        });
                      },
                    ),

                    SizedBox(height: 18.h),
                    Row(
                      children: [
                        SizedBox(
                          height: 20.h,
                          width: 20.h,
                          child: Checkbox(
                            value: _sameAsAbove,
                            activeColor: _Palette.coral,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            onChanged: _toggleSameAsAbove,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Current address same as above',
                          style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: _Palette.ink),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),

                    _FieldLabel('Current Residence'),
                    SizedBox(height: 8.h),
                    IgnorePointer(
                      ignoring: _sameAsAbove,
                      child: Opacity(
                        opacity: _sameAsAbove ? 0.5 : 1.0,
                        child: Column(
                          children: [
                            Consumer<RegisterProvider>(
                              builder: (context, provider, _) {
                                final countries = provider.countriesModel?.countries ?? [];
                                final loading = provider.loaderState == LoaderState.loading &&
                                    provider.countriesModel == null;
                                return _buildDropdownField<Country>(
                                  hint: loading ? 'Loading...' : 'Country',
                                  value: _currentCountry,
                                  items: countries,
                                  labelBuilder: (c) => c.name,
                                  loading: loading,
                                  onChanged: _onCurrentCountryChanged,
                                );
                              },
                            ),
                            SizedBox(height: 8.h),
                            _buildDropdownField<states_model.State>(
                              hint: _currentCountry == null
                                  ? 'Select country first'
                                  : (_loadingCurrentStates ? 'Loading...' : 'State'),
                              value: _currentState,
                              items: _currentStates,
                              labelBuilder: (s) => s.name,
                              loading: _loadingCurrentStates,
                              enabled: _currentCountry != null,
                              onChanged: _onCurrentStateChanged,
                            ),
                            SizedBox(height: 8.h),
                            _buildDropdownField<District>(
                              hint: _currentState == null
                                  ? 'Select state first'
                                  : (_loadingCurrentDistricts ? 'Loading...' : 'District'),
                              value: _currentDistrict,
                              items: _currentDistricts,
                              labelBuilder: (d) => d.name,
                              loading: _loadingCurrentDistricts,
                              enabled: _currentState != null,
                              onChanged: (v) => setState(() => _currentDistrict = v),
                            ),
                            SizedBox(height: 8.h),
                            _buildTextField(
                              controller: _currentPinCtrl,
                              hint: 'PIN/Zip Code',
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 8.h),
                            _buildTextField(
                              controller: _currentAddressCtrl,
                              hint: 'Enter current address',
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 12.h),
                    // Center(
                    //   child: Text(
                    //     'You can edit your profile anytime from your dashboard',
                    //     textAlign: TextAlign.center,
                    //     style: GoogleFonts.tasaOrbiter(fontSize: 10.sp, color: _Palette.hintText),
                    //   ),
                    // ),
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
                // Initial Info → OTP Verify → Basic Info → Community & Location (4th)
                value: 3 / 8,
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
  // Text field
  // ---------------------------------------------------------------------
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    String? errorText,
    ValueChanged<String>? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 44.h,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: _Palette.fieldBg,
            borderRadius: BorderRadius.circular(14.r),
            border: errorText != null ? Border.all(color: _Palette.error, width: 1.2) : null,
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
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
        ),
        if (errorText != null) ...[
          SizedBox(height: 6.h),
          Text(
            errorText,
            style: GoogleFonts.tasaOrbiter(fontSize: 11.sp, color: _Palette.error, fontWeight: FontWeight.w500),
          ),
        ],
      ],
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
                    color: _Palette.error,
                  ),
                ),
              ]
            : null,
      ),
    );
  }
}

