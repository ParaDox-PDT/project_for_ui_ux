import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AnimationScreen6 extends StatefulWidget {
  const AnimationScreen6({super.key});

  @override
  State<AnimationScreen6> createState() => _AnimationScreen6State();
}

class _AnimationScreen6State extends State<AnimationScreen6>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation alignAnimation1;
  late Animation alignAnimation2;
  late Animation widthAnimation;
  late Animation widthAnimation2;
  late Animation heightAnimation;
  late Animation heightAnimation2;
  bool isVisible1 = true;
  bool isVisible2 = true;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    alignAnimation1 =
        AlignmentTween(begin: Alignment.topLeft, end: Alignment.bottomRight)
            .animate(animationController);
    alignAnimation2 =
        AlignmentTween(begin: Alignment.bottomRight, end: Alignment.topLeft)
            .animate(animationController);
    widthAnimation =
        Tween(begin: 100.w, end: 200.w).animate(animationController);
    widthAnimation2 =
        Tween(begin: 200.w, end: 100.w).animate(animationController);
    heightAnimation =
        Tween(begin: 100.h, end: 120.h).animate(animationController);
    heightAnimation2 =
        Tween(begin: 120.h, end: 100.h).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Screen 6"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              width: 400.w,
              height: 670.h,
              child: Stack(
                children: [
                  isVisible1
                      ? Align(
                          alignment: alignAnimation1.value,
                          child: ZoomTapAnimation(
                              onTap: () {
                                isVisible2 = false;
                                setState(() {});
                                animationController.forward();
                              },
                              child: AnimatedContainer(
                                width: widthAnimation.value,
                                height: heightAnimation.value,
                                color: Colors.blue,
                                duration: const Duration(seconds: 0),
                              )),
                        )
                      : const SizedBox(
                          height: 0,
                        ),
                  isVisible2
                      ? Align(
                          alignment: alignAnimation2.value,
                          child: ZoomTapAnimation(
                              onTap: () {
                                isVisible1 = false;
                                setState(() {});
                                animationController.forward();
                              },
                              child: AnimatedContainer(
                                duration: const Duration(seconds: 0),
                                width: widthAnimation2.value,
                                height: heightAnimation2.value,
                                color: Colors.blue,
                              )),
                        )
                      : const SizedBox(
                          height: 0,
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
