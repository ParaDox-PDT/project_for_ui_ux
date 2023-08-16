import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/ui/screens/emojis_screen.dart';
import 'package:flutter_defualt_project/ui/screens/snowman_screen.dart';
import 'package:flutter_defualt_project/ui/screens/uzbekistan_flag_screen.dart';
import 'home/home_screen.dart';

class RouteNames {
  static const String homeScreen = "/";
  static const String uzbekFlagScreen = "/uz_flag_screen";
  static const String snowManScreen = "/snowman_screen";
  static const String emojisScreen = "/emojis_screen";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteNames.uzbekFlagScreen:
        return MaterialPageRoute(
          builder: (context) => const UzbekistanFlagScreen(),
        );
      case RouteNames.snowManScreen:
        return MaterialPageRoute(
          builder: (context) =>  SnowManScreen(),
        );
      case RouteNames.emojisScreen:
        return MaterialPageRoute(
          builder: (context) => const EmojisScreen(),
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
