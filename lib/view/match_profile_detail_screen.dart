// Profile detail screen — opened when a match card is tapped from MatchesScreen.
// Layout: full-bleed hero photo (back / menu / photo-count / prev-next arrows)
// with the name overlaid at the bottom, followed by a white rounded-top sheet
// containing About, Hobbies & Interests, and Basic Details.
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/matches_screen.dart';
import 'package:matrimony_app/view/message_screen.dart';

class MatchProfileDetailScreen extends StatefulWidget {
  final MatchProfileItem item;
  final List<MatchProfileItem> allProfiles;

  const MatchProfileDetailScreen({
    super.key,
    required this.item,
    this.allProfiles = const [],
  });

  @override
  State<MatchProfileDetailScreen> createState() =>
      _MatchProfileDetailScreenState();
}

class _MatchProfileDetailScreenState extends State<MatchProfileDetailScreen> {
  bool _aboutExpanded = false;
  static const Color _iconAccent = Color(0xFFC0EEFF);

  static const _hobbyIconAssets = <String, String>{
    'dancing': 'assets/image/mdi_dance-ballroom.png',
    'cooking': 'assets/image/ph_cooking-pot-fill.png',
    'music': 'assets/image/flowbite_music-solid.png',
    'foodie': 'assets/image/mdi_food.png',
  };

  Widget _hobbyIconWidget(String hobby) {
    final asset = _hobbyIconAssets[hobby.toLowerCase()];
    if (asset != null) {
      return Image.asset(
        asset,
        width: 13.sp,
        height: 13.sp,
        colorBlendMode: BlendMode.srcIn,
      );
    }
    return Icon(Icons.flight_rounded, size: 13.sp);
  }

  int get _index =>
      widget.allProfiles.indexWhere((p) => p.name == widget.item.name);

