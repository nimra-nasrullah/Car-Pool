import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapView extends StatefulWidget {
  const MapView({
    super.key,
  });

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {

  Location _locationController = new Location();

  static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);
  static const LatLng _pApplePark = LatLng(37.3346, -122.0090);

  LatLng? _currentPosition = null;

  Future<void> getLocationUpdates () async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();

    if(_serviceEnabled){
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    _permissionGranted = await _locationController.hasPermission();

    if(_permissionGranted == PermissionStatus.denied){
      _permissionGranted = await _locationController.requestPermission();
      if(_permissionGranted != PermissionStatus.granted){
        return;
      }
    }

    _locationController.onLocationChanged.listen((LocationData currentLocation) {
      if(currentLocation.latitude != null && currentLocation.longitude != null){
        setState(() {
          _currentPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
          print(_currentPosition);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return _currentPosition == null ? const Center(child: Text("Loading..."),) : GoogleMap(
      initialCameraPosition: CameraPosition(target: _pGooglePlex, zoom: 11),
      markers: {
        Marker(
          markerId: MarkerId("_currentLocation"),
          icon: BitmapDescriptor.defaultMarker,
          position: _currentPosition!,
        ),
        Marker(
          markerId: MarkerId("_sourceLocation"),
          icon: BitmapDescriptor.defaultMarker,
          position: _pGooglePlex,
        ),
        Marker(
          markerId: MarkerId("_destinationLocation"),
          icon: BitmapDescriptor.defaultMarker,
          position: _pApplePark,
        ),
      },
    );
  }
}