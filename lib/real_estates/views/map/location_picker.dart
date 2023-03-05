import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({super.key});

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  bool isNotified = false;

  late final Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 60), (timer) {
      setState(() => isNotified = false);
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: const CameraPosition(target: LatLng(15.507802838803425, 32.56690878421068), zoom: 11),
      onTap: (argument) {
        if (!isNotified) Fluttertoast.showToast(msg: "Press for long time to pick the location");
        setState(() => isNotified = true);
      },
      onLongPress: (argument) => Navigator.pop(context, argument),
      onMapCreated: (GoogleMapController controller) => _controller.complete(controller),
    );
  }
}
