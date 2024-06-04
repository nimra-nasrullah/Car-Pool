import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_view/home_view.dart';
import 'starting_view.dart';

class OptionsView extends StatelessWidget {
  const OptionsView({super.key});

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
              text: "Intercity Ride",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomeView()));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            PortalOption(
              text: "Intracity Ride",
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
