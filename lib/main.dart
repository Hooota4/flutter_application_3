import 'package:flutter_application_3/add/CreateAdver.dart';
import 'package:flutter_application_3/autho/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/autho/singup.dart';
import 'package:flutter_application_3/home/homepage.dart';
// ignore: duplicate_import
import 'package:flutter_application_3/add/CreateAdver.dart';
// ignore: unused_import
import 'package:flutter_application_3/Admin/LoginAdmin.dart';
void main() {
  runApp(const MyApp());
}
   
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: const Login(),
     debugShowCheckedModeBanner: false,
     routes:{
           "login" : (context) => const Login(),
            "singup" : (context) => const SingUp(),
            "homepage" : (context) => const HomePage(),
            "createadver" : (context) => const CreateAdver(), 
     } ,
    );
  }
}
//google_maps_flutter: ^1.2.0

        

    

  

