import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AnimationScreen2 extends StatefulWidget {
  const AnimationScreen2({super.key});

  @override
  State<AnimationScreen2> createState() => _AnimationScreen2State();
}

class _AnimationScreen2State extends State<AnimationScreen2> {
  bool top = false;
  bool center1=true;
  bool center2=true;
  bool right=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Animation 2",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300.w,
              height: 350.h,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(seconds: 1),
                    width: 100.w,
                    height: 100.h,
                    top: center2? 125.h:top?50.h:200.h,
                    right: center1? 100.w:right?10.w:190.w,
                    curve: Curves.linear,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Colors.blueAccent
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 150.h,),
            Column(
              children: [
                ZoomTapAnimation(
                  onTap: (){
                    center1=true;
                    center2=false;
                    top=true;
                    setState(() {

                    });
                  },
                  child: Container(
                    width: 100.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),color: Colors.grey
                    ),
                    child: Icon(Icons.keyboard_arrow_up),
                  ),
                ),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ZoomTapAnimation(
                      onTap: (){
                        center1=false;
                        center2=true;
                        right=false;
                        setState(() {

                        });
                      },
                      child: Container(
                        width: 100.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),color: Colors.grey
                        ),
                        child: Icon(Icons.keyboard_arrow_left),
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: (){
                        center1=true;
                        center2=true;
                        setState(() {

                        });
                      },
                      child: Container(
                        width: 100.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),color: Colors.grey
                        ),
                        child: Icon(Icons.circle_outlined),
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: (){
                        center1=false;
                        center2=true;
                        right=true;
                        setState(() {

                        });
                      },
                      child: Container(
                        width: 100.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),color: Colors.grey
                        ),
                        child: Icon(Icons.keyboard_arrow_right),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.h,),
                ZoomTapAnimation(
                  onTap: (){
                    center1=true;
                    center2=false;
                    top=false;
                    setState(() {

                    });
                  },
                  child: Container(
                    width: 100.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),color: Colors.grey
                    ),
                    child: Icon(Icons.keyboard_arrow_down),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
