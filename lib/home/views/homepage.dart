import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/auth/controller/auth.dart';
import 'package:flutter_application_3/common/widgets/async_value_widget.dart';
import 'package:flutter_application_3/constants.dart';
import 'package:flutter_application_3/real_estates/controllers/real_estate_controller.dart';
import 'package:flutter_application_3/real_estates/models/real_estate_model.dart';
import 'package:flutter_application_3/real_estates/views/search/search_real_state_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  double zoomLevel = 11;
  BitmapDescriptor home = BitmapDescriptor.defaultMarker;

  generateIcons() async {
    home = await setCustomMarkerIcon(Icons.home, Colors.black, 90);
  }

  @override
  void initState() {
    super.initState();
    generateIcons();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agar City"),
        actions: [
          IconButton(
            onPressed: () => showDialog(context: context, builder: (context) => const SearchScreen()),
            icon: const Icon(Icons.search),
          )
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              Column(
                children: [
                  Consumer(builder: (context, ref, child) {
                    final user = ref.read(authControllerProvider).user;

                    return UserAccountsDrawerHeader(
                      currentAccountPicture: CircleAvatar(
                        child: Text(
                          "${user?.firstName.split("")[0].toUpperCase()}${user?.forthName.split("")[0].toUpperCase()}",
                        ),
                      ),
                      accountName: Text(
                        "${user?.firstName} ${user?.forthName}",
                        style: const TextStyle(color: Colors.deepPurpleAccent),
                      ),
                      accountEmail: Text(
                        user?.email ?? "",
                        style: const TextStyle(color: Colors.deepPurpleAccent),
                      ),
                    );
                  }),
                  ListTile(
                    title: const Text("All"),
                    onTap: () {},
                  ),
                  ...estatesTypes.map(
                    (estates) => ListTile(
                      title: Text(estates),
                      onTap: () {},
                    ),
                  ),
                  Consumer(builder: (context, ref, child) {
                    return ListTile(
                      title: const Text("Log out "),
                      leading: const Icon(Icons.exit_to_app),
                      onTap: () {
                        ref.read(authControllerProvider.notifier).logout();
                        Navigator.of(context).pushReplacementNamed("login");
                      },
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Colors.blue,
        onPressed: () => Navigator.of(context).pushNamed("createadver"),
        child: const Icon(Icons.add),
      ),
      body: Consumer(builder: (context, ref, child) {
        final realEstatesListValue = ref.watch(realEstatesListStreamProvider);
        log(realEstatesListValue.value.toString());
        return AsyncValueWidget<List<RealEstateModel>>(
            value: realEstatesListValue,
            data: (realEstates) => GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: const LatLng(15.507802838803425, 32.56690878421068),
                    zoom: zoomLevel,
                  ),
                  markers: {
                    ...realEstates.map((e) {
                      return Marker(
                        markerId: MarkerId(e.id.toString()),
                        icon: home,
                        infoWindow: InfoWindow(title: e.title, snippet: e.description),
                        position: LatLng.fromJson(jsonDecode(e.location))!,
                      );
                    })
                  },
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ));
      }),
    );
  }
}

// class DataSearch extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(onPressed: () => query = "", icon: const Icon(Icons.close)),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () => close(context, null),
//       icon: const Icon(Icons.arrow_back),
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Container();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return Container();
//   }

  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   var realEstates = const [
  //     RealEstateModel(
  //       addvertiser: 13,
  //       estate_name: "real estate 1",
  //       estate_description: "this is a description",
  //       owner_national_number: "456456456456456",
  //       estate_type: "شقة إيجار",
  //       number_of_facilities: "5",
  //       state: "state",
  //       city: "city",
  //       location: " [15.137548603853979, 32.73017216473818]",
  //       price: "45",
  //       optional_details: null,
  //       estate_status: "Waitting",
  //       estate_image1: "None/f09366ac-edb6-40fd-8f6b-77295c8d550b7199245491276731618.jpg",
  //       estate_image2: "None/f09366ac-edb6-40fd-8f6b-77295c8d550b7199245491276731618.jpg",
  //       estate_image3: 'None/bf883536-f62e-4978-9e46-73b683d3876c8241473633915377197.jpg',
  //       map_location: '[15.137548603853979, 32.73017216473818]',
  //     ),
  //     RealEstateModel(
  //       addvertiser: 13,
  //       estate_name: "real estate 2",
  //       estate_description: "this is a description 2",
  //       owner_national_number: "456456456456456",
  //       estate_type: "شقة إيجار",
  //       number_of_facilities: "5",
  //       state: "state",
  //       city: "city",
  //       location: " [15.137548603853979, 32.73017216473818]",
  //       price: "45",
  //       optional_details: null,
  //       estate_status: "Waitting",
  //       estate_image1: "None/f09366ac-edb6-40fd-8f6b-77295c8d550b7199245491276731618.jpg",
  //       estate_image2: "None/f09366ac-edb6-40fd-8f6b-77295c8d550b7199245491276731618.jpg",
  //       estate_image3: 'None/bf883536-f62e-4978-9e46-73b683d3876c8241473633915377197.jpg',
  //       map_location: '[15.137548603853979, 32.73017216473818]',
  //     ),
  //     RealEstateModel(
  //       addvertiser: 13,
  //       estate_name: "real estate 3",
  //       estate_description: "this is a description3",
  //       owner_national_number: "456456456456456",
  //       estate_type: "شقة إيجار",
  //       number_of_facilities: "5",
  //       state: "state",
  //       city: "city",
  //       location: " [15.137548603853979, 32.73017216473818]",
  //       price: "45",
  //       optional_details: null,
  //       estate_status: "Waitting",
  //       estate_image1: "None/f09366ac-edb6-40fd-8f6b-77295c8d550b7199245491276731618.jpg",
  //       estate_image2: "None/f09366ac-edb6-40fd-8f6b-77295c8d550b7199245491276731618.jpg",
  //       estate_image3: 'None/bf883536-f62e-4978-9e46-73b683d3876c8241473633915377197.jpg',
  //       map_location: '[15.137548603853979, 32.73017216473818]',
  //     )
  //   ];

  //   return ListView.builder(
  //     itemCount: realEstates.length,
  //     itemBuilder: (context, index) {
  //       final realEstate = realEstates[index];
  //       return ListTile(
  //         // leading: Image(image: NetworkImage("http://192.168.1.104/${realEstate.estate_image1!}")),
  //         title: Text(realEstate.estate_name),
  //         subtitle: Text(realEstate.estate_description),
  //       );
  //     },
  //   );
  // }
// }
