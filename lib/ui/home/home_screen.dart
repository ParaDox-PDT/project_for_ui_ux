import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/ui/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          ...List.generate(
            4,
            (index) => ListTile(
              onTap: () {
                if (index == 0) {
                  Navigator.pushNamed(context, RouteNames.animationScreen1);
                } else if (index == 1) {
                  Navigator.pushNamed(context, RouteNames.animationScreen2);
                } else if (index == 2) {
                  Navigator.pushNamed(context, RouteNames.animationScreen3);
                } else {
                  Navigator.pushNamed(context, RouteNames.animationScreen4);
                }
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
    );
  }
}
