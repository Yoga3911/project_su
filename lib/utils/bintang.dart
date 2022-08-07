import 'package:flutter/material.dart';
import 'package:project/constants/color.dart';

class Bintang extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = MyColor.blue2
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    Path path0 = Path();
    path0.moveTo(size.width * 0.4980333, size.height * 0.0088667);
    path0.lineTo(size.width * 0.3333667, size.height * 0.3342000);
    path0.lineTo(size.width * 0.0033333, size.height * 0.4933333);
    path0.lineTo(size.width * 0.3266667, size.height * 0.6666667);
    path0.lineTo(size.width * 0.5000333, size.height);
    path0.lineTo(size.width * 0.6666667, size.height * 0.6700000);
    path0.lineTo(size.width * 0.9933333, size.height * 0.4966667);
    path0.lineTo(size.width * 0.6733333, size.height * 0.3333333);
    path0.lineTo(size.width * 0.4980333, size.height * 0.0088667);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
