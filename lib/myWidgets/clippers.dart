import 'package:flutter/material.dart';

//This is where i clipped my container

class HomeClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.25);
    path.cubicTo(0, size.height * 0.29, size.width * 0.08, size.height * 0.40,
        size.width * 0.08, size.height * 0.4);
    path.cubicTo(size.width * 0.17, size.height * 0.52, size.width / 2,
        size.height * 0.76, size.width / 1, size.height * 0.88);
    path.cubicTo(size.width * 10, size.height, size.width * 0.80, size.height,
        size.width * 0.92, size.height);
    path.cubicTo(size.width * 0.92, size.height, size.width, size.height,
        size.width, size.height);
    path.cubicTo(size.width, size.height, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width * 0.92, 0, size.width * 0.9, 0);
    path.cubicTo(size.width * 0.83, 0, size.width * 0.67, 0, size.width / 2, 0);
    path.cubicTo(size.width / 3, 0, size.width * 0.17, 0, size.width * 0.08, 0);
    path.cubicTo(size.width * 0.08, 0, 0, 0, 0, 0);
    path.cubicTo(0, 0, 0, size.height * 0.29, 0, size.height * 0.29);
    path.cubicTo(
        0, size.height * 0.29, 0, size.height * 0.29, 0, size.height * 0.29);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
