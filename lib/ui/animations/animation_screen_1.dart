import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationScreen1 extends StatefulWidget {
  const AnimationScreen1({super.key});

  @override
  State<AnimationScreen1> createState() => _AnimationScreen1State();
}

class _AnimationScreen1State extends State<AnimationScreen1>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation = Tween<double>(begin: 0, end: 4 * pi).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
        reverseCurve: Curves.bounceIn))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {});
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Animation 1",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Transform.rotate(
          angle: animation.value,
          child: Container(
            width: 100.w,
            height: 100.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.blueAccent
            ),

          ),
        ),
      ),
    );
  }
}
