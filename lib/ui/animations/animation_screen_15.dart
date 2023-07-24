import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationScreen15 extends StatefulWidget {
  const AnimationScreen15({super.key});

  @override
  State<AnimationScreen15> createState() => _AnimationScreen15State();
}

class _AnimationScreen15State extends State<AnimationScreen15>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation decorationAnimation;
  bool isTapped = false;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    decorationAnimation = DecorationTween(
      begin: BoxDecoration(
          border: Border.all(width: 5, color: Colors.black),
          color: Colors.white,
          borderRadius: BorderRadius.circular(0)),
      end: BoxDecoration(
          border: Border.all(width: 5, color: Colors.black),
          color: Colors.black,
          borderRadius: BorderRadius.circular(20.r)),
    ).animate(controller);

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation Screen 15")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 0),
              width: 200.w,
              height: 200.h,
              child: FlutterLogo(
                size: 150,
              ),
              decoration: decorationAnimation.value,
            ),
            ElevatedButton(
                onPressed: () {
                  isTapped ? controller.reverse() : controller.forward();
                  isTapped = !isTapped;
                },
                child: Text(
                  "Click me",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
