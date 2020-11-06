import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(dynamic message, Color color) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 3,
    backgroundColor: color,
    textColor: Colors.white,
  );
}
