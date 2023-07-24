import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationScreen11 extends StatefulWidget {
  const AnimationScreen11({super.key});

  @override
  State<AnimationScreen11> createState() => _AnimationScreen11State();
}

class _AnimationScreen11State extends State<AnimationScreen11>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation alignAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3)
    );

    alignAnimation = AlignmentTween(
            begin: Alignment.topLeft, end: Alignment.bottomRight)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceIn));
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animation Screen 11")),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300.w,
              height: 300.h,
              color: Colors.indigo,
              child: AnimatedAlign(
                alignment: alignAnimation.value,
                duration: const Duration(seconds: 0),
                child: const Text("ParaDox",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextButton(
                onPressed: () {
                  controller.reset();
                  controller.forward();
                },
                child: const Text(
                  "Change align",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ))
          ],
        ),
      ),
    );
  }
}
