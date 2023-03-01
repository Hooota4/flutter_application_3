import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_3/Admin/LoginAdmin.dart';
import 'package:flutter_application_3/add/CreateAdver.dart';
import 'package:flutter_application_3/home/homepage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth/views/login.dart';
import 'auth/views/singup.dart';
import 'splash/splash_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      theme: ThemeData(
        //   fontFamily: GoogleFonts.lexend().fontFamily,
        //   colorScheme: ColorScheme.light().copyWith(
        //       // primary: Colors.grey,
        //       ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "splash": (context) => const SplashScreen(),
        "login": (context) => const Login(),
        "singup": (context) => const SingUp(),
        "homepage": (context) => const HomePage(),
        "createadver": (context) => const CreateAdver(),
      },
    );
  }
}
//google_maps_flutter: ^1.2.0
