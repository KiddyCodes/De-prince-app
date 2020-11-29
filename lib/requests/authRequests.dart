import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dpis_app/Admin/adminHome.dart';
import 'package:dpis_app/Widgets/loader.dart';
import 'package:dpis_app/core/api/api.dart';
import 'package:dpis_app/core/api/endpoints.dart';
import 'package:dpis_app/staff/staff_model.dart';
import 'package:dpis_app/staffhome.dart';
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

  Future<String> studentSignUp(String name, email, password, phonenumber, age,
      clss, vcode, course, File staffimg, context) async {
    var dio = Dio();
    var _loader = Loader();
    var url = Api.$BASE_URL + Endpoints.studentSignup;

    // if (name == "" &&
    //     email == "" &&
    //     password == "" &&
    //     phonenumber == "" &&
    //     subject == "" &&
    //     staffId == "") {
    //   return;
    // }
    try {
      _loader.show(context, 'Please wait...');
      var filename = staffimg.path.split('/').last;
      FormData formData = FormData.fromMap({
        'studentName': name,
        'email': email,
        'password': password,
        'phonenumber': phonenumber,
        'vcode': vcode,
        'Course': course,
        'age': age,
        'class': clss,
        "image": await MultipartFile.fromFile(staffimg.path, filename: filename)
      });
      print(formData.fields.toString());
      var jsonResponse;
      var response = await dio.post(url, data: formData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.statusCode);
        _loader.hide(context);
        // jsonResponse = json.decode(response.data);
        // if (jsonResponse != null) {
        showToast('Student Account created successfully, Log In', Colors.green);
        // sharedPreferences.setString("firstToken", jsonResponse['result']);

      } else if (response.statusCode == 403) {
        showToast('Student already exist!', Colors.red);
        _loader.hide(context);
        print(response.data);
      } else if (response.statusCode == 503) {
        showToast('Internal Server Error, please try again later', Colors.red);
        _loader.hide(context);
        print(response.data);
      } else {
        print(response.statusCode);
        print(jsonResponse);
        showToast('Error encountered, please try again', Colors.red);
        _loader.hide(context);
        print(response.data);
      }
      // print(userToken);
    } catch (e) {
      _loader.hide(context);

      // print(e);
      showToast(e.toString(), Colors.red);
    }
  }

  //------------ STAFF AUTH--------------//

  // ignore: missing_return
  Future<StaffData> staffSignIn(String staffId, password, context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Api.$BASE_URL + Endpoints.staffLogin;
    _loader.show(context, 'Please wait...');

    // if (email == "" && password == "") {
    //   return;
    // }

    Map data = {'staffId': staffId, 'password': password};

    var jsonResponse;
    var response = await http.post(url, body: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      _loader.hide(context);

      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        SharedPref().save("staffData", jsonResponse);

        //save response
        await sharedPreferences.setString("staffToken", jsonResponse["token"]);
        await sharedPreferences.setString(
            "staffName", jsonResponse["staffName"]);
        await sharedPreferences.setString("email", jsonResponse["email"]);
        await sharedPreferences.setString("image", jsonResponse["image"]);
        await sharedPreferences.setString(
            "phoneNumber", jsonResponse["phonenumber"]);
        print(jsonResponse);
        //push to home
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => StaffHome()),
            (Route<dynamic> route) => false);
        showToast('Login Successful', Colors.green);
      }
    } else if (response.statusCode == 403) {
      showToast('Staff does not exist!', Colors.red);
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

  Future<String> staffSignUp(String name, email, password, phonenumber, staffId,
      subject, File staffimg, context) async {
    var dio = Dio();
    var _loader = Loader();
    var url = Api.$BASE_URL + Endpoints.staffSignup;

    // if (name == "" &&
    //     email == "" &&
    //     password == "" &&
    //     phonenumber == "" &&
    //     subject == "" &&
    //     staffId == "") {
    //   return;
    // }
    try {
      _loader.show(context, 'Please wait...');
      var filename = staffimg.path.split('/').last;
      FormData formData = FormData.fromMap({
        'staffName': name,
        'email': email,
        'password': password,
        'phonenumber': phonenumber,
        'staffId': staffId,
        'subject': subject,
        "image": await MultipartFile.fromFile(staffimg.path, filename: filename)
      });
      print(formData.fields.toString());
      var jsonResponse;
      var response = await dio.post(url, data: formData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.statusCode);
        _loader.hide(context);
        // jsonResponse = json.decode(response.data);
        // if (jsonResponse != null) {
        showToast('Staff Account created successfully, Log In', Colors.green);
        // sharedPreferences.setString("firstToken", jsonResponse['result']);

      } else if (response.statusCode == 403) {
        showToast('Staff already exist!', Colors.red);
        _loader.hide(context);
        print(response.data);
      } else if (response.statusCode == 503) {
        showToast('Internal Server Error, please try again later', Colors.red);
        _loader.hide(context);
        print(response.data);
      } else {
        print(response.statusCode);
        print(jsonResponse);
        showToast('Error encountered, please try again', Colors.red);
        _loader.hide(context);
        print(response.data);
      }
      // print(userToken);
    } catch (e) {
      _loader.hide(context);

      // print(e);
      showToast(e.toString(), Colors.red);
    }
  }

  //-----------ADMIN AUTH----------//
  adminSignIn(String adminName, password, context) async {
    var url = Api.$BASE_URL + Endpoints.authAdmin;
    _loader.show(context, 'Please wait...');

    // if (email == "" && password == "") {
    //   return;
    // }

    Map data = {'adminName': adminName, 'password': password};

    var jsonResponse;
    var response = await http.post(url, body: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      _loader.hide(context);

      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        //push to home
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => AdminHome()),
            (Route<dynamic> route) => false);
        showToast('Login Successful', Colors.green);
      }
    } else if (response.statusCode == 403) {
      showToast('Admin does not exist!', Colors.red);
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
