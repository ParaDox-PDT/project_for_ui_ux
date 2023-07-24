import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AnimationScreen12 extends StatefulWidget {
  const AnimationScreen12({super.key});

  @override
  State<AnimationScreen12> createState() => _AnimationScreen12State();
}

class _AnimationScreen12State extends State<AnimationScreen12>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation paddingAnimation;
  bool isTapped=false;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    paddingAnimation = Tween(begin: 10.0, end: 100.0).animate(controller);

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Screen 12"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ZoomTapAnimation(
            onTap: (){
              isTapped?controller.reverse(): controller.forward();
              setState(() {

                isTapped=!isTapped;
              });

            },
            child: AnimatedPadding(
                padding: EdgeInsets.symmetric(horizontal: paddingAnimation.value),
                child: Container(
                  height: 100.h,
                  width: double.infinity,
                  color: Colors.blueAccent,
                ),
                duration: Duration(seconds: 0)),
          )
        ],
      ),
    );
  }
}
