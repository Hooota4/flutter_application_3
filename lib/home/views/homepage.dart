import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/auth/controller/auth.dart';
import 'package:flutter_application_3/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake =
      CameraPosition(bearing: 192.8334901395799, target: LatLng(37.43296265331129, -122.08832357078792), tilt: 59.440717697143555, zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agar City"),
        actions: [
          IconButton(onPressed: () => showSearch(context: context, delegate: DataSearch()), icon: const Icon(Icons.search)),
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
                          "${user?.first_name.split("")[0].toUpperCase()}${user?.forth_name.split("")[0].toUpperCase()}",
                        ),
                      ),
                      accountName: Text("${user?.first_name} ${user?.forth_name}"),
                      accountEmail: Text(user?.email ?? ""),
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
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.of(context).pushNamed("createadver");

          //AIzaSyA82wrHtFFlNplOtlmzB-d0UeljkhZrWQ
        },
        child: const Icon(Icons.add),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        zoomControlsEnabled: false,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}

class DataSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = "", icon: const Icon(Icons.close)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // ignore: unnecessary_const
    return const Center(child: Text("محتوى الصفحة"));
  }
}
