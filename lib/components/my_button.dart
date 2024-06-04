import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatefulWidget {
  const MyButton({super.key, required this.text,this.onTap});

  final String text;
  final void Function()? onTap;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 75,
        //padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: const Color(0xff50C878),
            borderRadius: BorderRadius.circular(25)),
        child: Text(
          widget.text,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
