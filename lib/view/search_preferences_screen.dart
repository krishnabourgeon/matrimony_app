// "Personalise your search" preference screen — opened from the Search tab
// on the Matches screen.
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

class SearchPreferencesScreen extends StatefulWidget {
  const SearchPreferencesScreen({super.key});

  @override
  State<SearchPreferencesScreen> createState() => _SearchPreferencesScreenState();
}

class _SearchPreferencesScreenState extends State<SearchPreferencesScreen> {
  RangeValues _ageRange = const RangeValues(24, 29);
  RangeValues _heightRange = const RangeValues(59, 67); // inches: 4'11"=59in, 5'7"=67in

  String _maritalStatus = 'Never Married';
  String _community = 'Open to All';
  String _motherTongue = 'Malayalam';
  String _country = 'India';
  String _state = 'Kerala';
  final List<String> _districts = ['Palakkad', 'Thrissur', 'Ernakulam'];
  String _photoSettings = 'Open to All';

  String _qualification = 'Open to All';
  String _education = 'Open to All';
  String _workingWith = 'Open to All';
  String _profession = 'Open to All';
  bool _incomeOpenToAll = true;
  String _diet = 'Open to All';

  bool _advancedExpanded = false;

  static const _allDistricts = [
    'Palakkad', 'Thrissur', 'Ernakulam', 'Kozhikode', 'Kollam', 'Kannur',
    'Alappuzha', 'Kottayam', 'Malappuram', 'Wayanad', 'Idukki', 'Pathanamthitta', 'Kasaragod',
  ];

