import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AnimationScreen9 extends StatefulWidget {
  const AnimationScreen9({super.key});

  @override
  State<AnimationScreen9> createState() => _AnimationScreen9State();
}

class _AnimationScreen9State extends State<AnimationScreen9>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation textAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    textAnimation = TextStyleTween(
            begin: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            end: TextStyle(
                fontSize: 50.sp,
                color: Colors.red,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic))
        .animate(controller);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Screen 9"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Center(
                child: AnimatedDefaultTextStyle(
                    child: Text("Hello Flutter World!",textAlign: TextAlign.center,),
                    style: textAnimation.value,
                    duration: Duration(seconds: 0)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ZoomTapAnimation(
                  onTap: (){
                    controller.forward();
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.r),
                    child: Icon(Icons.play_arrow),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Colors.indigo),
                  ),
                ),
                SizedBox(width: 30.w,),
                ZoomTapAnimation(
                  onTap: (){
                    controller.reverse();
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.r),
                    child: Icon(Icons.restore),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Colors.indigo),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
