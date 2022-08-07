import 'package:flutter/material.dart';
import 'package:project/constants/color.dart';

class SegiEnam extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = MyColor.blue2
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.2485750, size.height * 0.0014000);
    path0.lineTo(size.width * 0.7475000, 0);
    path0.lineTo(size.width, size.height * 0.2533500);
    path0.lineTo(size.width, size.height * 0.7492000);
    path0.lineTo(size.width * 0.7483500, size.height);
    path0.lineTo(size.width * 0.2475000, size.height);
    path0.lineTo(0, size.height * 0.7500000);
    path0.lineTo(0, size.height * 0.2550000);
    path0.lineTo(size.width * 0.2485750, size.height * 0.0014000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
