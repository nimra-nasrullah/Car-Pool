import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_view/home_view.dart';
import 'onbording_view.dart';

class StartingView extends StatelessWidget {
  const StartingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8FF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/splash.png",
                  height: 100,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Ride Share",
                  style: GoogleFonts.poppins(
                      color: const Color(0xffA786AC), fontSize: 32),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            PortalOption(
              text: "Parent Portal",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const OnBoardingView()));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            PortalOption(
              text: "Driver Portal",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomeView()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PortalOption extends StatelessWidget {
  const PortalOption({super.key, this.onTap, required this.text});

  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 175,
        alignment: Alignment.center,
        width: 350,
        decoration: BoxDecoration(
          color: const Color(0xff50C878),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
