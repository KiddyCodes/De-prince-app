import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:dpis_app/Widgets/loader.dart';
import 'package:dpis_app/core/api/api.dart';
import 'package:dpis_app/core/api/endpoints.dart';
import 'package:dpis_app/result/resultmodel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home.dart';
import '../toasts.dart';

class ResultRequests {
  var _loader = Loader();
  Future<String> uploadresult(
      String studentName, clss, term, File note, context) async {
    var dio = Dio();
    var _loader = Loader();
    var url = Api.$BASE_URL + Endpoints.postresult;

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
      var filename = note.path.split('/').last;
      FormData formData = FormData.fromMap({
        'studentName': studentName,
        'term': term,
        'clss': clss,
        "resultimg": await MultipartFile.fromFile(note.path, filename: filename)
      });
      print(formData.fields.toString());
      var jsonResponse;
      var response = await dio.post(url, data: formData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.statusCode);
        _loader.hide(context);
        // jsonResponse = json.decode(response.data);
        // if (jsonResponse != null) {
        showToast('Result uploaded Sucessfuly', Colors.green);
        // sharedPreferences.setString("firstToken", jsonResponse['result']);
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

  Future<GetResultModel> getresultreq() async {
    var token;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("userToken");
    var uri =
        "https://dpis-api.herokuapp.com/getStudResult/${studentLoad.studentName}";
    print(uri);
    try {
      final response =
          await http.get(uri, headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.statusCode);
        print(response.body);
        var jsonData = json.decode(response.body);
        return GetResultModel.fromJson(jsonData);
      } else {
        print(response.statusCode);
        print(response.body);
      }
      print(response.statusCode);
      print(json.decode(response.body));
    } catch (e) {
      print(e);
    }
  }
}
