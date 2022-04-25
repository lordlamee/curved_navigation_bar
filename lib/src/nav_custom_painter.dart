import 'package:flutter/material.dart';

class NavCustomPainter extends CustomPainter {
  late double loc;
  late double s;
  Color color;
  TextDirection textDirection;

  NavCustomPainter(
      double startingLoc, int itemsLength, this.color, this.textDirection) {
    final span = 1.0 / itemsLength;
    s = 0.2;
    double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.9 - l : l;
  }

  @override
  void paint(Canvas canvas, Size size) {
    print(loc);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, 13)
      ..arcToPoint(
        Offset(13, 0),
        radius: Radius.circular(13),
      )
      ..lineTo((loc + 0.025) * size.width, 0)
      ..arcToPoint(
        Offset(((loc + 0.025) * size.width) + 20, 20),
        radius: Radius.circular(20),
        clockwise: false,
      )
      ..lineTo(
        ((loc + 0.025) * size.width) + 40,
        20,
      )
      ..arcToPoint(
        Offset(((loc + 0.025) * size.width) + 60, 0),
        radius: Radius.circular(20),
        clockwise: false,
      )
      ..lineTo(size.width - 13, 0)
      ..arcToPoint(
        Offset(size.width, 13),
        radius: Radius.circular(13),
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
