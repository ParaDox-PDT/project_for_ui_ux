import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/models/dynamic_view_models/dynamic_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/utils/utils.dart';

import '../../utils/view_model/country_provider.dart';

class DynamicViewsScreen extends StatefulWidget {
  const DynamicViewsScreen({super.key});

  @override
  State<DynamicViewsScreen> createState() => _DynamicViewsScreenState();
}

class _DynamicViewsScreenState extends State<DynamicViewsScreen> {

  _init() async {
    context.read<CountryProvider>().getAllDynamicViews();
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
          "Dynamic Views",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: context.watch<CountryProvider>().isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                ...List.generate(
                    context.read<CountryProvider>().dynamicViews.length,
                    (index) {
                  DynamicViewModel dynamicViewModel =
                      context.read<CountryProvider>().dynamicViews[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    width: dynamicViewModel.width.w,
                    height: dynamicViewModel.height.h,
                    color: Color(int.parse("FF${dynamicViewModel.color.substring(1)}",radix: 16)),
                    child: Center(
                      child: Text(
                        dynamicViewModel.type,
                        style: TextStyle(fontSize: 20.sp, color: Colors.white),
                      ),
                    ),
                  );
                })
              ],
            ),
    );
  }
}
