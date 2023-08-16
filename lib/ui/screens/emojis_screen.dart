import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmojisScreen extends StatefulWidget {
  const EmojisScreen({super.key});

  @override
  State<EmojisScreen> createState() => _EmojisScreenState();
}

class _EmojisScreenState extends State<EmojisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Emojis Screen",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Lato"),
        ),
        centerTitle: true,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.grey.shade200,
                    ),
                    child: CustomPaint(
                      size: Size(100.w, 150.h),
                      painter: VerySadSmilePainter(),
                    ),
                  ),
                  SizedBox(width: 20.w,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.grey.shade200,
                    ),
                    child: CustomPaint(
                      size: Size(100.w, 150.h),
                      painter: SadSmilePainter(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VerySadSmilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    Rect rect = Offset(38, 75) & const Size(30, 30);
    const startAngle = pi;
    final paint2 = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    canvas.drawArc(rect, startAngle, pi, false, paint2);

    var path = Path();
    var path2 = Path();

    var eye1 = Paint()
      ..color = Colors.red
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var eye2 = Paint()
      ..color = Colors.red
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    path.moveTo(28, 60);
    path.lineTo(44, 55);

    path2.moveTo(58, 55);
    path2.lineTo(74, 60);

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 40.w, paint);
    canvas.drawPath(path, eye1);
    canvas.drawPath(path2, eye2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class SadSmilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;


    Rect rect2 = Offset(18, 40) & const Size(30, 20);
    const startAngle2 = 0.5;
    final paint3 = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;

    canvas.drawArc(rect2, startAngle2, pi-2, false, paint3);

    Rect rect3 = Offset(60, 40) & const Size(30, 20);
    const startAngle3 = 1.5;
    final paint4 = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;

    canvas.drawArc(rect3, startAngle3, pi-2, false, paint4);

    Rect rect = Offset(33, 80) & const Size(40, 20);
    const startAngle = pi+0.3;
    final paint2 = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;

    canvas.drawArc(rect, startAngle, pi-0.6, false, paint2);

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 40.w, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
