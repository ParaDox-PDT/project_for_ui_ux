import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationScreen10 extends StatefulWidget {
  const AnimationScreen10({super.key});

  @override
  State<AnimationScreen10> createState() => _AnimationScreen10State();
}

class _AnimationScreen10State extends State<AnimationScreen10>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation decorationAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3)
    );
    decorationAnimation = DecorationTween(
            begin: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 5, color: Colors.orange),
                color: Colors.yellow),
            end: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 50, color: Colors.red),
                color: Colors.deepPurple))
        .animate(controller);

    controller.addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Screen 10"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 0),
          width: 200.w,
          height: 200.h,
          decoration: decorationAnimation.value,
        ),
      ),
    );
  }
}
