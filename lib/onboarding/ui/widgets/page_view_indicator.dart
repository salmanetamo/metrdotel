import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class PageViewIndicator extends StatefulWidget {
  final PageController controller;
  final int itemCount;
  final Color color;

  const PageViewIndicator({
    Key? key,
    required this.controller,
    required this.itemCount,
    required this.color,
  }) : super(key: key);

  @override
  _PageViewIndicatorState createState() => _PageViewIndicatorState();
}

class _PageViewIndicatorState extends State<PageViewIndicator> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: IndicatorPainter(
        widget.itemCount,
        widget.controller.page?.floor() ?? -1,
        color: widget.color,
      ),
      child: Container(
        width: 60,
        height: 48,
      ),
    );
  }
}

class IndicatorPainter extends CustomPainter {
  final Color color;
  final int length;
  final int currentIndicator;

  Paint dotPaint;
  static const double _smallDot = 4;
  static const double _bigDot = 7;

  IndicatorPainter(this.length, this.currentIndicator,
      {this.color = Colors.black})
      : dotPaint = Paint()..color = color;

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < this.length; i++) {
      _drawCircle(canvas, i,
          Offset(i * (size.width / this.length - 1), size.height / 2));
    }
  }

  _drawCircle(Canvas canvas, int indicatorNumber, Offset offset) {
    Paint inactiveDotPaint = Paint()..color = Color(0xFFC9C9C9);
    (indicatorNumber == currentIndicator + 1)
        ? canvas.drawCircle(offset, _bigDot, dotPaint)
        : canvas.drawCircle(offset, _smallDot, inactiveDotPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
