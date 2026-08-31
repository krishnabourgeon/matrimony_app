import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:matrimony_app/provider/home_provider.dart';
import 'package:matrimony_app/provider/shortlist_provider.dart';
import 'package:matrimony_app/view/matches_screen.dart';

/// Small pill overlaid on a profile photo, letting the user shortlist
/// (bookmark) that profile. For profiles with a real backend id, whether the
/// heart shows filled is driven by HomeProvider.shortlistedByYouModel (the
/// real GET matches/shortlisted-by-you list — so it's still correct after
/// an app restart, when nothing has been tapped yet this session), with a
/// [ShortlistProvider] override giving instant feedback for the tap that
/// just happened while the toggle request and its list refetch are still in
/// flight. Sample-data profiles with no real id fall back to the old
/// local-only toggle.
class ShortlistBadge extends StatelessWidget {
  final MatchProfileItem profile;

  const ShortlistBadge({super.key, required this.profile});

  bool _isShortlisted(BuildContext context) {
    if (profile.profileId.isEmpty) {
      return context.watch<ShortlistProvider>().isShortlisted(profile);
    }
    final override = context.watch<ShortlistProvider>().overrideFor(profile.profileId);
    if (override != null) return override;
    final matches = context.watch<HomeProvider>().shortlistedByYouModel?.matches;
    return matches?.any((m) => m.id?.toString() == profile.profileId) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final shortlisted = _isShortlisted(context);
    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: () {
        final id = int.tryParse(profile.profileId);
        if (id != null) {
          context.read<ShortlistProvider>().setOverride(profile.profileId, !shortlisted);
          context.read<HomeProvider>().shortlist(id);
        } else {
          context.read<ShortlistProvider>().toggle(profile);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.45),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              shortlisted ? Icons.favorite : Icons.favorite_border,
              size: 14.sp,
              color: Colors.white,
            ),
            SizedBox(width: 4.w),
            Text(
              'Shortlist',
              style: GoogleFonts.tasaOrbiter(
                fontSize: 11.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
