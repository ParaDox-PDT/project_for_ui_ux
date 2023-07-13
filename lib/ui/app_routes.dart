import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/ui/home_2/home_screen_2.dart';

class RouteNames {
  static const String homeScreen2 = "/";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen2:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen2(),
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
