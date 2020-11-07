import 'dart:convert';

import 'package:dpis_app/Widgets/loader.dart';
import 'package:dpis_app/core/api/api.dart';
import 'package:dpis_app/core/api/endpoints.dart';
import 'package:dpis_app/student/sharedprf.dart';
import 'package:dpis_app/student/student.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../home.dart';
import '../toasts.dart';

class AuthRequests {
  var _loader = Loader();

  // ignore: missing_return
  Future<UserData> userSignIn(String vcode, password, context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Api.$BASE_URL + Endpoints.studentLogin;
    _loader.show(context, 'Please wait...');

    // if (email == "" && password == "") {
    //   return;
    // }

    Map data = {'vcode': vcode, 'password': password};

    var jsonResponse;
    var response = await http.post(url, body: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      _loader.hide(context);

      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        SharedPref().save("userData", jsonResponse);

        //save response
        await sharedPreferences.setString("userToken", jsonResponse["token"]);
        await sharedPreferences.setString(
            "studentName", jsonResponse["studentName"]);
        await sharedPreferences.setString("email", jsonResponse["email"]);
        await sharedPreferences.setString(
            "phoneNumber", jsonResponse["phonenumber"]);
        await sharedPreferences.setString("class", jsonResponse["class"]);
        await sharedPreferences.setString("vcode", jsonResponse["vcode"]);
        await sharedPreferences.setString("Course", jsonResponse["Course"]);
        print(jsonResponse);
        //push to home
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
            (Route<dynamic> route) => false);
        showToast('Login Successful', Colors.green);
      }
    } else if (response.statusCode == 403) {
      showToast('Student does not exist!', Colors.red);
      _loader.hide(context);
      print(response.body);
    } else if (response.statusCode == 404) {
      showToast('Wrong password,Please try again!', Colors.red);
      _loader.hide(context);
      print(response.body);
    } else if (response.statusCode == 503) {
      showToast('Internal Error, please try again later', Colors.red);
      _loader.hide(context);
      print(response.body);
    } else {
      _loader.hide(context);
      print(response.body);
      print(response.statusCode);
    }
  }
}
