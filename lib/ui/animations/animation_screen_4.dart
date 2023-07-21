import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AnimationScreen4 extends StatefulWidget {
  const AnimationScreen4({super.key});

  @override
  State<AnimationScreen4> createState() => _AnimationScreen4State();
}

class _AnimationScreen4State extends State<AnimationScreen4>
    with SingleTickerProviderStateMixin {
  bool selected=false;
  late AnimationController animationController;
  late Animation colorAnimation;
  late Animation textAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    colorAnimation = ColorTween(begin: Colors.orangeAccent, end: Colors.green)
        .animate(animationController);


    animationController.addListener(() {});
    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Animation 4",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: ZoomTapAnimation(
          onTap: (){
            selected=!selected;
            setState(() {

            });
          },
          child: AnimatedContainer(
            width: 200.w,
            height: 200.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: colorAnimation.value),
            duration: const Duration(seconds: 1),
            child: Center(
              child: Text(
                selected?"This is First Widget":"This is Second Widget",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
