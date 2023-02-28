import 'package:flutter/material.dart';
import 'package:flutter_application_3/auth/controller/auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // rebuild the widget when the todo list changes

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Agar City',
              style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(authControllerProvider.notifier).login(
                          username: "aboidrees",
                          password: 'P@ssw0rd',
                        );

                    // ref.read(authControllerProvider.notifier).register(const User(
                    //       first_name: "first_name",
                    //       second_name: "second_name",
                    //       thired_name: "thired_name",
                    //       forth_name: "forth_name",
                    //       national_number: "456456456456456",
                    //       phone: "456456456456",
                    //       email: "email@mail.com",
                    //       username: "username",
                    //       password: "password",
                    //       state: "state",
                    //       city: "city",
                    //     ));
                    // Navigator.of(context).pushReplacementNamed("login");
                  },
                  child: Text(
                    "English",
                    style: GoogleFonts.lexend(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("login");
                  },
                  child: Text(
                    "عربي",
                    style: GoogleFonts.lexend(fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
