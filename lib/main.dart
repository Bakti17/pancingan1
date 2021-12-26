import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pancingan1/akun.dart';
import 'package:pancingan1/akunEdit.dart';
import 'package:pancingan1/homepage.dart';
import 'package:pancingan1/login.dart';
import 'package:pancingan1/register.dart';
import 'package:pancingan1/transaksi.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body: LoginPage(),
      ),
    );
  }
}