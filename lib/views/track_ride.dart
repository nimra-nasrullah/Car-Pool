import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/left_menu_customer.dart';
import '../components/my_button.dart';
import 'driver_details_view/driver_details_view.dart';
import 'map_view/map_view.dart';

class TrackRide extends StatefulWidget {
  const TrackRide({super.key});

  @override
  State<TrackRide> createState() => _TrackRideState();
}

class _TrackRideState extends State<TrackRide> {
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      context: context,
      builder: (context) => BottomSheetForRD(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Track Ride"),
        centerTitle: true,
        foregroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LeftRightLayoutScreen()));
          },
          child: Image.asset(
            "assets/menu.png",
            height: 16,
          ),
        ),
      ),
      body: Stack(
        children: [
          const MapView(),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 150,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(80, 200, 120, 1),
                  ),
                  onPressed: () {
                    _showBottomSheet(context);
                  },
                  child: const Text("Ride Details",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheetForRD extends StatelessWidget {
  const BottomSheetForRD({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Your Child's Current Location",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset("assets/green.png"),
              const SizedBox(
                width: 10,
              ),
              Text(
                "24.862194, 67.070334",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset("assets/white.png"),
              const SizedBox(
                width: 10,
              ),
              RichText(
                text: TextSpan(
                  text: "Estimated arrival time: ",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffA5A5A5),
                  ),
                  children: const [
                    TextSpan(
                        text: "20 minutes",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          MyButton(
            text: "Driver Details",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DriverDetailsView()));
            },
          ),
        ],
      ),
    );
  }
}
