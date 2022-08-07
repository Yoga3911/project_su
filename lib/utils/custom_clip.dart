import 'package:flutter/material.dart';
import 'package:project/constants/color.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..shader = const LinearGradient(
        colors: [
          MyColor.blue,
          Color(0xFF4C956C),
          Color(0xFF87D5A9),
        ],
      ).createShader(
        Rect.fromCenter(
            height: 0, width: size.width, center: Offset(size.width * 0.5, 0)),
      )
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(0, size.height * 0.7857826);
    path0.quadraticBezierTo(size.width * 0.2557506, size.height * 0.9992174,
        size.width * 0.5114758, size.height * 0.9997826);
    path0.quadraticBezierTo(size.width * 0.7681170, size.height * 1.0027391,
        size.width, size.height * 0.7840870);
    path0.lineTo(size.width, 0);
    path0.lineTo(0, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
