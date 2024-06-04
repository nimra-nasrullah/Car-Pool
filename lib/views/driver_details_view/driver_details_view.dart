import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/my_button.dart';
import 'driver_rating.dart';

class DriverDetailsView extends StatelessWidget {
  const DriverDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Your Driver",
          style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Stack(
          children: [
            Positioned(
              top: 70,
              left: 0,
              right: 0,
              child: Container(
                height: 360,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Alex Robin",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Toyota Carolla - ",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff585858),
                        ),
                        children: const [
                          TextSpan(
                              text: "HG5045",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "You been assigned a driver!",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your 15 days trial will start now",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xffA5A5A5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Image.asset("assets/driver_image.png"),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MyButton(
                text: "Awesome",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DriverRating()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
