import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:dpis_app/Admin/getstudnum_modesl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Getnumreq {
  Future<GetStudNumModel> getStudNum() async {
    var token;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("userToken");
    var uri = "https://dpis-api.herokuapp.com/getStudNum";
    print(uri);
    try {
      final response =
          await http.get(uri, headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.statusCode);
        print(response.body);
        var jsonData = json.decode(response.body);
        return GetStudNumModel.fromJson(jsonData);
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
