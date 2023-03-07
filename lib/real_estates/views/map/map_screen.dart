import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/common/widgets/async_value_widget.dart';
import 'package:flutter_application_3/real_estates/controllers/real_estate_controller.dart';
import 'package:flutter_application_3/real_estates/models/real_estate_model.dart';
import 'package:flutter_application_3/real_estates/views/real_estate_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  BitmapDescriptor home = BitmapDescriptor.defaultMarker;

  Future<BitmapDescriptor> setCustomMarkerIcon(IconData iconData, Color color, int fontSize) async {
    final pictureRecorder = PictureRecorder();
    final canvas = Canvas(pictureRecorder);
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    final iconStr = String.fromCharCode(iconData.codePoint);

    textPainter.text = TextSpan(
      text: iconStr,
      style: TextStyle(
        letterSpacing: 0.0,
        fontSize: fontSize.toDouble(),
        fontFamily: iconData.fontFamily,
        color: color,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, const Offset(0.0, 0.0));

    final picture = pictureRecorder.endRecording();
    final image = await picture.toImage(fontSize, fontSize);
    final bytes = await image.toByteData(format: ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());
  }

  generateIcons() async {
    home = await setCustomMarkerIcon(Icons.home, Colors.black, 90);
  }

  @override
  void initState() {
    super.initState();
    generateIcons();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final realEstatesListValue = ref.watch(realEstatesListStreamProvider);
      // log(realEstatesListValue.value.toString());

      return AsyncValueWidget<List<RealEstateModel>>(
        value: realEstatesListValue,
        data: (realEstates) => GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: const CameraPosition(
            target: LatLng(15.507802838803425, 32.56690878421068),
            zoom: 11,
          ),
          markers: {
            ...?realEstates?.map((e) {
              return Marker(
                markerId: MarkerId(e.id.toString()),
                icon: home,
                infoWindow: InfoWindow(title: e.title, snippet: e.description),
                position: LatLng.fromJson(jsonDecode(e.location))!,
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => RealEstateDetailsScreen(id: e.id),
                ),
              );
            })
          },
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      );
    });
  }
}
