import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationScreen8 extends StatefulWidget {
  const AnimationScreen8({super.key});

  @override
  State<AnimationScreen8> createState() => _AnimationScreen8State();
}

class _AnimationScreen8State extends State<AnimationScreen8> {
  bool isTapped = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Screen 8"),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: isTapped ? 0.0 : 1.0,
          duration: Duration(seconds: 3),
          child: Container(
            width: 250.w,
            height: 250.h,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isTapped = !isTapped;
          });
        },
        child: Icon(Icons.flip),
      ),
    );
  }
}
