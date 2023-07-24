import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AnimationScreen7 extends StatefulWidget {
  const AnimationScreen7({super.key});

  @override
  State<AnimationScreen7> createState() => _AnimationScreen7State();
}

class _AnimationScreen7State extends State<AnimationScreen7>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation textAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    textAnimation = TextStyleTween(
            begin: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
            end: TextStyle(
                fontSize: 50.sp,
                color: Colors.black,
                fontWeight: FontWeight.w700))
        .animate(controller);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Screen 7"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: AnimatedDefaultTextStyle(
                  child: Text(
                      "Hello! Welcome Tutorial.This is basic demonstration of animation in Flutter"),
                  style: textAnimation.value,
                  duration: Duration(seconds: 0)),
            ),
            ZoomTapAnimation(
              child: Container(
                width: double.infinity,
                height: 50.h,
                color: Colors.grey,
                child: Center(child: Text("Bigger text")),
              ),
              onTap: () {
                controller.forward();
              },
            )
          ],
        ),
      ),
    );
  }
}