  String _heightLabel(double inches) {
    final feet = inches ~/ 12;
    final rem = (inches % 12).round();
    final cm = (inches * 2.54).round();
    return "$feet'$rem\" ($cm cm)";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Personalise your search',
                      style: GoogleFonts.tasaOrbiter(fontSize: 15.sp, fontWeight: FontWeight.w700, color: Colors.black87),
                    ),
                    SizedBox(height: 16.h),
                    _rangeSliderRow(
                      label: 'Age',
                      valueText: 'Min ${_ageRange.start.round()} yrs - Max ${_ageRange.end.round()} yrs',
                      values: _ageRange,
                      min: 18,
                      max: 60,
                      onChanged: (v) => setState(() => _ageRange = v),
                    ),
                    SizedBox(height: 18.h),
                    _rangeSliderRow(
                      label: 'Height',
                      valueText: 'Min ${_heightLabel(_heightRange.start)} - Max ${_heightLabel(_heightRange.end)}',
                      values: _heightRange,
                      min: 48,
                      max: 84,
                      onChanged: (v) => setState(() => _heightRange = v),
                    ),
                    SizedBox(height: 8.h),
                    _dropdownRow(
                      label: 'Marital Status',
                      value: _maritalStatus,
                      options: const ['Never Married', 'Divorced', 'Widowed', 'Awaiting Divorce', 'Any'],
                      onSelected: (v) => setState(() => _maritalStatus = v),
                    ),
                    _dropdownRow(
                      label: 'Community',
                      value: _community,
                      options: const ['Open to All', 'Nair', 'Thiyya', 'Ezhava', 'Vishwakarma', 'Brahmin'],
                      onSelected: (v) => setState(() => _community = v),
                    ),
                    _dropdownRow(
                      label: 'Mother Tongue',
                      value: _motherTongue,
                      options: const ['Malayalam', 'Tamil', 'Telugu', 'Kannada', 'Hindi', 'English', 'Any'],
                      onSelected: (v) => setState(() => _motherTongue = v),
                    ),
                    _dropdownRow(
                      label: 'Country living in',
                      value: _country,
                      options: const ['India', 'USA', 'UK', 'UAE', 'Canada', 'Australia', 'Any'],
                      onSelected: (v) => setState(() => _country = v),
                    ),
                    _dropdownRow(
                      label: 'State living in',
                      value: _state,
                      options: const ['Kerala', 'Tamil Nadu', 'Karnataka', 'Any'],
                      onSelected: (v) => setState(() => _state = v),
                    ),
                    _multiSelectRow(
                      label: 'City / District',
                      value: _districts.join(', '),
                      onTap: _pickDistricts,
                    ),
                    _dropdownRow(
                      label: 'Photo Settings',
                      value: _photoSettings,
                      options: const ['Open to All', 'With Photo Only', 'Photo Protected'],
                      onSelected: (v) => setState(() => _photoSettings = v),
                      showDivider: false,
                    ),
                    SizedBox(height: 14.h),
                    Center(
                      child: InkWell(
                        onTap: () => setState(() => _advancedExpanded = !_advancedExpanded),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Advanced Search Options',
                              style: GoogleFonts.tasaOrbiter(fontSize: 12.sp, fontWeight: FontWeight.w600, color: const Color(0xFF5A6ACF)),
                            ),
                            Icon(
                              _advancedExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                              size: 18.sp,
                              color: const Color(0xFF5A6ACF),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_advancedExpanded) ...[
                      SizedBox(height: 10.h),
                      _sectionTitle('Education & Profession Details'),
                      _dropdownRow(
                        label: 'Qualification',
                        value: _qualification,
                        options: const ['Open to All', "Bachelor's", "Master's", 'Doctorate', 'Diploma'],
                        onSelected: (v) => setState(() => _qualification = v),
                      ),
                      _dropdownRow(
                        label: 'Education',
                        value: _education,
                        options: const ['Open to All', 'Engineering', 'Medicine', 'Arts', 'Commerce', 'Law'],
                        onSelected: (v) => setState(() => _education = v),
                      ),
                      _dropdownRow(
                        label: 'Working With',
                        value: _workingWith,
                        options: const ['Open to All', 'Government', 'Private', 'Business', 'Self Employed', 'Not Working'],
                        onSelected: (v) => setState(() => _workingWith = v),
                      ),
                      _dropdownRow(
                        label: 'Profession',
                        value: _profession,
                        options: const ['Open to All', 'Software Engineer', 'Doctor', 'Teacher', 'Finance Professional', 'Business'],
                        onSelected: (v) => setState(() => _profession = v),
                        showDivider: false,
                      ),
                      SizedBox(height: 16.h),
                      _sectionTitle('Annual Income'),
                      SizedBox(height: 8.h),
                      _incomeOption(label: 'Open to All', selected: _incomeOpenToAll, onTap: () => setState(() => _incomeOpenToAll = true)),
                      SizedBox(height: 8.h),
                      _incomeOption(label: 'Specify an Income range', selected: !_incomeOpenToAll, onTap: () => setState(() => _incomeOpenToAll = false)),
                      SizedBox(height: 16.h),
                      _sectionTitle('Life style & Appearance'),
                      _dropdownRow(
                        label: 'Diet',
                        value: _diet,
                        options: const ['Open to All', 'Vegetarian', 'Non-Vegetarian', 'Eggetarian', 'Vegan'],
                        onSelected: (v) => setState(() => _diet = v),
                        showDivider: false,
                      ),
                    ],
                    SizedBox(height: 22.h),
                    SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        borderRadius: BorderRadius.circular(26.r),
                        child: Container(
                          height: 48.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: AppColors.coral, borderRadius: BorderRadius.circular(26.r)),
                          child: Text(
                            'Search Now',
                            style: GoogleFonts.tasaOrbiter(fontSize: 14.sp, fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- Header: back + search field look ----------------
  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.w, 8.h, 16.w, 8.h),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20.r),
            onTap: () => Navigator.maybePop(context),
            child: Padding(
              padding: EdgeInsets.all(6.w),
              child: Icon(Icons.arrow_back, size: 20.sp, color: Colors.black87),
            ),
          ),
          SizedBox(width: 6.w),
          Expanded(
            child: Container(
              height: 38.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(19.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, size: 16.sp, color: Colors.black45),
                  SizedBox(width: 8.w),
                  Text(
                    'Search by Matches',
                    style: GoogleFonts.tasaOrbiter(fontSize: 12.5.sp, color: Colors.black45),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(text, style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, fontWeight: FontWeight.w700, color: Colors.black87)),
    );
  }

