import 'package:dio/dio.dart';
import 'package:dpis_app/home.dart';
import 'package:dpis_app/option_pg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

var userToken;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  userToken = sharedPreferences.getString("userToken");
  print(userToken);
//I did this to lock the app in portrait mode
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chop',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // initialRoute: userToken == null ? '/landingPage' : '/nav',
      initialRoute: (userToken == null)
          ? '/login'
          : (userToken != null) ? '/home' : '/login',
      // home: if(userToken == null && vendorToken == null){ LandingPage()}
      routes: {
        '/login': (context) => Firstpg(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
