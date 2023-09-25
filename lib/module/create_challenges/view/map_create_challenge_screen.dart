import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/core/utils/services/storage.dart';
import 'package:global_online/module/_main/controller/main_controller.dart';
import 'package:global_online/module/create_challenges/controller/create_challenge_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapCreateScreen extends StatefulWidget {
  const MapCreateScreen({super.key});

  @override
  State<MapCreateScreen> createState() => _MapCreateScreenState();
}

class _MapCreateScreenState extends State<MapCreateScreen> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  Set<Marker> _markers = Set<Marker>();

  void _setMarker(LatLng point) {
    final String marker = 'marker';
    setState(() {
      _markers.add(Marker(markerId: MarkerId(marker), position: point));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Select Location',
          style: getBoldStyle(color: Colors.black, fontSize: 18),),
      ),
      body: GetBuilder<CreateChallengeController>(builder: (logic) {
        return GoogleMap(initialCameraPosition:
         CameraPosition(target: LatLng(Get.find<MainController>().myLocation?.latitude??  34.451859,Get.find<MainController>().myLocation?.longitude??  34.451859), zoom: 20),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          onTap: (LatLng latLng) {
            _setMarker(latLng);
            logic.setLocation(latLng);
          },
          markers: _markers,
        );
      }),
    );
  }
}
