import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/my_button.dart';

class DriverRating extends StatelessWidget {
  const DriverRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Rating",
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
                height: 450,
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
                      "How was your trial with Alex?",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset("assets/stars.png"),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Additional comments...",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffA5A5A5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Color(0xffDFE9F0)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Upgrade your plan!",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xffA786AC),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "Junior",
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xffF4F5F6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "Senior",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Add custom duration",
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500, color: const Color(0xff50C878)),
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
            const Align(
              alignment: Alignment.bottomCenter,
              child: MyButton(
                text: "Subscribe",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
