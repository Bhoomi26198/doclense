import 'dart:async';

import 'package:doclense/widget/common.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatefulWidget {
  @override
  State<GoogleMaps> createState() => _ProfileState();
}

class _ProfileState extends State<GoogleMaps> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition camera =
      CameraPosition(target: LatLng(33.6844, 73.8479), zoom: 14);

  final List<Marker> _marker = const <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(33.6844, 73.8479),
        infoWindow: InfoWindow(title: "The Marker"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Google Map"),
      body: GoogleMap(
        initialCameraPosition: camera,
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
