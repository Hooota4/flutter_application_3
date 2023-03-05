import 'package:flutter/material.dart';
import 'package:flutter_application_3/auth/controller/auth.dart';
import 'package:flutter_application_3/auth/views/profile_screen.dart';
import 'package:flutter_application_3/common/constants.dart';
import 'package:flutter_application_3/real_estates/views/map/map_screen.dart';
import 'package:flutter_application_3/real_estates/views/my_real_estate_screen.dart';
import 'package:flutter_application_3/real_estates/views/search/search_real_state_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int currentPageIndex = 0;

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
      drawer: Drawer(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: currentPageIndex == 0
          ? FloatingActionButton(
              // backgroundColor: Colors.blue,
              onPressed: () => Navigator.of(context).pushNamed("createadver"),
              child: const Icon(Icons.add),
            )
          : null,
      body: <Widget>[
        const MapScreen(),
        const MyRealEstatesScreen(),
        const ProfileScreen(),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) => setState(() => currentPageIndex = index),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.map), label: 'Map'),
          NavigationDestination(icon: Icon(Icons.domain), label: 'My Real Estates'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}
