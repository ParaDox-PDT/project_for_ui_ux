import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationScreen8 extends StatefulWidget {
  const AnimationScreen8({super.key});

  @override
  State<AnimationScreen8> createState() => _AnimationScreen8State();
}

class _AnimationScreen8State extends State<AnimationScreen8>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation opacityAnimation;
  late Animation opacityAnimation2;
  bool isTapped = true;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 0));

    opacityAnimation = Tween(begin: 1.0, end: 0.0).animate(controller);
    opacityAnimation2 = Tween(begin: 0.0, end: 1.0).animate(controller);

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Screen 8"),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity:isTapped? opacityAnimation.value:opacityAnimation2.value,
          duration: Duration(seconds: 3),
          child: Container(
            width: 250.w,
            height: 250.h,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          isTapped=!isTapped;
          controller.reset();
          controller.forward();

        },
        child: Icon(isTapped?Icons.visibility_off:Icons.visibility),
      ),
    );
  }
}
