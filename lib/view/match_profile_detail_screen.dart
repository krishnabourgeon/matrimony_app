// Profile detail screen — opened when a match card is tapped from MatchesScreen.
// Layout: full-bleed hero photo (back / menu / photo-count / prev-next arrows)
// with the name overlaid at the bottom, followed by a white rounded-top sheet
// containing About, Hobbies & Interests, and Basic Details.
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/matches_screen.dart';

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
  static const Color _iconAccent = Color(0xFF1CA7A4);

  static const _hobbyIcons = <String, IconData>{
    'dancing': Icons.nightlife_rounded,
    'cooking': Icons.restaurant_rounded,
    'traveling': Icons.flight_rounded,
    'travelling': Icons.flight_rounded,
    'music': Icons.music_note_rounded,
    'foodie': Icons.fastfood_rounded,
    'reading': Icons.menu_book_rounded,
  };

  IconData _hobbyIcon(String hobby) =>
      _hobbyIcons[hobby.toLowerCase()] ?? Icons.favorite_border_rounded;

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

                _circleIconButton(icon: Icons.more_horiz_rounded, onTap: () {}),
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
          //if (widget.allProfiles.length > 1) ...[
          // Positioned(
          //   left: 6.w,
          //   top: 0,
          //   bottom: 0,
          //   child: Center(child: _circleIconButton(asset: 'assets/image/Vector.png', onTap: () => _goTo(_index - 1))),
          // ),
          // Positioned(
          //   right: 6.w,
          //   top: 0,
          //   bottom: 0,
          //   child: Center(child: _circleIconButton(asset: 'assets/image/Vector.png', flipAsset: true, onTap: () => _goTo(_index + 1))),
          // ),
          //],
          Positioned(
            left: 16.w,
            right: 16.w,
            bottom: 30.h,
            child: Row(
              children: [
                Image.asset(
                  "assets/image/Frame 1000006502.png",
                  height: 36.h,
                  width: 36.w,
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
                          Container(
                            width: 17.w,
                            height: 17.w,
                            decoration: const BoxDecoration(
                              color: Color(0xFF2E9E7A),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check_rounded,
                              size: 12.sp,
                              color: Colors.white,
                            ),
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
                Image.asset(
                  "assets/image/Frame 1000006503.png",
                  height: 36.h,
                  width: 36.w,
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
        fontSize: 14.5.sp,
        fontWeight: FontWeight.w700,
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
                  Icon(_hobbyIcon(h), size: 13.sp, color: AppColors.coral),
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
        Text(
          'Managed by ${item.managedBy}',
          style: GoogleFonts.tasaOrbiter(
            fontSize: 11.5.sp,
            color: Colors.black45,
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
          Text(
            'ID: ${item.profileId}',
            style: GoogleFonts.tasaOrbiter(
              fontSize: 11.5.sp,
              color: Colors.black45,
            ),
          ),
          SizedBox(width: 4.w),
          Icon(Icons.copy_rounded, size: 12.sp, color: Colors.black38),
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
    final rows = <(IconData, String, String)>[
      if (item.birthDate.isNotEmpty)
        (
          Icons.calendar_month_rounded,
          'Birth Date',
          '${item.zodiac.isNotEmpty ? '${item.zodiac}, ' : ''}Born on ${item.birthDate}',
        ),
      (Icons.person_outline_rounded, 'Marital Status', item.maritalStatus),
      if (item.location.isNotEmpty)
        (Icons.place_outlined, 'Lives in', item.location),
      if (religionMotherTongue.isNotEmpty)
        (
          Icons.menu_book_rounded,
          'Religion & Mother Tongue',
          religionMotherTongue,
        ),
      if (item.community.isNotEmpty)
        (Icons.groups_2_outlined, 'Community', item.community),
      if (item.diet.isNotEmpty)
        (Icons.restaurant_menu_outlined, 'Diet Preferences', item.diet),
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
                    width: 34.w,
                    height: 34.w,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: _iconAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(r.$1, color: Colors.white, size: 17.sp),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          r.$2,
                          style: GoogleFonts.tasaOrbiter(
                            fontSize: 12.sp,
                            color: Colors.black45,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          r.$3,
                          style: GoogleFonts.tasaOrbiter(
                            fontSize: 13.5.sp,
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
}
