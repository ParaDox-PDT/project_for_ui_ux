import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationScreen17 extends StatefulWidget {
  const AnimationScreen17({super.key});

  @override
  State<AnimationScreen17> createState() => _AnimationScreen17State();
}

class _AnimationScreen17State extends State<AnimationScreen17>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controller2;
  late Animation rateSizedBox;
  late Animation rateLogo;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    controller2 =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    rateSizedBox = Tween(begin: 0.0, end: 2.0 * pi).animate(controller);
    rateLogo = Tween(begin: 2.0 * pi, end: 0.0).animate(controller2);
    controller2.addListener(() {
      setState(() {});
    });

    controller.addListener(() {
      setState(() {
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Screen 17"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: rateSizedBox.value,
              child: SizedBox(
                width: 300.w,
                height: 350.h,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Transform.rotate(
                        angle: rateLogo.value,
                        child: FlutterLogo(
                          size: 100.r,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Transform.rotate(
                        angle: rateLogo.value,
                        child: FlutterLogo(
                          size: 100.r,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Transform.rotate(
                        angle: rateLogo.value,
                        child: FlutterLogo(
                          size: 100.r,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Transform.rotate(
                        angle: rateLogo.value,
                        child: FlutterLogo(
                          size: 100.r,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restart_alt),
        onPressed: (){
          controller.reset();
          controller2.reset();
          controller.forward();
          controller2.forward();
        },
      ),
    );
  }
}
