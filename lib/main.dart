import 'package:dio/dio.dart';
import 'package:dpis_app/home.dart';
import 'package:dpis_app/option_pg.dart';
import 'package:dpis_app/staffhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

var userToken;
var staffToken;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  userToken = sharedPreferences.getString("userToken");
  staffToken = sharedPreferences.getString("staffToken");
  print(userToken);
  print(staffToken);
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
      title: 'DPIS',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // initialRoute: userToken == null ? '/landingPage' : '/nav',
      initialRoute: (userToken == null && staffToken == null)
          ? '/login'
          : (userToken != null && staffToken == null)
              ? '/home'
              : (userToken == null && staffToken != null)
                  ? '/staffhome'
                  : '/login',
      // home: if(userToken == null && vendorToken == null){ LandingPage()}
      routes: {
        '/login': (context) => Firstpg(),
        '/home': (context) => HomeScreen(),
        '/staffhome': (context) => StaffHome()
      },
    );
  }
}
