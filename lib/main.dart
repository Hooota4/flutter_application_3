import 'package:flutter/material.dart';
import 'package:flutter_application_3/auth/controller/auth.dart';
import 'package:flutter_application_3/home/homepage.dart';
import 'package:flutter_application_3/real_estates/views/create_advertisement.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth/views/login_screen.dart';
import 'auth/views/singup_screen.dart';
import 'splash/splash_screen.dart';

late SharedPreferences pref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();
  final container = ProviderContainer();

  final token = container.read(authCacheProvider).token;

  runApp(ProviderScope(child: MyApp(token: token)));
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({Key? key, this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      theme: ThemeData(useMaterial3: true),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
          menuStyle: MenuStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.grey.shade900),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: token == null ? "login" : "homepage",
      routes: {
        "splash": (context) => const SplashScreen(),
        "login": (context) => const Login(),
        "singup": (context) => const SingUp(),
        "homepage": (context) => const HomePage(),
        "createadver": (context) => const CreateAdvertisement(),
      },
    );
  }
}
//google_maps_flutter: ^1.2.0
