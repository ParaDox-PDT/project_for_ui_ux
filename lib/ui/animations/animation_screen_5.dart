import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationScreen5 extends StatefulWidget {
  const AnimationScreen5({super.key});

  @override
  State<AnimationScreen5> createState() => _AnimationScreen5State();
}

class _AnimationScreen5State extends State<AnimationScreen5>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation colorAnimation;
  late Animation borderAnimation;
  late Animation borderRadiusAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    colorAnimation = ColorTween(
      begin: Colors.yellowAccent,
      end: Colors.blueAccent,
    ).animate(controller);

    borderAnimation = BorderTween(
            end: Border.all(width: 1, color: Colors.black),
            begin: Border.all(width: 20, color: Colors.red))
        .animate(controller);
    
    borderRadiusAnimation=Tween(begin: 0.0,end: 100.0).animate(controller);

    controller.addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Screen 5"),
      ),
      body: Center(
        child: Container(
          width: 200.w,
          height: 200.h,
          decoration: BoxDecoration(
            color: colorAnimation.value,
            borderRadius:BorderRadius.circular(borderRadiusAnimation.value) ,
            border: borderAnimation.value
          ),
        ),
      )
    );
  }
}
