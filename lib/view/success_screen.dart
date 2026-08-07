import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/dashboard_screen.dart';
import 'package:matrimony_app/view/main_screen.dart';

/// Shown after the onboarding/registration flow completes successfully.
/// Navigate here as the final step, then "View Matches" takes the user
/// to the Dashboard.
class AllSetScreen extends StatelessWidget {
  const AllSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Back button
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 8.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () => Navigator.of(context).maybePop(),
                  borderRadius: BorderRadius.circular(24.r),
                  child: Container(
                    width: 44.w,
                    height: 44.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F0F0),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      size: 20.sp,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),

            // Center content
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // All-set illustration
                    Image.asset(
                      'assets/image/Group 1000006496.png',
                      width: 96.w,
                      height: 96.w,
                    ),

                    SizedBox(height: 28.h),

                    // Headline
                    Text(
                      "You're All Set!",
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),

                    SizedBox(height: 12.h),

                    // Subtitle
                    Text(
                      '"We\'ve created your profile. Start\nexploring your matches now."',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.tasaOrbiter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                    ),

                    SizedBox(height: 32.h),

                    // View Matches button
                    SizedBox(
                      width: double.infinity,
                      height: 51.h,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainShell(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.coral,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                        ),
                        child: Text(
                          'View Matches',
                          style: GoogleFonts.tasaOrbiter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
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
}
