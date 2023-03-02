import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/auth/controller/auth.dart';
import 'package:flutter_application_3/constants.dart';
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Colors.blue,
        onPressed: () => Navigator.of(context).pushNamed("createadver"),
        child: const Icon(Icons.add),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: const LatLng(15.507802838803425, 32.56690878421068),
          zoom: zoomLevel,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          controller.getZoomLevel();
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
