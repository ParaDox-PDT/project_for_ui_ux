import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/ui/animations/animation_screen_1.dart';
import 'package:flutter_defualt_project/ui/animations/animation_screen_2.dart';
import 'package:flutter_defualt_project/ui/animations/animation_screen_3.dart';
import 'package:flutter_defualt_project/ui/animations/animation_screen_4.dart';

import 'home/home_screen.dart';

class RouteNames {
  static const String homeScreen = "/";
  static const String animationScreen1 = "/animation_screen_1";
  static const String animationScreen2 = "/animation_screen_2";
  static const String animationScreen3 = "/animation_screen_3";
  static const String animationScreen4 = "/animation_screen_4";
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
