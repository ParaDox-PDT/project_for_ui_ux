import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/ui/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

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
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Lato"),
        ),
        centerTitle: true,
        elevation: 10,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity,),
          ZoomTapAnimation(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.uzbekFlagScreen);
            },
            child: Container(
              width: 200.w,
              height: 60.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Colors.tealAccent,
                  border: Border.all(width: 1.w, color: Colors.black)),
              child: Center(
                child: Text(
                  "Uzbekistan's flag",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Lato"),
                ),
              ),
            ),
          ),
          SizedBox(height: 40.h,),
          ZoomTapAnimation(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.snowManScreen);
            },
            child: Container(
              width: 200.w,
              height: 60.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Colors.tealAccent,
                  border: Border.all(width: 1.w, color: Colors.black)),
              child: Center(
                child: Text(
                  "Snow man",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Lato"),
                ),
              ),
            ),
          ),
          SizedBox(height: 40.h,),
          ZoomTapAnimation(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.emojisScreen);
            },
            child: Container(
              width: 200.w,
              height: 60.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Colors.tealAccent,
                  border: Border.all(width: 1.w, color: Colors.black)),
              child: Center(
                child: Text(
                  "Emojis",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Lato"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
