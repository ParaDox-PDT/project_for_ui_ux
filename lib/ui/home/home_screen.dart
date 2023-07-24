import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/ui/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> routNames = [
    RouteNames.animationScreen1,
    RouteNames.animationScreen2,
    RouteNames.animationScreen3,
    RouteNames.animationScreen4,
    RouteNames.animationScreen5,
    RouteNames.animationScreen6,
    RouteNames.animationScreen7,
    RouteNames.animationScreen8,
    RouteNames.animationScreen9,
    RouteNames.animationScreen10,
    RouteNames.animationScreen11,
    RouteNames.animationScreen12,
    RouteNames.animationScreen13,
    RouteNames.animationScreen14,
    RouteNames.animationScreen15,
    RouteNames.animationScreen16,
    RouteNames.animationScreen17,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Screen",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ...List.generate(
                  routNames.length,
                  (index) => ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, routNames[index]);
                    },
                    title: Text(
                      "Animation ${index + 1}",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
