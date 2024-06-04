import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../components/custom_drawer.dart';
import '../map_view/map_view.dart';
import 'bottom_sheet_with_options.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      context: context,
      builder: (context) => const BottomSheetWithOptions(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Ride Share"),
        centerTitle: true,
        foregroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            // Open the side panel when the image is clicked
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Image.asset(
            "assets/menu.png",
            height: 16,
          ),
        ),
      ),
      drawer: const CustomDrawer(),
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
                  child: const Text("Book Ride",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.location_searching),
        backgroundColor: const Color(0xff50C878),
      ),
    );
  }
}
