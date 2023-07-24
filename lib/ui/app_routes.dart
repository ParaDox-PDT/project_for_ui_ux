import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/ui/animations/animation_screen_1.dart';
import 'package:flutter_defualt_project/ui/animations/animation_screen_10.dart';
import 'package:flutter_defualt_project/ui/animations/animation_screen_11.dart';
import 'package:flutter_defualt_project/ui/animations/animation_screen_12.dart';
import 'package:flutter_defualt_project/ui/animations/animation_screen_13.dart';
import 'package:flutter_defualt_project/ui/animations/animation_screen_14.dart';
import 'package:flutter_defualt_project/ui/animations/animation_screen_15.dart';
import 'package:flutter_defualt_project/ui/animations/animation_screen_16.dart';
import 'package:flutter_defualt_project/ui/animations/animation_screen_17.dart';
import 'package:flutter_defualt_project/ui/animations/animation_screen_2.dart';
import 'package:flutter_defualt_project/ui/animations/animation_screen_3.dart';
import 'package:flutter_defualt_project/ui/animations/animation_screen_4.dart';
import 'package:flutter_defualt_project/ui/animations/animation_screen_6.dart';
import 'package:flutter_defualt_project/ui/animations/animation_screen_7.dart';
import 'package:flutter_defualt_project/ui/animations/animation_screen_8.dart';
import 'package:flutter_defualt_project/ui/animations/animation_screen_9.dart';

import 'animations/animation_screen_5.dart';
import 'home/home_screen.dart';

class RouteNames {
  static const String homeScreen = "/";
  static const String animationScreen1 = "/animation_screen_1";
  static const String animationScreen2 = "/animation_screen_2";
  static const String animationScreen3 = "/animation_screen_3";
  static const String animationScreen4 = "/animation_screen_4";
  static const String animationScreen5 = "/animation_screen_5";
  static const String animationScreen6 = "/animation_screen_6";
  static const String animationScreen7 = "/animation_screen_7";
  static const String animationScreen8 = "/animation_screen_8";
  static const String animationScreen9 = "/animation_screen_9";
  static const String animationScreen10 = "/animation_screen_10";
  static const String animationScreen11 = "/animation_screen_11";
  static const String animationScreen12 = "/animation_screen_12";
  static const String animationScreen13 = "/animation_screen_13";
  static const String animationScreen14 = "/animation_screen_14";
  static const String animationScreen15 = "/animation_screen_15";
  static const String animationScreen16 = "/animation_screen_16";
  static const String animationScreen17 = "/animation_screen_17";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteNames.animationScreen1:
        return MaterialPageRoute(
          builder: (context) => const AnimationScreen1(),
        );
      case RouteNames.animationScreen2:
        return MaterialPageRoute(
          builder: (context) => const AnimationScreen2(),
        );
      case RouteNames.animationScreen3:
        return MaterialPageRoute(
          builder: (context) => const AnimationScreen3(),
        );
      case RouteNames.animationScreen4:
        return MaterialPageRoute(
          builder: (context) => const AnimationScreen4(),
        );
      case RouteNames.animationScreen5:
        return MaterialPageRoute(
          builder: (context) => const AnimationScreen5(),
        );
      case RouteNames.animationScreen6:
        return MaterialPageRoute(
          builder: (context) => const AnimationScreen6(),
        );
      case RouteNames.animationScreen7:
        return MaterialPageRoute(
          builder: (context) => const AnimationScreen7(),
        );
      case RouteNames.animationScreen8:
        return MaterialPageRoute(
          builder: (context) => const AnimationScreen8(),
        );
      case RouteNames.animationScreen9:
        return MaterialPageRoute(
          builder: (context) => const AnimationScreen9(),
        );
      case RouteNames.animationScreen10:
        return MaterialPageRoute(
          builder: (context) => const AnimationScreen10(),
        );
      case RouteNames.animationScreen11:
        return MaterialPageRoute(
          builder: (context) => const AnimationScreen11(),
        );
      case RouteNames.animationScreen12:
        return MaterialPageRoute(
          builder: (context) => const AnimationScreen12(),
        );
      case RouteNames.animationScreen13:
        return MaterialPageRoute(
          builder: (context) => const AnimationScreen13(),
        );
      case RouteNames.animationScreen14:
        return MaterialPageRoute(
          builder: (context) => const AnimationScreen14(),
        );
      case RouteNames.animationScreen15:
        return MaterialPageRoute(
          builder: (context) => const AnimationScreen15(),
        );
      case RouteNames.animationScreen16:
        return MaterialPageRoute(
          builder: (context) => const AnimationScreen16(),
        );
      case RouteNames.animationScreen17:
        return MaterialPageRoute(
          builder: (context) => const AnimationScreen17(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not found!"),
            ),
          ),
        );
    }
  }
}
