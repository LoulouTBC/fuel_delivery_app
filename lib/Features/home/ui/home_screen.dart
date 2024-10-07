import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _completer = Completer();
  final List<Marker> _marker = [];

  final List<Marker> _markerList = [
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(34.889026624, 35.8865940005),
      infoWindow: InfoWindow(title: "Lolo"),
    ),
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(34.8890483924, 35.88651567005),
      infoWindow: InfoWindow(title: "Lolo"),
    ),
  ];

  final CameraPosition _cameraPosition = const CameraPosition(
    target: LatLng(34.88902, 35.88659),
    zoom: 14.0,
  );

  @override
  void initState() {
    _marker.addAll(_markerList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _cameraPosition,
        onMapCreated: (controller) {
          _completer.complete(controller);
        },
        markers: Set<Marker>.of(_marker),
      ),
    );
  }
}
