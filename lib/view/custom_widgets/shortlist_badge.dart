import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';

/// Small white pill overlaid on a profile photo, letting the user shortlist
/// (bookmark) that profile. Purely local/visual until a shortlist API exists.
class ShortlistBadge extends StatefulWidget {
  final bool initialShortlisted;
  final ValueChanged<bool>? onChanged;

  const ShortlistBadge({
    super.key,
    this.initialShortlisted = false,
    this.onChanged,
  });

  @override
  State<ShortlistBadge> createState() => _ShortlistBadgeState();
}

class _ShortlistBadgeState extends State<ShortlistBadge> {
  late bool _shortlisted = widget.initialShortlisted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: () {
        setState(() => _shortlisted = !_shortlisted);
        widget.onChanged?.call(_shortlisted);
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
              _shortlisted ? Icons.favorite : Icons.favorite_border,
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
