import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/my_button.dart';
import '../track_ride.dart';

class BottomSheetWithOptions extends StatefulWidget {
  const BottomSheetWithOptions({super.key});

  @override
  State<BottomSheetWithOptions> createState() => _BottomSheetWithOptionsState();
}

class _BottomSheetWithOptionsState extends State<BottomSheetWithOptions> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: Text(
              "Select your plan",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            dense: true,
          ),
          const PlanOptions(title: "Trial", subTitle: "3 days free trial",price: "0.00",),
          const PlanOptions(title: "Junior", subTitle: "Book for 30 days",price: "5,000",),
          const PlanOptions(title: "Senior", subTitle: "Book for 6 months",price: "28,000",),

          const SizedBox(height: 10,),
          MyButton(text: "Post Request", onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const TrackRide()));
          },),
        ],
      ),
    );
  }
}

class PlanOptions extends StatefulWidget {
  const PlanOptions({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
  });

  final String title;
  final String subTitle;
  final String price;

  @override
  State<PlanOptions> createState() => _PlanOptionsState();
}

class _PlanOptionsState extends State<PlanOptions> {

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        tileColor: isSelected ? const Color(0xffA786AC).withOpacity(0.5) : Colors.white,
        leading: Image.asset(
          "assets/credit_card.png",
          height: 35,
        ),
        title: Text(
          widget.title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          widget.subTitle,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: isSelected ? Colors.black : const Color(0xffA5A5A5),
          ),
        ),
        trailing: Text("PKR ${widget.price}", style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),),
        onTap: () {
          setState(() {
            isSelected = true;
          });
        },
      ),
    );
  }
}
