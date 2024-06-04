import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'starting_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const StartingView()),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/splash.png",
                height: 350,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Ride Share",
                style: GoogleFonts.poppins(
                  color: const Color(0xffA786AC),
                  fontSize: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
