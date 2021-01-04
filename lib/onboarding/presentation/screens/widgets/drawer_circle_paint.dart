import 'package:flutter/material.dart';

class DrawerCirclePaint extends CustomPainter {
  final Color color;
  final Paint curvePaint;

  DrawerCirclePaint({
    this.color = Colors.black,
  }) : curvePaint = Paint()
          ..color = color
          ..style = PaintingStyle.fill
          ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    // print(size.width / 2 + size.width / 4);

    canvas.drawCircle(center, size.width / 2 + size.width / 4, curvePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
