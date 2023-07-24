import 'package:flutter/material.dart';

class AnimationScreen13 extends StatefulWidget {
  const AnimationScreen13({super.key});

  @override
  State<AnimationScreen13> createState() => _AnimationScreen13State();
}

class _AnimationScreen13State extends State<AnimationScreen13>  with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(seconds: 3));

    sizeAnimation=Tween(begin: 100.0,end: 300.0).animate(controller);
    controller.addListener(() {setState(() {

    });});

    controller.forward();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation Screen 13")),
      body: Center(
        child: AnimatedSize(
          duration: Duration(seconds: 0),
          child: Container(
            color: Colors.yellow,
            child: FlutterLogo(size: sizeAnimation.value,),
          ),
        ),
      ),
    );
  }
}
