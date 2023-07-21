import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AnimationScreen3 extends StatefulWidget {
  const AnimationScreen3({super.key});

  @override
  State<AnimationScreen3> createState() => _AnimationScreen3State();
}

class _AnimationScreen3State extends State<AnimationScreen3>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation colorAnimation;
  late Animation sizeHeightAnimation;
  late Animation sizeWidthAnimation;
  late Animation borderAnimation;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    colorAnimation = ColorTween(begin: Colors.red, end: Colors.green)
        .animate(animationController);

    sizeHeightAnimation = Tween<double>(begin: 300.0.w, end: 50.0.w).animate(
        CurvedAnimation(parent: animationController,
            curve: Curves.linear,
            reverseCurve: Curves.linear))..addListener(() {

    });
    sizeWidthAnimation = Tween<double>(begin: 100.0.w, end: 300.0.w).animate(
        CurvedAnimation(parent: animationController,
            curve: Curves.linear,
            reverseCurve: Curves.linear))..addListener(() {

    });


    borderAnimation =
        Tween<double>(begin: 5.0, end: 50.0).animate(animationController);

    animationController.addListener(() {

    });

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Animation 3",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: ZoomTapAnimation(
          onTap: (){
            setState(() {

            });
          },
          child: AnimatedContainer(
            height: sizeHeightAnimation.value,
            width: sizeWidthAnimation.value,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderAnimation.value),
              color: colorAnimation.value
            ), duration: const Duration(seconds: 1),
          ),
        ),
      ),
    );
  }
}