  void _goTo(int newIndex) {
    if (widget.allProfiles.isEmpty) return;
    final wrapped =
        (newIndex + widget.allProfiles.length) % widget.allProfiles.length;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => MatchProfileDetailScreen(
          item: widget.allProfiles[wrapped],
          allProfiles: widget.allProfiles,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroPhoto(context, item),
            Transform.translate(
              offset: Offset(0, -18.h),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22.r),
                    topRight: Radius.circular(22.r),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle('About ${item.name}'),
                    SizedBox(height: 8.h),
                    _buildAbout(item),
                    SizedBox(height: 20.h),
                    if (item.hobbies.isNotEmpty) ...[
                      _sectionTitle('Hobbies & Interests'),
                      SizedBox(height: 10.h),
                      _buildHobbies(item),
                      SizedBox(height: 20.h),
                    ],
                    _sectionTitle('Basic Details'),
                    SizedBox(height: 10.h),
                    _buildManagedByRow(item),
                    SizedBox(height: 10.h),
                    _buildAgeHeightRow(item),
                    SizedBox(height: 14.h),
                    _buildBasicDetailsRows(item),
                    Divider(
                      thickness: 4,
                      color: Colors.black.withOpacity(0.05),
                    ),
                    SizedBox(height: 20.h),
                    _sectionTitle('Contact Details'),
                    _buildContactDetailsCard(item),
                    SizedBox(height: 10.h),
                    Divider(
                      thickness: 4,
                      color: Colors.black.withOpacity(0.05),
                    ),
                    SizedBox(height: 20.h),
                    _buildFamilyDetailsSection(item),
                    Divider(
                      thickness: 4,
                      color: Colors.black.withOpacity(0.05),
                    ),
                    SizedBox(height: 20.h),
                    _buildCareerEducationSection(item),
                    Divider(
                      thickness: 4,
                      color: Colors.black.withOpacity(0.05),
                    ),
                    SizedBox(height: 20.h),
                    _buildYouAndHerSection(item),
                    SizedBox(height: 20.h),
                    _buildMatchPreferencesSection(item),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================================
  // HERO PHOTO — back / menu / photo count / prev-next / name overlay
  // =====================================================================
  Widget _buildHeroPhoto(BuildContext context, MatchProfileItem item) {
    return SizedBox(
      height: 430.h,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(item.image, fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.30),
                  Colors.transparent,
                  Colors.black.withOpacity(0.55),
                ],
                stops: const [0.0, 0.45, 1.0],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10.h,
            left: 14.w,
            right: 14.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //_circleIconButton(asset: 'assets/image/Vector.png', onTap: () => Navigator.maybePop(context)),
                GestureDetector(
                  onTap: () {
                    // Navigate to the previous screen in the navigation stack
                    Navigator.maybePop(context);
                  },
                  child: Container(
                    width: 68.w,
                    height: 38.w,
                    //padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),

                _circleIconButton(
                  asset: 'assets/image/more_vert.png',
                  onTap: () {},
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 56.h,
            right: 14.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.45),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    size: 15.sp,
                    color: Colors.white,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '${item.photoCount}',
                    style: GoogleFonts.tasaOrbiter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16.w,
            right: 16.w,
            bottom: 30.h,
            child: Row(
              children: [
                if (widget.allProfiles.length > 1)
                  InkWell(
                    onTap: () => _goTo(_index - 1),
                    borderRadius: BorderRadius.circular(18.r),
                    child: Image.asset(
                      "assets/image/Frame 1000006502.png",
                      height: 36.h,
                      width: 36.w,
                    ),
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              item.name,
                              style: GoogleFonts.tasaOrbiter(
                                fontSize: 19.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Image.asset(
                            'assets/image/verified.png',
                            width: 17.w,
                            height: 17.w,
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        item.line1,
                        style: GoogleFonts.tasaOrbiter(
                          fontSize: 12.sp,
                          color: Colors.white70,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        item.line2,
                        style: GoogleFonts.tasaOrbiter(
                          fontSize: 12.sp,
                          color: Colors.white70,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                if (widget.allProfiles.length > 1)
                  InkWell(
                    onTap: () => _goTo(_index + 1),
                    borderRadius: BorderRadius.circular(18.r),
                    child: Image.asset(
                      "assets/image/Frame 1000006503.png",
                      height: 36.h,
                      width: 36.w,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleIconButton({
    IconData? icon,
    String? asset,
    bool flipAsset = false,
    required VoidCallback onTap,
  }) {
    Widget child = icon != null
        ? Icon(icon, color: Colors.white, size: 19.sp)
        : Image.asset(
            asset!,
            width: 14.sp,
            height: 14.sp,
            color: Colors.white,
            colorBlendMode: BlendMode.srcIn,
          );
    if (flipAsset) {
      child = Transform.flip(flipX: true, child: child);
    }
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        width: 36.w,
        height: 36.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.35),
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }

  // =====================================================================
  // ABOUT
  // =====================================================================
  Widget _buildAbout(MatchProfileItem item) {
    final text = item.about.isEmpty ? 'No description shared yet' : item.about;
    final isLong = text.length > 140;
    final display = (_aboutExpanded || !isLong)
        ? text
        : '${text.substring(0, 140)}...';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          display,
          style: GoogleFonts.tasaOrbiter(
            fontSize: 12.5.sp,
            color: Colors.black54,
            height: 1.6,
          ),
        ),
        if (isLong) ...[
          SizedBox(height: 4.h),
          InkWell(
            onTap: () => setState(() => _aboutExpanded = !_aboutExpanded),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _aboutExpanded ? 'Read Less' : 'Read More',
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.coral,
                  ),
                ),
                Icon(
                  _aboutExpanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  size: 16.sp,
                  color: AppColors.coral,
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.tasaOrbiter(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  // =====================================================================
  // HOBBIES & INTERESTS
  // =====================================================================
  Widget _buildHobbies(MatchProfileItem item) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: item.hobbies
          .map(
            (h) => Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
              decoration: BoxDecoration(
                color: const Color(0xFFFBEFF1),
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _hobbyIconWidget(h),
                  SizedBox(width: 5.w),
                  Text(
                    h,
                    style: GoogleFonts.tasaOrbiter(
                      fontSize: 11.5.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  // =====================================================================
  // BASIC DETAILS — managed-by row, age/height row, icon rows
  // =====================================================================
  Widget _buildManagedByRow(MatchProfileItem item) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 9.h),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            'Managed by ${item.managedBy}',
            style: GoogleFonts.tasaOrbiter(
              fontSize: 11.5.sp,
              color: Colors.black45,
            ),
          ),
        ),
        if (item.profileId.isNotEmpty) ...[
          Text(
            '  ·  ',
            style: GoogleFonts.tasaOrbiter(
              fontSize: 11.5.sp,
              color: Colors.black26,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 9.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Text(
                  'ID: ${item.profileId}',
                  style: GoogleFonts.tasaOrbiter(
                    fontSize: 11.5.sp,
                    color: Colors.black45,
                  ),
                ),
                SizedBox(width: 5.w),
                Icon(Icons.copy_rounded, size: 12.sp, color: Colors.black38),
              ],
            ),
          ),
          // SizedBox(width: 4.w),
          // Icon(Icons.copy_rounded, size: 12.sp, color: Colors.black38),
        ],
      ],
    );
  }

  Widget _buildAgeHeightRow(MatchProfileItem item) {
    return Row(
      children: [
        if (item.age > 0) _pillBox('${item.age} yrs Old'),
        if (item.age > 0 && item.height.isNotEmpty) SizedBox(width: 10.w),
        if (item.height.isNotEmpty) _pillBox('Height - ${item.height}'),
      ],
    );
  }

  Widget _pillBox(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 9.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        text,
        style: GoogleFonts.tasaOrbiter(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildBasicDetailsRows(MatchProfileItem item) {
    final religionMotherTongue = [
      item.religion,
      item.motherTongue,
    ].where((s) => s.isNotEmpty).join(', ');
    final rows = <(String, String, String)>[
      if (item.birthDate.isNotEmpty)
        (
          'assets/image/calendar_month.png',
          'Birth Date',
          '${item.zodiac.isNotEmpty ? '${item.zodiac}, ' : ''}Born on ${item.birthDate}',
        ),
      (
        'assets/image/supervisor_account_8.png',
        'Marital Status',
        item.maritalStatus,
      ),
      if (item.location.isNotEmpty)
        ('assets/image/explore_nearby.png', 'Lives in', item.location),
      if (religionMotherTongue.isNotEmpty)
        (
          'assets/image/menu_book.png',
          'Religion & Mother Tongue',
          religionMotherTongue,
        ),
      if (item.community.isNotEmpty)
        ('assets/image/groups.png', 'Community', item.community),
      if (item.diet.isNotEmpty)
        ('assets/image/award_meal.png', 'Diet Preferences', item.diet),
    ];

    return Column(
      children: rows
          .map(
            (r) => Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 57.w,
                    height: 57.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: _iconAccent,
                      //shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Image.asset(
                      r.$1,
                      color: Colors.black,
                      colorBlendMode: BlendMode.srcIn,
                      width: 17.sp,
                      height: 17.sp,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          r.$2,
                          style: GoogleFonts.tasaOrbiter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          r.$3,
                          style: GoogleFonts.tasaOrbiter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildContactDetailsCard(MatchProfileItem item) {
    final maskedPhone = _maskPhone(item.contactNo);
    final maskedEmail = _maskEmail(item.email);

    final rows = <(String, String, String)>[
      if (item.contactNo.isNotEmpty)
        ('assets/image/call.png', 'Contact No.', maskedPhone),
      if (item.email.isNotEmpty)
        ('assets/image/mail.png', 'Email ID', maskedEmail),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 14.h),
        ...rows.map(
          (r) => Padding(
            padding: EdgeInsets.only(bottom: 14.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 57.w,
                  height: 57.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0XFFFFCDCD),
                    borderRadius: BorderRadius.circular(17.r),
                  ),
                  child: Image.asset(
                    r.$1,
                    color: Colors.black,
                    colorBlendMode: BlendMode.srcIn,
                    width: 18.sp,
                    height: 18.sp,
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      r.$2,
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      r.$3,
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 4.h),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () => _onViewContactDetails(item),
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFFEEF1),
              padding: EdgeInsets.symmetric(vertical: 10.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'View Contact Details',
              style: GoogleFonts.tasaOrbiter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // =====================================================================
  // FAMILY DETAILS
  // =====================================================================
  Widget _buildFamilyDetailsSection(MatchProfileItem item) {
    final rows = <(String, String, String)>[
      if (item.fatherOccupation.isNotEmpty || item.motherOccupation.isNotEmpty)
        (
          'assets/image/groups.png',
          "Parent's Details",
          'Father is ${item.fatherOccupation}\nMother is a ${item.motherOccupation}',
        ),
      if (item.siblings.isNotEmpty)
        ('assets/image/diversity_3.png', 'No.of Sibilings', item.siblings),
      if (item.familyFinancialStatus.isNotEmpty)
        (
          'assets/image/paid.png',
          'Family Financial Status',
          item.familyFinancialStatus,
        ),
    ];
    if (rows.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Family Details'),
        if (item.familyStatus.isNotEmpty) ...[
          SizedBox(height: 10.h),
          _statusPill(item.familyStatus),
        ],
        SizedBox(height: 14.h),
        ..._detailIconRows(rows, const Color(0xFFB6F2DC)),
      ],
    );
  }

  // =====================================================================
  // CAREER & EDUCATION
  // =====================================================================
  Widget _buildCareerEducationSection(MatchProfileItem item) {
    final rows = <(String, String, String)>[
      if (item.professionDetail.isNotEmpty || item.profession.isNotEmpty)
        (
          'assets/image/business_center.png',
          'Profession',
          item.professionDetail.isNotEmpty
              ? item.professionDetail
              : item.profession,
        ),
      if (item.annualIncomeSelf.isNotEmpty ||
          item.annualIncomeFamily.isNotEmpty)
        (
          'assets/image/payments.png',
          'Annual Income',
          'Self : ${item.annualIncomeSelf}\nFamily : ${item.annualIncomeFamily}',
        ),
      if (item.education.isNotEmpty)
        ('assets/image/school.png', 'Highest Qualification', item.education),
      if (item.educationField.isNotEmpty)
        ('assets/image/book_5.png', 'Education Field', item.educationField),
    ];
    if (rows.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Career & Education'),
        SizedBox(height: 14.h),
        ..._detailIconRows(rows, const Color(0xFFFBDFA6)),
      ],
    );
  }

  // =====================================================================
  // YOU AND HER — compatibility banner
  // =====================================================================
  Widget _buildYouAndHerSection(MatchProfileItem item) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        width: 361.w,
        height: 165.h,
        color: const Color(0xFFFFD6E1),
        child: Stack(
          children: [
            Positioned.fill(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFFFD8DF), Color(0xFFF97E94)],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFFD8DF).withOpacity(0.01),
                            Color(0xFFFA889D).withOpacity(0.5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFFD8DF).withOpacity(0.01),
                            Color(0xFFFFA7B6).withOpacity(0.5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFFD8DF).withOpacity(0.01),
                            Color(0xFFFFD3E0).withOpacity(0.5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFFD8DF).withOpacity(0.01),
                            Color(0xFFFFDCE6).withOpacity(0.5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFFD8DF).withOpacity(0.01),
                            Color(0xFFFFF1F5).withOpacity(0.5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFFA7B6).withOpacity(0.3),
                            Color(0xFFFFDCE6).withOpacity(0.5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFFA7B6).withOpacity(0.01),
                            Color(0xFFFFF1F5).withOpacity(0.5),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'You and Her',
                    style: GoogleFonts.tasaOrbiter(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.coral,
                    ),
                  ),
                ),
                SizedBox(height: 18.h),
                SizedBox(
                  height: 90.h,
                  width: 160.w,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: -2.w,
                        child: _youHerCircle('assets/image/arun.png'),
                      ),
                      Positioned(right: -2.w, child: _youHerCircle(item.image)),
                      Image.asset(
                        'assets/image/Frame 2085664557.png',
                        width: 44.w,
                        height: 44.w,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _youHerCircle(String image) {
    return Container(
      width: 84.w,
      height: 84.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
    );
  }

  Widget _statusPill(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: GoogleFonts.tasaOrbiter(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  List<Widget> _detailIconRows(
    List<(String, String, String)> rows,
    Color iconBg,
  ) {
    return rows
        .map(
          (r) => Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44.w,
                  height: 44.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: iconBg,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Image.asset(
                    r.$1,
                    width: 20.sp,
                    height: 20.sp,
                    color: Colors.black87,
                    colorBlendMode: BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        r.$2,
                        style: GoogleFonts.tasaOrbiter(
                          fontSize: 13.5.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        r.$3,
                        style: GoogleFonts.tasaOrbiter(
                          fontSize: 12.sp,
                          color: Colors.black54,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();
  }

  // =====================================================================
  // "You Match X/Y her Preferences" checklist
  // =====================================================================
  Widget _buildMatchPreferencesSection(MatchProfileItem item) {
    final religionCommunity = [item.religion, item.community].where((s) => s.isNotEmpty).join(': ');
    final items = <PreferenceMatchItem>[
      if (item.maritalStatus.isNotEmpty)
        PreferenceMatchItem(label: 'Marital Status', values: [item.maritalStatus], matched: true),
      const PreferenceMatchItem(
        label: 'Working With',
        values: ['Private Company, Government / Public Sector, Defence / Civil Services, Business / Self Employed'],
        matched: true,
      ),
      if (religionCommunity.isNotEmpty)
        PreferenceMatchItem(
          label: 'Religion / Community',
          values: [religionCommunity, 'Hindu: Ezhava, Hindu: Kaniyar'],
          matched: true,
          expandable: true,
        ),
      if (item.motherTongue.isNotEmpty)
        PreferenceMatchItem(label: 'Mother Tongue', values: [item.motherTongue], matched: true),
      if (item.location.isNotEmpty)
        PreferenceMatchItem(label: 'City Living in', values: [item.location], matched: true),
      if (item.annualIncomeSelf.isNotEmpty)
        PreferenceMatchItem(label: 'Annual Income', values: [item.annualIncomeSelf], matched: true),
      if (item.height.isNotEmpty)
        PreferenceMatchItem(label: 'Height', values: [item.height], matched: true),
      if (item.education.isNotEmpty)
        PreferenceMatchItem(label: 'Education', values: [item.education], matched: false),
    ];
    final matchedCount = items.where((i) => i.matched).length;

    return MatchPreferencesSection(
      matchedCount: matchedCount,
      totalCount: items.length,
      items: items,
      onChat: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => MessageScreen(name: item.name, image: item.image)),
      ),
      onViewContact: () => _onViewContactDetails(item),
      onConnectNow: () {},
    );
  }

  String _maskPhone(String phone) {
    if (phone.isEmpty) return '';
    final digits = phone.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 4) return phone;
    final splitAt = digits.length > 10 ? digits.length - 10 : 0;
    final visible = splitAt > 0 ? digits.substring(0, splitAt) : '';
    final last = digits.substring(splitAt);
    final code = visible.isNotEmpty ? '+$visible ' : '';
    final shown = last.substring(0, 4);
    return '$code$shown${'*' * (last.length - 4)}';
  }

  String _maskEmail(String email) {
    if (email.isEmpty || !email.contains('@')) return email;
    final domain = email.substring(email.indexOf('@'));
    return '${'*' * 6}$domain';
  }

  void _onViewContactDetails(MatchProfileItem item) {
    // TODO: hook up to your reveal-contact flow / API call
  }
}

/// Model for a single preference match row
class PreferenceMatchItem {
  final String label;
  final List<String> values;
  final bool matched;
  final bool expandable;

  const PreferenceMatchItem({
    required this.label,
    required this.values,
    required this.matched,
    this.expandable = false,
  });
}

/// ---- Section: "You Match X/Y her Preferences" card ----
class MatchPreferencesSection extends StatefulWidget {
  final int matchedCount;
  final int totalCount;
  final List<PreferenceMatchItem> items;
  final VoidCallback? onChat;
  final VoidCallback? onViewContact;
  final VoidCallback? onConnectNow;

  const MatchPreferencesSection({
    super.key,
    required this.matchedCount,
    required this.totalCount,
    required this.items,
    this.onChat,
    this.onViewContact,
    this.onConnectNow,
  });

  @override
  State<MatchPreferencesSection> createState() =>
      _MatchPreferencesSectionState();
}

class _MatchPreferencesSectionState extends State<MatchPreferencesSection> {
  final Set<int> _expanded = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F4F4),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You Match ${widget.matchedCount}/${widget.totalCount} her Preferences',
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 20.h),
              for (int i = 0; i < widget.items.length; i++) ...[
                _buildPreferenceRow(i, widget.items[i]),
                if (i != widget.items.length - 1) SizedBox(height: 22.h),
              ],
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Divider(
          thickness: 10,
          color: Colors.black.withOpacity(0.05),
        ),
        SizedBox(height: 20.h),
        _buildActionBar(),
      ],
    );
  }

  Widget _buildPreferenceRow(int index, PreferenceMatchItem item) {
    final isExpanded = _expanded.contains(index);
    final showToggle = item.expandable && item.values.length > 1;
    final visibleValues =
        (showToggle && !isExpanded) ? [item.values.first] : item.values;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.label,
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                visibleValues.join(', '),
                style: GoogleFonts.tasaOrbiter(
                  fontSize: 13.sp,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
              if (showToggle) ...[
                SizedBox(height: 4.h),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded
                          ? _expanded.remove(index)
                          : _expanded.add(index);
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        isExpanded ? 'Show Less' : 'Show More',
                        style: GoogleFonts.tasaOrbiter(
                          fontSize: 12.5.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.indigo,
                        ),
                      ),
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        size: 16.sp,
                        color: Colors.indigo,
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
        SizedBox(width: 12.w),
        Container(
          width: 32.w,
          height: 32.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: item.matched
                ? const Color(0xFFDFF5E3)
                : const Color(0xFFE8E8E8),
            shape: BoxShape.circle,
          ),
          child: Icon(
            item.matched ? Icons.check_rounded : Icons.close_rounded,
            size: 18.sp,
            color: item.matched ? const Color(0xFF2E9E4F) : Colors.black45,
          ),
        ),
      ],
    );
  }

  Widget _buildActionBar() {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildRoundAction(
          asset: 'assets/image/message_container.png',
          label: 'Chat',
          bgColor: const Color(0xFFEDEBFB),
          onTap: widget.onChat,
        ),
        SizedBox(width: 10.h,),
        _buildRoundAction(
          asset: 'assets/image/Frame 2085664438.png',
          label: 'View contact',
          bgColor:  Colors.grey,
          //iconColor: const Color(0xFF3D6FE0),
          onTap: widget.onViewContact,
        ),
        SizedBox(width: 10.h,),
        _buildConnectNowAction(),
      ],
    );
  }

  Widget _buildRoundAction({
    required String asset,
    required String label,
    required Color bgColor,
    Color? iconColor,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            asset,
            width: 73.sp,
            height: 44.sp,
            color: iconColor,
            colorBlendMode: iconColor != null ? BlendMode.srcIn : null,
          ),
          SizedBox(height: 6.h),
          Text(
            label,
            style: GoogleFonts.tasaOrbiter(
              fontSize: 12.sp,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConnectNowAction() {
    return GestureDetector(
      onTap: widget.onConnectNow,
      child: Column(
        children: [
          Image.asset("assets/image/Frame 2085664438 (1).png",height: 44,width: 72,),
          SizedBox(height: 8.h),
          Text(
            'Connect Now',
            style: GoogleFonts.tasaOrbiter(
              fontSize: 12.sp,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
