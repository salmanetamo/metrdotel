import 'package:flutter/material.dart';

class DrawerPaint extends CustomPainter {
  final Color curveColor;
  final Paint curvePaint;
  final double radius;

  DrawerPaint({
    this.curveColor = Colors.black,
    required this.radius
  }) : curvePaint = Paint()
          ..color = curveColor
          ..style = PaintingStyle.fill;
        

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    
    path.lineTo(0, 0);
    path.lineTo(0, size.height - (2*radius + radius/2) - 36);
    path.relativeCubicTo(0, radius/2 + radius/8, -(radius + radius/12), radius/2 , -(radius + radius/8), radius + radius/4);
    path.relativeCubicTo(0, radius - radius/4, radius + radius/12, radius/2 + radius/8, radius + radius/8, radius + radius/4);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, curvePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
