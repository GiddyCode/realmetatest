import 'package:flutter/material.dart';

class CustomShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(278, 189), // Define the size of the soap shape
      painter: CustomShapePainter(),
    );
  }
}

class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.amber // Soap color
      ..style = PaintingStyle.fill;

    Path path_0 = Path();
    path_0.moveTo(16.0018,59.963);
    path_0.cubicTo(6.80182,51.963,1.50182,34,1.00182,25.463);
    path_0.cubicTo(0.738773,21,10.0018,16.5,16.0021,13.5);
    path_0.cubicTo(21.8331,10.5846,35.0018,4.46304,55.0018,0.963045);
    path_0.cubicTo(64.2018,-1.83696,84.5018,2.12971,93.5018,4.46304);
    path_0.lineTo(93.5018,62.963);
    path_0.cubicTo(91.6685,62.463,85.4018,61.163,75.0018,59.963);
    path_0.cubicTo(64.6018,58.763,57.3351,59.463,55.0018,59.963);
    path_0.cubicTo(45.8018,61.563,36.1685,62.6297,32.5018,62.963);
    path_0.cubicTo(19.7018,62.563,16.1685,60.7964,16.0018,59.963);
    path_0.close();



    Paint paint0Fill = Paint()..style=PaintingStyle.fill;
    paint0Fill.color = Color(0xffFFC801).withOpacity(1.0);
    canvas.drawPath(path_0,paint0Fill);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}