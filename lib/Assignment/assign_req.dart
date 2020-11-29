import 'dart:convert';
import 'dart:io';
import 'package:dpis_app/Assignment/assign_Model.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:dpis_app/Widgets/loader.dart';
import 'package:dpis_app/core/api/api.dart';
import 'package:dpis_app/core/api/endpoints.dart';
import 'package:dpis_app/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../toasts.dart';

class AssRequests {
  var _loader = Loader();
  uploadassignment(String subject, clss, topic, question, context) async {
    var _loader = Loader();
    var url = Api.$BASE_URL + Endpoints.uploadAss;

    if (subject == "" && clss == "" && topic == "" && question == "") {
      return;
    }

    _loader.show(context, 'Please wait while we upload...');
    Map data = {
      'subject': subject,
      'clss': clss,
      'topic': topic,
      'Questions': question,
    };
    var jsonResponse;
    var response = await http.post(url, body: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      _loader.hide(context);
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        print(jsonResponse);
        showToast('Assignment posted sucessfuly', Colors.green);
      }
    } else if (response.statusCode == 503) {
      showToast('Internal Server Error, please try again later', Colors.red);
      _loader.hide(context);
      print(response.body);
    } else {
      showToast('Error encountered, please try again', Colors.red);
      _loader.hide(context);
      print(response.body);
    }
    // print(userToken);
  }

  Future<GetAssignmentModel> getnassignmentreq() async {
    var token;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("userToken");
    var uri =
        "https://dpis-api.herokuapp.com/getassignment/${studentLoad.studentClass}";
    print(uri);
    try {
      final response =
          await http.get(uri, headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.statusCode);
        print(response.body);
        var jsonData = json.decode(response.body);
        return GetAssignmentModel.fromJson(jsonData);
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
