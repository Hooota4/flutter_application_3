import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agar City"),
        // bottom: const TabBar(isScrollable: true, tabs: [
        //   Tab(
        //     child: Text("All"),
        //   ),
        //   Tab(
        //     child: Text("شقة إيجار"),
        //   ),
        //   Tab(
        //     child: Text("شقة بيع"),
        //   ),
        //   Tab(
        //     child: Text("بيت إيجار"),
        //   ),
        //   Tab(
        //     child: Text("بيت بيع"),
        //   ),
        //   //Tab(child: Text("فيلا إيجار"),
        //   //),
        //   //Tab(child: Text("فيلا بيع"),
        //   //),
        //   //Tab(child: Text("أرض بيع"),
        //   //),
        //   //Tab(child: Text("عمارة بيع"),
        //   //),
        //   //Tab(child: Text("محل للإيجار"),
        //   //),
        //   //Tab(child: Text("مكتب للإيجار"),
        //   //),
        // ]),

        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Column(
              children: [
                const UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 11, 101, 58),
                      child: Text("E"),
                    ),
                    accountName: Text("Ebtega osman"),
                    accountEmail: Text("ebtega2@gmail.com")),
                ListTile(
                  title: const Text("All"),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("شقة إيجار"),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("شقة بيع"),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("بيت إيجار"),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("بيت بيع"),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("فيلا إيجار"),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("فيلا بيع"),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("أرض بيع"),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("عمارة بيع"),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("محل إيجار"),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("مكتب إيجار"),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Log out "),
                  leading: const Icon(Icons.exit_to_app),
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed("login");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.of(context).pushReplacementNamed("createadver");

//AIzaSyA82wrHtFFlNplOtlmzB-d0UeljkhZrWQ
        },
        child: const Icon(Icons.add),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
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
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // ignore: unnecessary_const
    return const Center(
      child: const Text("محتوى الصفحة"),
    );
  }
}
