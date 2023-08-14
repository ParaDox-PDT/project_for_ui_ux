import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/ui/app_routes.dart';
import 'package:flutter_defualt_project/utils/view_model/country_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _init() async {
    context.read<CountryProvider>().getAllCountry();
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Home Screen",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ZoomTapAnimation(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.countriesScreen);
                },
                child: Container(
                  width: 200.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.tealAccent,
                      border: Border.all(width: 1, color: Colors.black)),
                  child: Center(
                    child: Text(
                      "Countries",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 24.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h,),
              ZoomTapAnimation(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.companiesScreen);
                },
                child: Container(
                  width: 200.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.tealAccent,
                      border: Border.all(width: 1, color: Colors.black)),
                  child: Center(
                    child: Text(
                      "Companies",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 24.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h,),
              ZoomTapAnimation(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.dynamicView);
                },
                child: Container(
                  width: 200.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.tealAccent,
                      border: Border.all(width: 1, color: Colors.black)),
                  child: Center(
                    child: Text(
                      "Dynamic Views",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 24.sp),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
