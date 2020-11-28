import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dpis_app/Widgets/loader.dart';
import 'package:dpis_app/core/api/api.dart';
import 'package:dpis_app/core/api/endpoints.dart';
import 'package:flutter/material.dart';

import '../toasts.dart';

class NoteRequests {
  var _loader = Loader();
  Future<String> uploadnote(
      String subject, clss, topic, File note, context) async {
    var dio = Dio();
    var _loader = Loader();
    var url = Api.$BASE_URL + Endpoints.uploadnotes;

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
        'subject': subject,
        'topic': topic,
        'clss': clss,
        "noteimg": await MultipartFile.fromFile(note.path, filename: filename)
      });
      print(formData.fields.toString());
      var jsonResponse;
      var response = await dio.post(url, data: formData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.statusCode);
        _loader.hide(context);
        // jsonResponse = json.decode(response.data);
        // if (jsonResponse != null) {
        showToast('Note uploaded Sucessfuly', Colors.green);
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
}