  // ---------------- Range slider row ----------------
  Widget _rangeSliderRow({
    required String label,
    required String valueText,
    required RangeValues values,
    required double min,
    required double max,
    required ValueChanged<RangeValues> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: GoogleFonts.tasaOrbiter(fontSize: 12.sp, color: Colors.black54)),
              Text(valueText, style: GoogleFonts.tasaOrbiter(fontSize: 11.sp, color: Colors.black45)),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 3,
              activeTrackColor: AppColors.coral,
              inactiveTrackColor: const Color(0xFFE8E8E8),
              thumbColor: AppColors.coral,
              overlayColor: AppColors.coral.withOpacity(0.15),
              rangeThumbShape: const RoundRangeSliderThumbShape(enabledThumbRadius: 7),
            ),
            child: RangeSlider(min: min, max: max, values: values, onChanged: onChanged),
          ),
        ],
      );
  }

  // ---------------- Dropdown-style row (opens a bottom sheet) ----------------
  Widget _dropdownRow({
    required String label,
    required String value,
    required List<String> options,
    required ValueChanged<String> onSelected,
    bool showDivider = true,
  }) {
    return InkWell(
      onTap: () => _pickOption(label: label, options: options, current: value, onSelected: onSelected),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(label, style: GoogleFonts.tasaOrbiter(fontSize: 11.5.sp, color: Colors.black45)),
                      SizedBox(height: 3.h),
                      Text(value, style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, fontWeight: FontWeight.w600, color: Colors.black87)),
                    ],
                  ),
                ),
                Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black38, size: 20.sp),
              ],
            ),
            if (showDivider) ...[
              SizedBox(height: 10.h),
              Divider(height: 1, color: const Color(0xFFF0F0F0)),
            ],
          ],
        ),
      ),
    );
  }

  Widget _multiSelectRow({required String label, required String value, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(label, style: GoogleFonts.tasaOrbiter(fontSize: 11.5.sp, color: Colors.black45)),
                      SizedBox(height: 3.h),
                      Text(value, style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, fontWeight: FontWeight.w600, color: Colors.black87)),
                    ],
                  ),
                ),
                Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black38, size: 20.sp),
              ],
            ),
            SizedBox(height: 10.h),
            Divider(height: 1, color: const Color(0xFFF0F0F0)),
          ],
        ),
      ),
    );
  }

  Widget _incomeOption({required String label, required bool selected, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.coral.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: selected ? AppColors.coral : const Color(0xFFE0E0E0)),
        ),
        child: Row(
          children: [
            Icon(
              selected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
              size: 18.sp,
              color: selected ? AppColors.coral : Colors.black38,
            ),
            SizedBox(width: 10.w),
            Text(label, style: GoogleFonts.tasaOrbiter(fontSize: 12.5.sp, fontWeight: FontWeight.w600, color: Colors.black87)),
          ],
        ),
      ),
    );
  }

  // ---------------- Bottom sheet pickers ----------------
  void _pickOption({
    required String label,
    required List<String> options,
    required String current,
    required ValueChanged<String> onSelected,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                  child: Text(label, style: GoogleFonts.tasaOrbiter(fontSize: 14.sp, fontWeight: FontWeight.w700, color: Colors.black87)),
                ),
                ...options.map((o) => ListTile(
                      title: Text(o, style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: Colors.black87)),
                      trailing: o == current ? Icon(Icons.check_rounded, color: AppColors.coral) : null,
                      onTap: () {
                        onSelected(o);
                        Navigator.pop(context);
                      },
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  void _pickDistricts() {
    final selected = Set<String>.from(_districts);
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                      child: Text('City / District', style: GoogleFonts.tasaOrbiter(fontSize: 14.sp, fontWeight: FontWeight.w700, color: Colors.black87)),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 340.h),
                      child: ListView(
                        shrinkWrap: true,
                        children: _allDistricts
                            .map((d) => CheckboxListTile(
                                  value: selected.contains(d),
                                  activeColor: AppColors.coral,
                                  title: Text(d, style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, color: Colors.black87)),
                                  onChanged: (checked) => setSheetState(() {
                                    checked == true ? selected.add(d) : selected.remove(d);
                                  }),
                                ))
                            .toList(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
                      child: SizedBox(
                        width: double.infinity,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _districts
                                ..clear()
                                ..addAll(selected);
                            });
                            Navigator.pop(context);
                          },
                          borderRadius: BorderRadius.circular(24.r),
                          child: Container(
                            height: 44.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: AppColors.coral, borderRadius: BorderRadius.circular(24.r)),
                            child: Text('Done', style: GoogleFonts.tasaOrbiter(fontSize: 13.sp, fontWeight: FontWeight.w700, color: Colors.white)),
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
}
