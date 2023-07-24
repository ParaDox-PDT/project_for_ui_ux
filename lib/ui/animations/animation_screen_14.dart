import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationScreen14 extends StatefulWidget {
  const AnimationScreen14({super.key});

  @override
  State<AnimationScreen14> createState() => _AnimationScreen14State();
}

class _AnimationScreen14State extends State<AnimationScreen14>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation colorAnimation;
  late Animation sizeAnimation;
  late Animation<double> percentAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow)
        .animate(animationController);
    sizeAnimation = Tween(begin: 0.0, end: 350.0.w).animate(animationController);
    percentAnimation =
        Tween<double>(begin: 0.0, end: 100.0).animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animation Screen 14")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200.w,
              height: 200.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: colorAnimation.value),
            ),
            const SizedBox(height: 50,),
            Stack(
              children: [
                Container(
                  height: 50.h,
                  width: 350.w,
                  color: Colors.blue.withOpacity(0.7),
                ),
                Container(
                  height: 50.h,
                  width: sizeAnimation.value,
                  color: Colors.blueAccent,
                )
              ],
            ),
            const SizedBox(height: 20,),
            Text(
              "${percentAnimation.value.toInt()} %",
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  animationController.reset();
                  animationController.forward();
                },
                child: const Text("Animate"))
          ],
        ),
      ),
    );
  }
}
