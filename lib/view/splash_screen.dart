import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_app/view/custom_widgets/app_color.dart';
import 'package:matrimony_app/view/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const OnboardingScreen()));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFf9e0dd),
              Color.fromARGB(255, 228, 154, 143),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -80,
              left: -60,
              child: circle(280, Colors.pink.withOpacity(.05)),
            ),
            Positioned(
              bottom: -100,
              right: -80,
              child: circle(250, Colors.pink.withOpacity(.05)),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),

                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.3),
                      //borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5),
                        width: 2,
                      ),
                       //shape: BoxShape.circle,
                    ),
                    child: 
                       Image.asset("assets/image/logo.png",fit: BoxFit.fill,),
                  ),
                ),

                const SizedBox(height: 30),

                Text(
                  "VivahBharath",
                  style: GoogleFonts.playfairDisplay(
                    color: AppColors.primary,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  "FIND YOUR PERFECT LIFE PARTNER",
                  style: GoogleFonts.poppins(
                    color: AppColors.secondary,
                    letterSpacing: 2,
                    fontSize: 13,
                  ),
                ),

                const Spacer(),

                Container(
                  width: 45,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                const SizedBox(height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget circle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 40),
      ),
    );
  }
}